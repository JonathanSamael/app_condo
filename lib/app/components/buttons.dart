import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButtonComponent extends StatelessWidget {
  const PrimaryButtonComponent({
    super.key,
    required this.text,
    required this.width,
    this.onPressed,
  });
  final String text;
  final double width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: Size(width, 45),
        maximumSize: Size(width + 20, 45),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: AppColors.textColorWhite,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SecondaryButtonComponent extends StatelessWidget {
  const SecondaryButtonComponent({
    super.key,
    required this.text,
    required this.width,
    this.onPressed,
  });
  final String text;
  final double width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.textColorWhite,
        minimumSize: Size(width, 45),
        maximumSize: Size(width, 45),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.primaryColor, width: 1)),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: AppColors.textColorPrimaryBlue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class TextButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const TextButtonComponent({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, 
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize
            .shrinkWrap,
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
