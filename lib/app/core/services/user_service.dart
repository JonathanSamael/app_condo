import 'dart:convert';
import 'package:adcondo_app/app/core/services/api_service.dart';
import 'package:adcondo_app/app/core/services/providers.dart';
import 'package:adcondo_app/features/user/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userServiceProvider = Provider<UserService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final userLogin = ref.watch(userLoginProvider);
  return UserService(apiService, authToken: userLogin!.token);
});

class UserService {
  final ApiService _apiService;
  final String? _authToken;

  UserService(this._apiService, {String? authToken}) : _authToken = authToken;

  Future<List<UserModel>> getAllUsers() async {
    final response = await _apiService.get('/Pessoas', authToken: _authToken);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception(
          'Erro ao buscar lista de usuários: ${response.statusCode}');
    }
  }

  Future<UserModel> getUser(int id) async {
    final response = await _apiService.get('/Pessoas/$id', authToken: _authToken);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return UserModel.fromMap(data);
    } else {
      throw Exception('Erro ao buscar usuário: ${response.statusCode}');
    }
  }

  Future<UserModel> updateUser(UserModel user) async {
    final response = await _apiService.put(
      '/Pessoas/${user.userId}',
      body: user.toMap(),
      authToken: _authToken,
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro ao atualizar usuário: ${response.statusCode}');
    }
  }

  Future<void> deleteUser(int id) async {
    final response =
        await _apiService.delete('/Pessoas/$id', authToken: _authToken);

    if (response.statusCode != 204) {
      throw Exception('Erro ao deletar usuário: ${response.statusCode}');
    }
  }

  Future<void> updateLoginStatus(int userId) async {
    final response =
        await _apiService.patch('/Users/updateLoginStatus/$userId');

    print(response.body);

    if (response.statusCode != 200) {
      throw Exception(
          'Erro ao atualizar status do usuário: ${response.statusCode}');
    }
  }
}
