import 'package:app_condo/app/components/buttons.dart';
import 'package:app_condo/features/intercom/model/intercom_model.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupsCard extends StatelessWidget {
  final Groups group;

  const GroupsCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(left: 16.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.accentColor,
                child: Icon(
                  Icons.group,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.name,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${group.participants} participantes',
                    style: GoogleFonts.montserrat(
                        color: AppColors.inputElements, fontSize: 12),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: PrimaryButtonComponent(
                  onPressed: () {},
                  text: "Entrar",
                  width: 120,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
