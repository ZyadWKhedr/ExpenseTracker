import 'package:expense_tracker/data/auth/auth_repository.dart';
import 'package:expense_tracker/domain/auth/auth_repository.dart';
import 'package:expense_tracker/domain/auth/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authProvider = StateNotifierProvider<AuthNotifier, UserEntity?>((ref) {
  final authRepository = AuthRepositoryImpl(Supabase.instance.client);
  return AuthNotifier(authRepository);
});

class AuthNotifier extends StateNotifier<UserEntity?> {
  final AuthRepository authRepository;

  AuthNotifier(this.authRepository) : super(null);

  Future<void> login(String email, String password) async {
    state = await authRepository.login(email, password);
  }

  Future<void> signUp(String name,String email, String password) async {
    state = await authRepository.signUp(name,email, password);
  }

  Future<void> logout() async {
    await authRepository.logout();
    state = null;
  }
}