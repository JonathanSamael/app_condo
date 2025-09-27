import 'package:app_condo/app/components/custom_background.dart';
import 'package:app_condo/app/components/face_painter.dart';
import 'package:app_condo/app/components/navigator_bar.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:app_condo/app/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CadFacial extends StatefulWidget {
  const CadFacial({super.key});

  @override
  State<CadFacial> createState() => _CadFacialState();
}

class _CadFacialState extends State<CadFacial> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // CameraPreview
          Container(
            width: size.width * 0.6,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(200),
              color: Colors.amber,
              // border: Border.all(
              //   color: AppColors.primaryColor,
              //   width: 4,
              // ),
            ),
          ),
          // Sobreposição com moldura oval e fundo escurecido
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Buraco oval
                ClipPath(
                  clipper: OvalHoleClipper(),
                  child: CustomBackground(
                    child: Container(
                      width: size.width,
                      height: size.height,
                      color: AppColors.transparent,
                    ),
                  ),
                ),

                // Moldura oval
                SizedBox(
                  width: size.width * 0.6,
                  height: size.height * 0.4,
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.rectangle,
                  //   borderRadius: BorderRadius.circular(200),
                  //   border: Border.all(
                  //     color: AppColors.primaryColor,
                  //     width: 6,
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Realizar cadastro para reconhecimento facial",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: AppColors.textColorPrimaryBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Encaixe seu rosto dentro do espaço abaixo!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: AppColors.textColorPrimaryBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: PrimaryButtonComponent(
                text: "Tirar foto!",
                width: 200,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const NavBarComponent(),
                    ),
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
