import 'package:expense_tracker/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: "https://alzuhhylpsllcyprrezd.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsenVoaHlscHNsbGN5cHJyZXpkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE1MjQyODYsImV4cCI6MjA1NzEwMDI4Nn0.E_An4K2Z9XwQaIfaiZ9_j3B9iej3dywkOBeAPcKC5tk",
  );

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
// vU@*4_Q.3P4$vJx
