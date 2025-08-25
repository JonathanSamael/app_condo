enum ExpenseStatus { paid, due, late }

enum ExpenseCategory { residential, condominium }

class ExpenseModel {
  final String title;
  final double amount;
  final ExpenseStatus status;
  final ExpenseCategory category;
  final String iconPath;
  final String actionLabel;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.status,
    required this.category,
    required this.iconPath,
    required this.actionLabel,
  });
}
