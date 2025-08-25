import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/user/view/cad_facial.dart';
import 'package:adcondo_app/app/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCadFacial extends StatelessWidget {
  const InfoCadFacial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorDark,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Text(
                  "Agora, vamos solicitar uma foto do seu rosto para validar sua identidade com segurança.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: AppColors.textColorWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Image.asset(
                            'assets/icon-facial.png',
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "Para garantir que tudo funcione bem, siga estas orientações:",
                          style: GoogleFonts.montserrat(
                              color: AppColors.textColorPrimaryBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "• Esteja em um local bem iluminado.\n• Remova itens que cubram o rosto (óculos escuros, bonés, máscaras).\n• Mantenha o rosto centralizado e neutro.",
                          style: GoogleFonts.montserrat(
                              color: AppColors.textColorPrimaryBlue,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 24),
                        PrimaryButtonComponent(
                          text: "Seguir para foto",
                          width: 165.0,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CadFacial(),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextButtonComponent(
                            text: "Cancelar",
                            color: AppColors.primaryColor,
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Text(
                    "Sua imagem será usada apenas para fins de verificação e não será compartilhada.\nTodos os dados são protegidos conforme a LGPD.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: AppColors.textColorWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
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
}
