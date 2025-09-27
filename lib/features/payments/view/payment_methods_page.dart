import 'package:app_condo/app/components/app_bar_component.dart';
import 'package:app_condo/app/components/buttons.dart';
import 'package:app_condo/app/components/snack_bar_component.dart';
import 'package:app_condo/features/payments/model/expense_model.dart';
import 'package:app_condo/features/payments/model/payment_model.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:app_condo/features/payments/view/payment_summary_page.dart';
import 'package:app_condo/features/payments/view/payment_methods_card_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodsPage extends StatefulWidget {
  final ExpenseModel expense;
  const PaymentMethodsPage({super.key, required this.expense});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  PaymentMethodType? selectedPaymentMethod;

  final List<PaymentModel> _paymentMethods = [
    PaymentModel(
      type: PaymentMethodType.pix,
      name: "Pix",
      image: "assets/pix.png",
    ),
    PaymentModel(
      type: PaymentMethodType.creditCard,
      name: "Cartão de crédito",
      image: "assets/creditcard.png",
    ),
    PaymentModel(
      type: PaymentMethodType.debitCard,
      name: "Cartão de débito",
      image: "assets/creditcard.png",
    ),
    PaymentModel(
      type: PaymentMethodType.boleto,
      name: "Boleto",
      image: "assets/barcode.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const AppBarComponent(
          background: AppColors.backgroundColorDark,
          title: "Pagamentos",
          iconColor: AppColors.backgroundColorLight),
      backgroundColor: AppColors.backgroundColorLight,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Formas de pagamento',
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              // Usa Expanded para que a lista ocupe o espaço restante
              child: ListView.builder(
                itemCount: _paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = _paymentMethods[index];
                  // Card selecionável
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPaymentMethod =
                            method.type; // Atualiza a seleção
                      });
                    },
                    child: PaymentMethodsCardComponent(
                      text: method.name,
                      image: method.image,
                      method: method.type,
                      isSelected: selectedPaymentMethod ==
                          method.type, // Verifica se está selecionado
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Botão Confirmar
            Align(
              alignment: Alignment.center,
              child: PrimaryButtonComponent(
                text: "Confirmar",
                width: size.width * 0.8,
                onPressed: () {
                  if (selectedPaymentMethod != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => PaymentSummaryPage(
                              expense: widget.expense,
                              paymentMethod: selectedPaymentMethod!.name,
                            )));
                  } else {
                    CustomSnackBar.error(context,
                        message:
                            "Por favor, selecione uma forma de pagamento.");
                  }
                },
              ),
            ),
            // const PaymentMethodsCardComponent(
            //   image: "assets/pix.png",
            //   text: "Pix",
            //   method: PaymentMethodType.pix,
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // const PaymentMethodsCardComponent(
            //   image: "assets/creditcard.png",
            //   text: "Cartão de crédito",
            //   method: PaymentMethodType.creditCard,
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // const PaymentMethodsCardComponent(
            //   image: "assets/creditcard.png",
            //   text: "Cartão de débito",
            //   method: PaymentMethodType.debitCard,
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // const PaymentMethodsCardComponent(
            //   image: "assets/barcode.png",
            //   text: "Boleto",
            //   method: PaymentMethodType.boleto,
            // ),
            // const Spacer(),
            // Align(
            //   alignment: Alignment.center,
            //   child: PrimaryButtonComponent(
            //     text: "Continuar",
            //     width: MediaQuery.of(context).size.width * .8,
            //     onPressed: () {},
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
