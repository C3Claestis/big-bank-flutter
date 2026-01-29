import 'package:big_bank/main.dart';
import 'package:big_bank/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

/// 🔹 PROVIDER (WAJIB TOP-LEVEL)
final passwordObscureProvider = StateProvider<bool>((ref) => true);
final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscure = ref.watch(passwordObscureProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    final isEmailValid = email.isEmpty || _isValidEmail(email);
    final isFormValid =
        email.isNotEmpty && password.isNotEmpty && _isValidEmail(email);

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Appcolors.lightgray),
    );

    return Scaffold(
      backgroundColor: Appcolors.indigo,
      appBar: _appbar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Appcolors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Appcolors.indigo,
                  ),
                ),
                Text(
                  'Hello there, sign in to continue',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Appcolors.darkgray,
                  ),
                ),
                const Gap(32),

                /// 🔒 ICON
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE5E2FF),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svgs/gembok.svg',
                            width: 50,
                            height: 73,
                          ),
                        ),
                      ),
                      Positioned(
                        left: -30,
                        top: 50,
                        child: _dot(size: 10, color: Appcolors.teal),
                      ),
                      Positioned(
                        left: 30,
                        top: -10,
                        child: _dot(size: 10, color: Appcolors.indigo),
                      ),
                      Positioned(
                        right: -25,
                        top: 10,
                        child: _dot(size: 25, color: Appcolors.crimsonred),
                      ),
                      Positioned(
                        left: 15,
                        bottom: 10,
                        child: _dot(size: 20, color: Appcolors.yellowamber),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 20,
                        child: _dot(size: 10, color: Appcolors.dodgerblue),
                      ),
                    ],
                  ),
                ),

                const Gap(32),

                /// 📧 EMAIL
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    ref.read(emailProvider.notifier).state = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: isEmailValid
                        ? null
                        : 'Email format is not valid',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.lightgray,
                    ),
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),

                const Gap(20),

                /// 🔑 PASSWORD
                TextField(
                  obscureText: obscure,
                  onChanged: (value) {
                    ref.read(passwordProvider.notifier).state = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.lightgray,
                    ),
                    enabledBorder: border,
                    focusedBorder: border,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                        color: Appcolors.lightgray,
                      ),
                      onPressed: () {
                        ref.read(passwordObscureProvider.notifier).state =
                            !obscure;
                      },
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shadowColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: Text(
                      'Forgot your password ?',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Appcolors.lightgray,
                      ),
                    ),
                  ),
                ),
                const Gap(24),

                /// 🔘 SIGN IN BUTTON
                Opacity(
                  opacity: isFormValid ? 1.0 : 0.5,
                  child: SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: isFormValid ? () {} : null,
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Appcolors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(24),
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svgs/fingerprint.svg',
                      width: 64,
                      height: 64,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Appcolors.darkgray,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Appcolors.indigo,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Appcolors.indigo,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 24, // jarak dari kiri layar
      title: Row(
        children: [
          Icon(Icons.arrow_back_ios_new_rounded, color: Appcolors.white),
          const Gap(10),
          Text(
            'Sign in',
            style: GoogleFonts.poppins(
              color: Appcolors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _dot({double size = 10, Color color = Appcolors.crimsonred}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
