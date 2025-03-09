import 'package:expense_tracker/presentation/auth/login_page.dart';
import 'package:expense_tracker/presentation/auth/sign_up_page.dart';
import 'package:expense_tracker/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: SplashScreen(),
        transitionsBuilder: _fadeTransition, // Apply fade animation
      ),
    ),
    GoRoute(
      path: '/signup',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: SignUpPage(),
        transitionsBuilder: _slideTransition, // Apply slide animation
      ),
    ),
     GoRoute(
      path: '/login',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: LoginPage(),
        transitionsBuilder: _slideTransition, // Apply slide animation
      ),
    ),
  ],
);

// Fade Transition
Widget _fadeTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(opacity: animation, child: child);
}

// Slide Transition (Left to Right)
Widget _slideTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(animation),
    child: child,
  );
}

// Scale Transition (Zoom in)
Widget _scaleTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return ScaleTransition(scale: animation, child: child);
}
