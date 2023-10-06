import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studycate/classes/group.dart';
import 'package:studycate/classes/user.dart' as User;
import 'package:studycate/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

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
        "userId": "38b8fc0c-0a9f-46c6-8177-fc01d49ad332",
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

void updates() {
  supabase.channel('public:users').on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: 'public', table: 'users'),
    (payload, [ref]) {
      print('Change received: ${payload.toString()}');
    },
  ).subscribe();
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
