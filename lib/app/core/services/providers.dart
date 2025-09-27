import 'package:app_condo/app/core/models/user_login_model.dart';
import 'package:app_condo/app/core/services/api_service.dart';
import 'package:app_condo/features/user/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final apiService = ApiService();
  ref.onDispose(() => apiService.dispose());
  return apiService;
});

final userLoginProvider = StateProvider<UserLoginModel?>((ref) => null);
final userProvider = StateProvider<UserModel?>((ref) => null);
