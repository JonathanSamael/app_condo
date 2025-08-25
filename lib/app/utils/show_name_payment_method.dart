String showName(String paymentName) {
  switch (paymentName) {
    case "pix":
      paymentName = "Pix";
      return paymentName;
    case "creditCard":
      paymentName = "Cartão de crédito";
      return paymentName;
    case "debitCard":
      paymentName = "Cartão de débito";
      return paymentName;
    case "boleto":
      paymentName = "Boleto";
      return paymentName;
  }
  return paymentName;
}
