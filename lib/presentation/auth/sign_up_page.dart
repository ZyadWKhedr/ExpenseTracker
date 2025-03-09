import 'package:expense_tracker/presentation/providers/auth_provider.dart';
import 'package:expense_tracker/presentation/widgets/custom_button.dart';
import 'package:expense_tracker/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp() async {
    final auth = ref.read(authProvider.notifier);
    await auth.signUp(
        nameController.text, emailController.text, passwordController.text);
    if (ref.read(authProvider) != null) {
      // Navigate to home screen after successful login
      () => context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: nameController, hintText: "UserName"),
            CustomTextField(controller: emailController, hintText: "Email"),
            CustomTextField(
              controller: passwordController,
              hintText: "Password",
              isPassword: true,
            ),
            SizedBox(height: 20),
            CustomButton(text: "Login", onPressed: signUp),
            TextButton(
              onPressed: () => context.go('/'),
              child: Text("Have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
