import 'package:flutter/material.dart';
import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _current = 0;
  int _score = 0;
  int? _selected;

  void _next() {
    if (_selected == sampleQuestions[_current].correctIndex) {
      _score++;
    }
    if (_current < sampleQuestions.length - 1) {
      setState(() {
        _current++;
        _selected = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(score: _score, total: sampleQuestions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = sampleQuestions[_current];
    return Scaffold(
      appBar: AppBar(title: Text('Question ${_current + 1}/${sampleQuestions.length}')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(q.text, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            ...List.generate(q.options.length, (i) => RadioListTile<int>(
                  value: i,
                  groupValue: _selected,
                  onChanged: (val) => setState(() => _selected = val),
                  title: Text(q.options[i]),
                )),
            const Spacer(),
            ElevatedButton(
              onPressed: _selected == null ? null : _next,
              child: Text(_current == sampleQuestions.length - 1 ? 'Finish' : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}
