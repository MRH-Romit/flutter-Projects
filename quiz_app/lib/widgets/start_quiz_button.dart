import 'package:flutter/material.dart';

class StartQuizButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const StartQuizButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        child: const Text('Start Quiz'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          textStyle: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
