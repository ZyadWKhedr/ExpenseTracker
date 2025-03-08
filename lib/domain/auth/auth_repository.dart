import 'package:expense_tracker/domain/auth/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signUp(String name, String email, String password);
  Future<UserEntity?> login(String email, String password);
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
}
