// ignore_for_file: file_names

import 'package:big_bank/main.dart';
import 'package:big_bank/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangepasssuccesPage extends StatelessWidget {
  const ChangepasssuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/Illustration_1.png')),
            const Gap(32),
            Text(
              'Change password successfully!',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Appcolors.indigo,
              ),
            ),
            const Gap(24),
            Text(
              'You have successfully change password.\nPlease use the new password when Sign in.',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Appcolors.darkgray,
              ),
            ),
            const Gap(32),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.signIn,
                    (route) => false,
                  );
                },
                child: Text(
                  'Ok',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Appcolors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 24,
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
        ],
      ),
    );
  }
}
