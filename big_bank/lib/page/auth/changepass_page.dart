// ignore_for_file: file_names, deprecated_member_use

import 'package:big_bank/main.dart';
import 'package:big_bank/provider/static_provider.dart';
import 'package:big_bank/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassPage extends ConsumerWidget {
  const ChangePassPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pass1 = ref.watch(password1Provider);
    final pass2 = ref.watch(password2Provider);
    final isVisible = ref.watch(showPasswordProvider);

    // tombol aktif hanya jika dua field terisi dan sama
    final isFormValid =
        pass1.isNotEmpty && pass2.isNotEmpty && pass1 == pass2;

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
                  'Type your new password',
                  style: GoogleFonts.poppins(
                    color: Appcolors.gray,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(8),
                _inputPassword(
                  ref: ref,
                  isVisible: isVisible,
                  onChanged: (v) =>
                      ref.read(password1Provider.notifier).state = v,
                ),
                const Gap(24),
                Text(
                  'Confirm your password',
                  style: GoogleFonts.poppins(
                    color: Appcolors.gray,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(8),
                _inputPassword(
                  ref: ref,
                  isVisible: isVisible,
                  onChanged: (v) =>
                      ref.read(password2Provider.notifier).state = v,
                ),
                const Gap(32),

                /// 🔘 BUTTON
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
                      onPressed: isFormValid
                          ? () {
                              // reset state setelah sukses
                              ref.read(password1Provider.notifier).state = '';
                              ref.read(password2Provider.notifier).state = '';
                              ref.read(showPasswordProvider.notifier).state =
                                  false;

                              Navigator.pushNamed(
                               
                                context,
                                AppRoutes.changePassSuccess,
                              );
                            }
                          : null,
                      child: Text(
                        'Change Password',
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

  Widget _inputPassword({
    required WidgetRef ref,
    required bool isVisible,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      obscureText: !isVisible,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Appcolors.lightgray.withOpacity(0.5),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Appcolors.lightgray, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            // satu tombol mengubah dua field sekaligus
            ref.read(showPasswordProvider.notifier).state = !isVisible;
          },
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Appcolors.darkgray,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
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
          const Gap(10),
          Text(
            'Change Password',
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
