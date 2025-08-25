import 'package:adcondo_app/app/components/app_bar_component.dart';
import 'package:adcondo_app/features/payments/model/expense_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/payments/view/expense_card_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final List<ExpenseModel> mockExpenses = [
    ExpenseModel(
      title: 'Água',
      amount: 100.00,
      status: ExpenseStatus.paid,
      category: ExpenseCategory.residential,
      iconPath: 'assets/water.png',
      actionLabel: 'Ver',
    ),
    ExpenseModel(
      title: 'Energia',
      amount: 250.00,
      status: ExpenseStatus.paid,
      category: ExpenseCategory.condominium,
      iconPath: 'assets/eletric.png',
      actionLabel: "",
    ),
    ExpenseModel(
      title: 'Condomínio',
      amount: 500.00,
      status: ExpenseStatus.due,
      category: ExpenseCategory.condominium,
      iconPath: 'assets/cond.png',
      actionLabel: "",
    ),
    ExpenseModel(
      title: 'Gás encanado',
      amount: 50.00,
      status: ExpenseStatus.late,
      category: ExpenseCategory.condominium,
      iconPath: 'assets/gas.png',
      actionLabel: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // final residentialExpenses = mockExpenses
    //     .where((expense) => expense.category == ExpenseCategory.residential)
    //     .toList();

    final condominiumExpenses = mockExpenses
        .where((expense) => expense.category == ExpenseCategory.condominium)
        .toList();

    return Scaffold(
      appBar: const AppBarComponent(
          background: AppColors.backgroundColorLight,
          title: "Consumos",
          iconColor: AppColors.backgroundColorDark),
      backgroundColor: AppColors.backgroundColorDark,
      body: Stack(
        children: [
          Container(
            color: AppColors.backgroundColorDark,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/predio-branco.png',
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'Despesas residenciais',
                //   style: GoogleFonts.montserrat(
                //     fontSize: 22,
                //     fontWeight: FontWeight.w600,
                //     color: AppColors.textColorWhite,
                //   ),
                // ),
                // Text(
                //   "Todas as suas despesas em um único lugar!",
                //   style: GoogleFonts.montserrat(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       color: AppColors.textColorWhite),
                // ),
                // const SizedBox(height: 12),
                // Wrap(
                //   spacing: 16,
                //   runSpacing: 16,
                //   children: residentialExpenses
                //       .map((e) => ExpenseCard(expense: e))
                //       .toList(),
                // ),
                const SizedBox(height: 32),
                Text(
                  'Despesas do condomínio',
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColorWhite,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: condominiumExpenses
                      .map((item) => ExpenseCard(expense: item))
                      .toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
