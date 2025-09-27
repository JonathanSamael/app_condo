import 'package:app_condo/app/core/models/user_login_model.dart';
import 'package:app_condo/app/core/services/api_service.dart';
import 'package:app_condo/app/core/services/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthService(apiService);
});

class AuthService {
  final ApiService _apiService;

  AuthService(this._apiService);

  Future<UserLoginModel> login(String email, String password) async {
    try {
      final response = await _apiService.post(
        "/Auth/login",
        body: {
          'Username': email,
          'Password': password,
        },
      );
      final responseBody = UserLoginModel.fromJson(response.body);

      if (response.statusCode == 200) {
        return responseBody;
      } else {
        throw Exception('Falha no login.');
      }
    } catch (e) {
      throw Exception(
          'Não foi possível conectar ao servidor. Tente novamente mais tarde. $e');
    }
  }
}
