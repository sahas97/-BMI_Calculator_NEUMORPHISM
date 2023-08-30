import 'package:firebase_core/firebase_core.dart';
import 'package:fitcheck_bmi_tracker/firebase_options.dart';
import 'package:fitcheck_bmi_tracker/screens/auth_page.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 130, 233, 240),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const AuthPage(),
    );
  }
}
