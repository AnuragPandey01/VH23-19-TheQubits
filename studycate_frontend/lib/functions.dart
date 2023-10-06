import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:studycate/classes/user.dart';
import 'package:studycate/constants.dart';

Future<http.Response> login(String email, String password) async {
  var response = await http.post(loginUri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }));
  return response;
}

Future<http.Response> signUp(User user) async {
  var response = await http.post(
    registerUri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(user.toJson()),
  );
  return response;
}
