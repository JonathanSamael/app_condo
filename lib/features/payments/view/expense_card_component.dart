import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/features/payments/model/expense_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/payments/view/payment_summary_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:math' as math;

class ExpenseCard extends StatelessWidget {
  final ExpenseModel expense;

  const ExpenseCard({required this.expense, super.key});

  @override
  Widget build(BuildContext context) {
    return buildExpenseStatusLabel(
      expense.status,
      Container(
        width: 165,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.backgroundColorLight,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                expense.iconPath,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              expense.title,
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              'R\$ ${expense.amount.toStringAsFixed(2)}',
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            // Text(
            //   isPaid ? 'Pago' : 'À vencer',
            //   style: GoogleFonts.montserrat(
            //     fontSize: 16,
            //     fontWeight: FontWeight.w700,
            //     color: isPaid ? AppColors.successColor : AppColors.warningColor,
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: PrimaryButtonComponent(
                text: expense.status == ExpenseStatus.paid ? "Ver" : "Pagar",
                width: 100,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummaryPage(
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
    );
  }
}

Widget buildExpenseStatusLabel(ExpenseStatus status, Widget child) {
  late String labelText;
  late Color backgroundColor;
  late double topOffset;
  late double horizontalPadding;

  switch (status) {
    case ExpenseStatus.paid:
      labelText = 'PAGO';
      backgroundColor = AppColors.successColor;
      topOffset = 12;
      horizontalPadding = 30;
      break;
    case ExpenseStatus.due:
      labelText = 'À VENCER';
      backgroundColor = AppColors.warningColor;
      topOffset = 15;
      horizontalPadding = 16;
      break;
    case ExpenseStatus.late:
      labelText = 'ATRASO';
      backgroundColor = AppColors.errorColor;
      topOffset = 15;
      horizontalPadding = 20;
      break;
  }

  return Stack(
    children: [
      child,
      Positioned(
        right: -30,
        top: topOffset,
        child: Transform.rotate(
          angle: math.pi / 4,
          child: Container(
            width: 120,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              textAlign: TextAlign.center,
              labelText,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textColorWhite,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
