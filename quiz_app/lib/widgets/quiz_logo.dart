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
      color: const Color.fromARGB(255, 22, 22, 22), // Apply green color
      colorBlendMode: BlendMode.srcIn, // Use srcIn to tint the image
      errorBuilder: (context, error, stackTrace) {
        print('Error loading image: $error');
        return Container(
          width: 150,
          height: 150,
          color: const Color.fromARGB(255, 9, 229, 83),
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
