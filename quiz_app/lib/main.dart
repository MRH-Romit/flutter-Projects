import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool _signedIn = false;
  bool _showSignUp = false;

  void _goToSignUp() {
    setState(() {
      _showSignUp = true;
    });
  }

  void _goToSignIn() {
    setState(() {
      _showSignUp = false;
    });
  }

  void _onAuthSuccess() {
    setState(() {
      _signedIn = true;
    });
  }

  void _startQuiz() {
    // TODO: Navigate to quiz screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Quiz Started! (Implement quiz screen)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final signInScreen = SignInScreen(
      onSignUpTap: _goToSignUp,
      onSignInSuccess: _onAuthSuccess,
    );
    final signUpScreen = SignUpScreen(
      onSignInTap: _goToSignIn,
      onSignUpSuccess: _onAuthSuccess,
    );
    final welcomeScreen = WelcomeScreen(onStartQuiz: _startQuiz);

    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: !_signedIn
          ? (_showSignUp
              ? signUpScreen
              : signInScreen)
          : welcomeScreen,
    );
  }
}
