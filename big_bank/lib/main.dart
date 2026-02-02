import 'package:big_bank/page/auth/changePassSucces_page.dart';
import 'package:big_bank/page/auth/changepass_page.dart';
import 'package:big_bank/page/auth/forgotpas_page.dart';
import 'package:big_bank/page/auth/forgotpas_confirm_page.dart';
import 'package:big_bank/page/auth/signin_page.dart';
import 'package:big_bank/page/auth/signup_page.dart';
import 'package:big_bank/page/content/home_page.dart';
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
        AppRoutes.forgotPassword: (context) => const ForgotPasPage(),
        AppRoutes.forgotPasConfirm: (context) => const ForgotpasConfirmPage(),
        AppRoutes.changePassword: (context) => const ChangePassPage(),
        AppRoutes.changePassSuccess: (context) => const ChangepasssuccesPage(),
        AppRoutes.homePage: (context) => const HomePage(),
      },
    );
  }
}

class AppRoutes {
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const forgotPassword = '/forgot-password';
  static const forgotPasConfirm = '/forgot-password-confirm';
  static const changePassword = '/change-password';
  static const changePassSuccess = '/change-password-success';
  static const homePage = '/home';
}
