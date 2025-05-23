import 'package:flutter/material.dart';

class QuizLogo extends StatelessWidget {
  const QuizLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/quiz-logo.png',
      width: 150,
      height: 150,
      fit: BoxFit.contain,
    );
  }
}
