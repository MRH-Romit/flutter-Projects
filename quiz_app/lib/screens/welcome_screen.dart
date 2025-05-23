import 'package:flutter/material.dart';
import '../widgets/quiz_logo.dart';
import '../widgets/welcome_text.dart';
import '../widgets/start_quiz_button.dart';
import 'quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStartQuiz;
  const WelcomeScreen({super.key, required this.onStartQuiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const QuizLogo(),
              const SizedBox(height: 32),
              const WelcomeText(),
              const SizedBox(height: 32),
              StartQuizButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QuizScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
