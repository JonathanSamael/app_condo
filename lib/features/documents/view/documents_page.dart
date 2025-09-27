import 'package:app_condo/app/components/app_bar_component.dart';
import 'package:app_condo/features/documents/view/document_card_component.dart';
import 'package:app_condo/features/documents/model/document_model.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<DocumentModel> list = [
      DocumentModel(
          name: "Contrato",
          dateTime: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
          urlLink: "link"),
      DocumentModel(
          name: "Contrato 2",
          dateTime: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
          urlLink: "link"),
      DocumentModel(
          name: "Contrato 3",
          dateTime: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
          urlLink: "link"),
      DocumentModel(
          name: "Contrato",
          dateTime: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
          urlLink: "link"),
      DocumentModel(
          name: "Contrato 2",
          dateTime: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
          urlLink: "link"),
      DocumentModel(
          name: "Contrato 3",
          dateTime: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
          urlLink: "link"),
    ];

    return Scaffold(
      appBar: const AppBarComponent(
        background: AppColors.backgroundColorLight,
        title: "Documentos",
        iconColor: AppColors.backgroundColorDark,
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.backgroundColorDark,
            height: size.height,
            width: size.width,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/predio-branco.png',
                width: size.width * 0.9,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned.fill(
            child: list.isEmpty
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.description_outlined,
                          color: AppColors.textColorWhite,
                          size: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Nenhum documento disponível",
                          style: GoogleFonts.montserrat(
                            color: AppColors.textColorWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 100,
                          width: size.width,
                          child: DocumentCardComponent(document: list[index]),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
