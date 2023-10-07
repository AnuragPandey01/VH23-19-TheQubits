import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:studycate/classes/group.dart';
import 'package:studycate/classes/user.dart' as User;
import 'package:studycate/constants.dart';
import 'package:studycate/widgets/txtField.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> login(String email, String password, BuildContext context) async {
  var response = await http.post(
    loginUri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": email,
      "password": password,
    }),
  );
  if (response.statusCode == 200) {
    loggedInUser = User.User.fromJson(jsonDecode(response.body));
    var responsegrps = await http.post(
      groupsUri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "userId": loggedInUser.id,
      }),
    );
    Iterable l = jsonDecode(responsegrps.body);
    groups = (json.decode(responsegrps.body) as List)
        .map((i) => Group.fromJson(i))
        .toList();
    Navigator.of(context).popAndPushNamed('/home');
    updates();
    //38b8fc0c-0a9f-46c6-8177-fc01d49ad332
  } else {
    errorDlg(context, "Error", jsonDecode(response.body)['error']);
  }
}

Future<void> signUp(User.User user, BuildContext context) async {
  var response = await http.post(
    registerUri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(user.toJson()),
  );
  if (response.statusCode == 201) {
    Navigator.of(context).popAndPushNamed('/home');
  } else {
    errorDlg(context, "Error", jsonDecode(response.body)['msg']);
  }
}

Future<void> newGroup(
    String name, String desc, String adminId, BuildContext context) async {
  var obj = jsonEncode({
    'name': name,
    'desc': desc,
    'adminId': adminId,
    'members': [],
  });
  var response = await http.post(
    createGroupUri,
    headers: {"Content-Type": "application/json"},
    body: obj,
  );
  if (response.statusCode == 200) {
    Navigator.of(context).popAndPushNamed('/home');
  } else {
    errorDlg(context, "Error", jsonDecode(response.body)['msg']);
  }
}

void updates() {
  final supabase = Supabase.instance.client;
  supabase.channel('public:users').on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: 'public', table: 'users'),
    (payload, [ref]) {
      loggedInUser = payload['new'];
    },
  ).subscribe();
}

Future<void> refreshLib() async {
  final supabase = Supabase.instance.client;
  final List<FileObject> objects = await supabase.storage.from('qubits').list();
  inspect(objects);
  library = objects;
}

errorDlg(BuildContext context, String title, String content) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

TextEditingController _textFieldController = TextEditingController();

Future<String> displayTextInputDialog(
    String title, BuildContext context) async {
  String input = "";

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TxtField(
          controller: _textFieldController,
          name: "",
          hintText: "Invite Code",
          toggle: false,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text('Join'),
            onPressed: () {
              input = _textFieldController.text;
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
  _textFieldController.text = ""; //
  return input;
}
