import 'package:adcondo_app/app/components/app_bar_component.dart';
import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/app/components/snack_bar_component.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BoletoPaymentPage extends StatelessWidget {
  final String paymentMethod;
  const BoletoPaymentPage({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(
          background: AppColors.backgroundColorDark,
          title: "Pagamento - Boleto",
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
                    backgroundImage: AssetImage("assets/barcode.png"),
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
                    Text(
                      "Para(beneficiário)",
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
                      "CPNJ",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "00.000.000/0001-00",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Vencimento",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "01/08/2025",
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
                        "R\$ 000,00",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Data de pagamento",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "01/08/2025",
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
                        "PJBank",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Codigo de barras",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "00000.00000 00000.000000 00000.000000 0 00000000000000",
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
