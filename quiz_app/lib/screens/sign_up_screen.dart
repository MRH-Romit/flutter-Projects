import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final VoidCallback onSignInTap;
  final VoidCallback onSignUpSuccess;

  const SignUpScreen({super.key, required this.onSignInTap, required this.onSignUpSuccess});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onSignUpSuccess,
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: onSignInTap,
              child: const Text('Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
