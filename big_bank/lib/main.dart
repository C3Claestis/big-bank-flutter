import 'package:big_bank/page/signin_page.dart';
import 'package:big_bank/page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,      
      initialRoute: AppRoutes.signIn,
      routes: {
        AppRoutes.signIn: (context) => const SigninPage(),
        AppRoutes.signUp: (context) => const SignupPage(),
      },
    );
  }
}

class AppRoutes {
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
}