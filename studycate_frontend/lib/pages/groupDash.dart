import 'dart:async';

import 'package:flutter/material.dart';
import 'package:studycate/classes/group.dart';
import 'package:studycate/constants.dart';

class GroupDashPage extends StatefulWidget {
  final Group group;
  const GroupDashPage({required this.group, super.key});

  @override
  State<GroupDashPage> createState() => _GroupDashPageState();
}

class _GroupDashPageState extends State<GroupDashPage> {
  @override
  void initState() {
    Timer mytimer = Timer.periodic(const Duration(seconds: 10), (timer) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
