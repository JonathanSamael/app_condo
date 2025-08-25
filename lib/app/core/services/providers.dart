import 'package:adcondo_app/app/core/models/user_login_model.dart';
import 'package:adcondo_app/app/core/services/api_service.dart';
import 'package:adcondo_app/features/user/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final apiService = ApiService();
  ref.onDispose(() => apiService.dispose());
  return apiService;
});

final userLoginProvider = StateProvider<UserLoginModel?>((ref) => null);
final userProvider = StateProvider<UserModel?>((ref) => null);