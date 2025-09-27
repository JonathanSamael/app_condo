import 'package:app_condo/app/components/app_bar_component.dart';
import 'package:app_condo/app/components/buttons.dart';
import 'package:app_condo/app/components/snack_bar_component.dart';
import 'package:app_condo/features/payments/model/expense_model.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:app_condo/app/utils/show_name_payment_method.dart';
import 'package:app_condo/features/payments/view/boleto_payment_page.dart';
import 'package:app_condo/features/payments/view/card_payment_page.dart';
import 'package:app_condo/features/payments/view/payment_methods_page.dart';
import 'package:app_condo/features/payments/view/pix_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSummaryPage extends StatelessWidget {
  final ExpenseModel expense;
  final String? paymentMethod;
  const PaymentSummaryPage(
      {super.key, required this.expense, this.paymentMethod});

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(
                    expense.iconPath,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  expense.title,
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 20,
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
                  Text(
                    "Resumo dos valores",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    expense.title,
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "R\$ ${expense.amount.toStringAsFixed(2)}",
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 120,
              width: size.width,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.textColorWhite,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
              child: expense.status == ExpenseStatus.paid
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pagamento',
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pagamento já efetuado!",
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.successColor),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.successColor,
                              size: 30,
                            )
                          ],
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forma de pagamento',
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Método de pagamento",
                          style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        paymentMethod == null
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: TextButtonComponent(
                                  text: "Escolher como pagar",
                                  color: AppColors.backgroundColorDark,
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (builder) =>
                                            PaymentMethodsPage(
                                                expense: expense),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Align(
                                alignment: Alignment.centerRight,
                                child: TextButtonComponent(
                                  text: showName(paymentMethod!),
                                  color: AppColors.backgroundColorDark,
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (builder) =>
                                            PaymentMethodsPage(
                                          expense: expense,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
            ),
            const Spacer(),
            expense.status == ExpenseStatus.paid
                ? SecondaryButtonComponent(
                    text: "Voltar",
                    width: size.width * .8,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                : PrimaryButtonComponent(
                    text: "Continuar",
                    width: size.width * .8,
                    onPressed: () {
                      if (paymentMethod != null) {
                        _navigateToNextScreen(context, paymentMethod!);
                      } else {
                        CustomSnackBar.error(context,
                            message:
                                "Por favor, selecione uma forma de pagamento.");
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, String selectedMethod) {
    switch (selectedMethod) {
      case "pix":
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PixPaymentPage(paymentMethod: "Pix"),
          ),
        );
        break;
      case "creditCard":
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                const CardPaymentPage(paymentMethod: "Cartão de Crédito"),
          ),
        );
        break;
      case "debitCard":
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                const CardPaymentPage(paymentMethod: "Cartão de Débito"),
          ),
        );
        break;
      case "boleto":
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                const BoletoPaymentPage(paymentMethod: "Boleto"),
          ),
        );
        break;
    }
  }
}
