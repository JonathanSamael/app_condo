enum PaymentMethodType {
  pix,
  creditCard,
  debitCard,
  boleto,
}

class PaymentModel {
  final PaymentMethodType type;
  final String name;
  final String image;

  PaymentModel({
    required this.type,
    required this.name,
    required this.image,
  });
}