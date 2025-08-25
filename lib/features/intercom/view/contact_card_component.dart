import 'package:adcondo_app/features/intercom/model/intercom_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;

  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.accentColor,
              child: Icon(Icons.person, color: AppColors.primaryColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contact.address,
                    style:
                        GoogleFonts.montserrat(color: AppColors.inputElements),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.phone, color: AppColors.primaryColor),
            const SizedBox(width: 20),
            const Icon(Icons.chat_bubble_outline,
                color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
