import 'package:app_condo/app/components/app_bar_component.dart';
import 'package:app_condo/app/components/buttons.dart';
import 'package:app_condo/app/components/snack_bar_component.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PixPaymentPage extends StatelessWidget {
  final String paymentMethod;
  const PixPaymentPage({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(
          background: AppColors.backgroundColorDark,
          title: "Pagamento - Pix",
          iconColor: AppColors.backgroundColorLight),
      backgroundColor: AppColors.backgroundColorLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage("assets/pix.png"),
                    backgroundColor: AppColors.textColorWhite,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    paymentMethod,
                    style: GoogleFonts.montserrat(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: AppColors.textColorWhite,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO aqui precisa receber as informações do pagamento!
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 160,
                        child: Image.asset("assets/barcode.png"),
                      ),
                    ),
                    Text(
                      "Para",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Nome da empresa",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Valor",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "R\$ Valor",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Banco",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Nome do banco",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Codigo de pagamento",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "ASJDOAISHDOASNAJSCK<c[codigo de pagamento]>DSFKJDHFOUIEHFJSD",
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButtonComponent(
                          text: "copiar código",
                          onPressed: () {
                            Clipboard.setData(const ClipboardData(
                                text: "Valor do input anterior"));
                            CustomSnackBar.sucess(context,
                                message: "Texto copiado!");
                          },
                          color: AppColors.primaryColor),
                    )
                  ],
                ),
              ),
              // const Spacer(),
              const SizedBox(
                height: 20,
              ),
              PrimaryButtonComponent(
                  text: "Pagar", width: 160, onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
