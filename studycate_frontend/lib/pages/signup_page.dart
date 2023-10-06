import 'dart:developer';

import 'package:ensure_visible_when_focused/ensure_visible_when_focused.dart';
import 'package:flutter/material.dart';
import 'package:studycate/classes/user.dart';
import 'package:studycate/constants.dart';
import 'package:studycate/functions.dart';
import 'package:studycate/widgets/btn.dart';
import 'package:studycate/widgets/tabbar.dart';
import 'package:studycate/widgets/txtField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController instName = TextEditingController();
  TextEditingController instType = TextEditingController();
  TextEditingController grade = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  FocusNode fn = FocusNode();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.chevron_left, color: textColor),
              ),
            ),
            title: const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Create an account",
                style: TextStyle(
                  color: Color(0xFFB7B7B7),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: tabBar.preferredSize,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 15.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: darkerTextColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: tabBar,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: bgColor,
        body: TabBarView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TxtField(
                            name: "Enter your name",
                            hintText: "First name",
                            toggle: false,
                            controller: firstName,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: TxtField(
                            name: "",
                            hintText: "Last name",
                            toggle: false,
                            controller: lastName,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TxtField(
                      name: "School Name",
                      hintText: "Enter your School Name",
                      toggle: false,
                      controller: instName,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TxtField(
                      name: "Grade",
                      hintText: "Enter your Grade",
                      toggle: false,
                      controller: grade,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TxtField(
                      name: "Email ID",
                      hintText: "Enter your Email Address",
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
                      height: 20,
                    ),
                    TxtField(
                      name: "Confirm Password",
                      hintText: "Enter your password again",
                      toggle: true,
                      controller: confirmPassword,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Btn(
                      text: "Sign Up",
                      onTap: () async {
                        if (password.text == confirmPassword.text) {
                          User user = User(
                            firstName: firstName.text,
                            lastName: lastName.text,
                            email: email.text,
                            profileImg: "",
                            instName: instName.text,
                            isClgStud: false,
                            branch: "",
                            year: 0,
                            password: password.text,
                          );
                          await signUp(user, context);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 160,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TxtField(
                            name: "Enter your name",
                            hintText: "First name",
                            toggle: false,
                            controller: firstName,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: TxtField(
                            name: "",
                            hintText: "Last name",
                            toggle: false,
                            controller: lastName,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TxtField(
                      name: "College/ University Name",
                      hintText: "Enter your College/ University Name",
                      toggle: false,
                      controller: instName,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TxtField(
                            name: "Enter your year",
                            hintText: "Year",
                            toggle: false,
                            controller: year,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: TxtField(
                            name: "and branch",
                            hintText: "Branch",
                            toggle: false,
                            controller: branch,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TxtField(
                      name: "Email ID",
                      hintText: "Enter your Email Address",
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
                      height: 20,
                    ),
                    TxtField(
                      name: "Confirm Password",
                      hintText: "Enter your password again",
                      toggle: true,
                      controller: confirmPassword,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Btn(
                      text: "Sign Up",
                      onTap: () async {
                        if (password.text == confirmPassword.text) {
                          User user = User(
                            firstName: firstName.text,
                            lastName: lastName.text,
                            email: email.text,
                            profileImg: "",
                            instName: instName.text,
                            isClgStud: true,
                            branch: branch.text,
                            year: int.parse(year.text),
                            password: password.text,
                          );
                          await signUp(user, context);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
