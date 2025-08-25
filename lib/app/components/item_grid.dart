import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemGrid extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ItemGrid({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 130,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                color: AppColors.textColorWhite,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
              child:
                  Icon(icon, size: 60, color: AppColors.textColorPrimaryBlue),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: AppColors.textColorPrimaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
