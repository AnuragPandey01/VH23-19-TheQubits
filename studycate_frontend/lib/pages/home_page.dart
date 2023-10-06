import 'package:flutter/material.dart';
import 'package:studycate/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: const Text(
              "Home, tap to logout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
