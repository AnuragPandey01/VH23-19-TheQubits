import 'package:flutter/material.dart';
import 'package:studycate/pages/introduction_page.dart';
import 'package:studycate/pages/login_page.dart';
import 'package:studycate/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyCate',
      routes: {
        '/intro': (context) => const IntroductionPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD76528)),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
        fontFamily: 'Inter',
        textTheme: TextTheme(),
        useMaterial3: true,
      ),
      home: const IntroductionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
