import 'package:expense_tracker/presentation/providers/auth_provider.dart';
import 'package:expense_tracker/presentation/widgets/custom_button.dart';
import 'package:expense_tracker/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final auth = ref.read(authProvider.notifier);
    await auth.login(emailController.text, passwordController.text);
    if (ref.read(authProvider) != null) {
      // Navigate to home screen after successful login
      () => context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: emailController, hintText: "Email"),
            CustomTextField(
              controller: passwordController,
              hintText: "Password",
              isPassword: true,
            ),
            SizedBox(height: 20),
            CustomButton(text: "Login", onPressed: login),
            TextButton(
              onPressed: () => context.go('/signup'),
              child: Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
