import 'package:expense_tracker/domain/auth/auth_repository.dart';
import 'package:expense_tracker/domain/auth/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient _supabase;

  AuthRepositoryImpl(this._supabase);

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      final userData =
          await _supabase.from('profiles').select().eq('id', user.id).single();
      return UserEntity(
          id: user.id, name: userData['name'], email: user.email!);
    }
    return null;
  }

  @override
  Future<UserEntity?> login(String email, String password) async {
    try {
      final response = await _supabase.auth
          .signInWithPassword(email: email, password: password);
      final user = response.user;
      if (user != null) {
        // Fetch user details from the database
        final userData = await _supabase
            .from('profiles')
            .select()
            .eq('id', user.id)
            .single();
        return UserEntity(
            id: user.id, name: userData['name'], email: user.email!);
      }
    } catch (e) {
      throw Exception("Login Error: $e");
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _supabase.auth.signOut();
  }

  @override
  Future<UserEntity?> signUp(String name, String email, String password) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      final user = response.user;

      if (user != null) {
        // Store the name in Supabase Database
        await _supabase.from('profiles').upsert({
          'id': user.id,
          'name': name,
          'email': email,
        });

        return UserEntity(id: user.id, name: name, email: email);
      }
    } catch (e) {
      throw Exception("Sign Up Error: $e");
    }
    return null;
  }
}
