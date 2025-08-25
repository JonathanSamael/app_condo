import 'package:adcondo_app/features/notices/model/notices_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NoticeCardComponent extends StatelessWidget {
  final NoticesModel notices;
  const NoticeCardComponent({super.key, required this.notices});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd-MM-yyyy').format(notices.timestamp);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: Icon(
          notices.icon,
          size: 35,
        ),
        title: Text(
          notices.name,
          style: GoogleFonts.montserrat(
            color: AppColors.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notices.description,
              style: GoogleFonts.montserrat(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),
            Text(
              formattedDate,
              style: GoogleFonts.montserrat(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: notices.onClick,
          icon: const Icon(Icons.arrow_right),
        ),
      ),
    );
  }
}
