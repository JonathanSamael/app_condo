import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/features/documents/model/document_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentCardComponent extends StatelessWidget {
  final DocumentModel document;
  const DocumentCardComponent({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Column(
              children: [
                const Icon(Icons.download_outlined,
                    size: 32, color: AppColors.primaryColor),
                const SizedBox(height: 8),
                Text(
                  document.name,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            content: Text(
              "Deseja fazer o download do arquivo?",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: AppColors.textColorPrimaryBlue,
              ),
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButtonComponent(
                onPressed: () => Navigator.pop(context),
                text: "Cancelar",
                color: AppColors.primaryColor,
              ),
              const SizedBox(width: 10),
              PrimaryButtonComponent(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Baixar",
                width: 100,
              ),
            ],
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            // Textos do lado esquerdo
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      document.name,
                      style: GoogleFonts.montserrat(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      document.dateTime,
                      style: GoogleFonts.montserrat(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 0,
              child: Container(
                width: 80,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/doc.png",
                      ),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
