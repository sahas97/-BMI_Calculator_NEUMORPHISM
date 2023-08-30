import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitcheck_bmi_tracker/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user != null) {
              // If user is logged in, redirect to the appropriate page
              return const InputPage();
            } else {
              // User is not logged in, show login/register page
              return const LoginOrRegisterPage();
            }
          } else {
            // Show a loading indicator if the connection state is not active
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
