import 'package:app_condo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscuredText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;

  const InputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.validator,
    this.obscuredText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onChanged,
    this.enabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value != null) {
          return validator!(value);
        }
        return null;
      },
      enabled: enabled,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscuredText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: GoogleFonts.montserrat(color: AppColors.textColorBlack),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: AppColors.inputElements),
        suffixIcon: suffixIcon,
        label: Text(hintText),
        labelStyle: GoogleFonts.montserrat(color: AppColors.textColorBlack),
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(color: AppColors.inputElements),
        filled: true,
        fillColor: AppColors.cardColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.errorColor, width: 2),
        ),
      ),
    );
  }
}
