import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:studycate/constants.dart';

Future<http.Response> login(String email, String password) async {
  var response = await http.post(loginUri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": email,
        "body": password,
      }));
  return response;
}
