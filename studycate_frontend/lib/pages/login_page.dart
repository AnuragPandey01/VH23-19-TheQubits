import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studycate/constants.dart';
import 'package:studycate/functions.dart';
import 'package:studycate/widgets/btn.dart';
import 'package:studycate/widgets/txtField.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.chevron_left, color: textColor),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "Log In",
            style: TextStyle(
              color: Color(0xFFB7B7B7),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 30.0,
          right: 30.0,
          bottom: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TxtField(
              name: "Email",
              hintText: "Enter your email address",
              toggle: false,
              controller: email,
            ),
            const SizedBox(
              height: 20,
            ),
            TxtField(
              name: "Password",
              hintText: "Enter your password",
              toggle: true,
              controller: password,
            ),
            const SizedBox(
              height: 40,
            ),
            Btn(
              text: "Log In",
              onTap: () async {
                await login(email.text, password.text, context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: textColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: const Text(
                      "Sign Up!",
                      style: TextStyle(
                        color: themeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
