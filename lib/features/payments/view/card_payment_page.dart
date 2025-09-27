import 'package:app_condo/app/components/app_bar_component.dart';
import 'package:app_condo/app/components/buttons.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:app_condo/features/payments/view/add_card_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPaymentPage extends StatelessWidget {
  final String paymentMethod;
  const CardPaymentPage({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(
          background: AppColors.backgroundColorDark,
          title: "Pagamento - Cartão",
          iconColor: AppColors.backgroundColorLight),
      backgroundColor: AppColors.backgroundColorLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage("assets/creditcard.png"),
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
                  children: [
                    Card.outlined(
                      color: AppColors.backgroundColorLight,
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        splashColor: AppColors.inputElements,
                        onTap: () {
                          debugPrint('Card tapped.');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundImage:
                                    AssetImage("assets/creditcard.png"),
                                backgroundColor: AppColors.textColorWhite,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cartão final {0000}',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '<Bandeira>',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card.outlined(
                      color: AppColors.backgroundColorLight,
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        splashColor: AppColors.inputElements,
                        onTap: () {
                          debugPrint('Card tapped.');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundImage:
                                    AssetImage("assets/creditcard.png"),
                                backgroundColor: AppColors.textColorWhite,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cartão final {0000}',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '<Bandeira>',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryButtonComponent(
                      text: "Adicionar cartão",
                      width: 170,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => const AddCardPage()));
                      },
                    ),
                  ],
                ),
              ),
              //TODO aqui precisa receber as informações do pagamento!
              const SizedBox(
                height: 20,
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
                "Data de vencimento",
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  textAlign: TextAlign.center,
                  "30/07/2025",
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              // const Spacer(),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: PrimaryButtonComponent(
                  text: "Pagar",
                  width: 160,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
