import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  final VoidCallback onSignUpTap;
  final VoidCallback onSignInSuccess;

  const SignInScreen({super.key, required this.onSignUpTap, required this.onSignInSuccess});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
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
              onPressed: onSignInSuccess,
              child: const Text('Sign In'),
            ),
            TextButton(
              onPressed: onSignUpTap,
              child: const Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
