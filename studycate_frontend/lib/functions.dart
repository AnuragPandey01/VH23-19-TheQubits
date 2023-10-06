import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:studycate/classes/user.dart';
import 'package:studycate/constants.dart';

final user = StateProvider<User>((ref) => User());

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
    Navigator.of(context).popAndPushNamed('/home');
  } else {
    errorDlg(context, "Error", jsonDecode(response.body)['msg']);
  }
}

Future<void> signUp(User user, BuildContext context) async {
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

errorDlg(BuildContext context, String title, String content) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {},
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
