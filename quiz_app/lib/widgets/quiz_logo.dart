import 'package:flutter/material.dart';

class QuizLogo extends StatelessWidget {
  const QuizLogo({super.key});

  @override  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/quiz-logo.png',
      width: 150,
      height: 150, 
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        print('Error loading image: $error');
        return Container(
          width: 150,
          height: 150,
          color: Colors.purple[100],
          child: const Center(
            child: Text(
              'Quiz App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
