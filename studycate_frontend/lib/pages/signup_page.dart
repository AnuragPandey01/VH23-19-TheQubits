import 'package:flutter/material.dart';
import 'package:studycate/constants.dart';
import 'package:studycate/widgets/btn.dart';
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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.chevron_left, color: textColor),
        ),
      ),
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.09,
          left: 30.0,
          right: 30.0,
          bottom: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Create an account",
                style: TextStyle(
                  color: Color(0xFFB7B7B7),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            DefaultTabController(
              length: 2,
              child: TabBar(
                unselectedLabelColor: Colors.redAccent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.redAccent,
                ),
                indicatorColor: Colors.transparent,
                tabs: const [
                  Tab(text: "School"),
                  Tab(text: "College"),
                ],
              ),
            ),
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
                const SizedBox(width: 15),
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
              name: "Institution Name",
              hintText: "School/ College/ University Name",
              toggle: false,
              controller: instName,
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
            const Btn(text: "Sign Up"),
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
                    onTap: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
