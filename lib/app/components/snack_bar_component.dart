import 'package:app_condo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBar {
  static void sucess(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = AppColors.successColor,
    Color textColor = AppColors.textColorBlack,
    double width = 280.0,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    double borderRadius = 10.0,
    IconData? icon,
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(icon, color: textColor),
            ),
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      duration: duration,
      backgroundColor: backgroundColor,
      behavior: behavior,
      width: width,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void error(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = AppColors.errorColor,
    Color textColor = AppColors.textColorWhite,
    double width = 280.0,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    double borderRadius = 10.0,
    IconData? icon,
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(icon, color: textColor),
            ),
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      duration: duration,
      backgroundColor: backgroundColor,
      behavior: behavior,
      width: width,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
