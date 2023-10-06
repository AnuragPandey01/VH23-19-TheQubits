import 'package:flutter/material.dart';
import 'package:studycate/constants.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
        child: Container(),
      ),
    );
  }
}
