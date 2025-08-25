class Validators {
  static String? required(String? value,
      {String message = 'Campo obrigatório'}) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Digite um email';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value.trim()) ? null : 'Email inválido';
  }

  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) return 'Digite uma senha';

    final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
    final hasDigits = RegExp(r'[0-9]').hasMatch(value);
    final hasSpecialChar =
        RegExp(r'[!@#\$&*~%^()_+={}\[\]:;"\"<>,.?\\/-]').hasMatch(value);
    final hasMinLength = value.length >= 7;

    if (!hasUppercase) return 'A senha precisa de uma letra maiúscula';
    if (!hasDigits) return 'A senha precisa de ao menos um número';
    if (!hasSpecialChar) return 'A senha precisa de um caractere especial';
    if (!hasMinLength) return 'A senha precisa de no mínimo 7 caracteres';

    return null;
  }

  /// CPF (com ou sem pontuação)
  static String? cpf(String? value) {
    if (value == null || value.trim().isEmpty) return 'Digite um CPF';

    String cpf = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (cpf.length != 11 || RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
      return 'CPF inválido';
    }

    int calcDV(String str, int weight) {
      var sum = 0;
      for (var i = 0; i < str.length; i++) {
        sum += int.parse(str[i]) * (weight - i);
      }
      final mod = sum % 11;
      return (mod < 2) ? 0 : 11 - mod;
    }

    final digit1 = calcDV(cpf.substring(0, 9), 10);
    final digit2 = calcDV(cpf.substring(0, 9) + digit1.toString(), 11);

    if (cpf.endsWith('$digit1$digit2')) return null;
    return 'CPF inválido';
  }

  static String? telefone(String? value) {
    if (value == null || value.trim().isEmpty) return 'Digite um telefone';

    final numeric = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (numeric.length < 10 || numeric.length > 11) {
      return 'Telefone inválido';
    }

    return null;
  }
}
