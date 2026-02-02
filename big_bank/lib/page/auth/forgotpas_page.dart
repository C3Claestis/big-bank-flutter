// ignore_for_file: file_names, deprecated_member_use

import 'package:big_bank/main.dart';
import 'package:big_bank/provider/static_provider.dart';
import 'package:big_bank/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasPage extends ConsumerWidget {
  const ForgotPasPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFormValid = ref.watch(numberProvider).isNotEmpty;

    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Appcolors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Appcolors.lavender.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type your phone number',
                  style: GoogleFonts.poppins(
                    color: Appcolors.gray,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(16),
                _inputNumber(ref, isform: isFormValid),
                const Gap(24),
                Text(
                  'We texted you a code to verify your \nphone number',
                  style: GoogleFonts.poppins(
                    color: Appcolors.darkgray,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
                      onPressed: isFormValid ? () {
                        Navigator.pushNamed(
                            context, AppRoutes.forgotPasConfirm);
                      } : null,
                      child: Text(
                        'Send',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Appcolors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField _inputNumber(WidgetRef ref, {bool isform = true}) {
    return TextField(
      onChanged: (value) => ref.read(numberProvider.notifier).state = value,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Appcolors.lightgray.withOpacity(0.5),
            width: 1, // ← ketebalan muncul
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Appcolors.lightgray, width: 1),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8, top: 14),
          child: Text(
            '(+62) ',
            style: GoogleFonts.poppins(
              color: (isform ? Appcolors.darkgray : Appcolors.lightgray),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 24, // jarak dari kiri layar
      backgroundColor: Appcolors.white,
      title: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Appcolors.darkgray,
              size: 18,
            ),
          ),
          const Gap(10),
          Text(
            'Forgot Password',
            style: GoogleFonts.poppins(
              color: Appcolors.darkgray,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
