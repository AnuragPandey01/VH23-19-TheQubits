import 'package:flutter/material.dart';
import 'package:studycate/constants.dart';
import 'package:studycate/functions.dart';
import 'package:studycate/widgets/btn.dart';
import 'package:studycate/widgets/txtField.dart';

class createGroupPage extends StatefulWidget {
  const createGroupPage({super.key});

  @override
  State<createGroupPage> createState() => _createGroupPageState();
}

class _createGroupPageState extends State<createGroupPage> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
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
            "Create a Group",
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
              name: "Name",
              hintText: "Enter a name for your group",
              toggle: false,
              controller: name,
            ),
            const SizedBox(
              height: 20,
            ),
            TxtField(
              name: "Description",
              hintText: "Enter a description for your group",
              toggle: false,
              controller: description,
            ),
            const SizedBox(
              height: 40,
            ),
            Btn(
              text: "Create Group",
              onTap: () async {
                await newGroup(
                    name.text, description.text, loggedInUser.id!, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
