import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studycate/pages/home_page.dart';
import 'package:studycate/pages/introduction_page.dart';
import 'package:studycate/pages/login_page.dart';
import 'package:studycate/pages/signup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://ptcnslihjbbdkevoljqc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB0Y25zbGloamJiZGtldm9sanFjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY1NjM0MjAsImV4cCI6MjAxMjEzOTQyMH0._fH8zWLMamtGKEZ7gQTOZRH0smpCRN77iO69t7sEc3A',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'StudyCate',
        routes: {
          '/intro': (context) => const IntroductionPage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
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
      ),
    );
  }
}
