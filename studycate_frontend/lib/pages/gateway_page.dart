import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studycate/pages/introduction_page.dart';
import 'package:studycate/pages/login_page.dart';

class GatewayPage extends StatefulWidget {
  const GatewayPage({super.key});

  @override
  State<GatewayPage> createState() => _GatewayPageState();
}

class _GatewayPageState extends State<GatewayPage> {
  SharedPreferences? prefs;

  @override
  void initState() async {
    prefs = await SharedPreferences.getInstance();
    final bool? loggedIn = prefs!.getBool('loggedIn');
    if (loggedIn == null) {
      await prefs!.setBool('loggedIn', false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (prefs!.getBool('loggedIn') == false) {
      return const IntroductionPage();
    } else {
      return const LoginPage();
    }
  }
}
