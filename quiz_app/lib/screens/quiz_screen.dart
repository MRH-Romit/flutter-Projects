import 'dart:async';
import 'package:flutter/material.dart';
import '../models/question.dart';
import '../models/quiz_result.dart';
import '../services/quiz_service.dart';
import '../screens/result_screen.dart';
import '../widgets/question_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizService _quizService = QuizService();
  late List<Question> _questions;
  late PageController _pageController;
  int _currentQuestionIndex = 0;
  late Stopwatch _stopwatch;
  Timer? _timer;
  String _timeElapsed = '00:00';

  @override
  void initState() {
    super.initState();
    _questions = _quizService.getQuestions();
    _pageController = PageController();
    _stopwatch = Stopwatch()..start();
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _stopwatch.stop();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final minutes = _stopwatch.elapsed.inMinutes;
      final seconds = _stopwatch.elapsed.inSeconds % 60;
      setState(() {
        _timeElapsed = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      });
    });
  }

  void _selectOption(int questionIndex, int optionIndex) {
    setState(() {
      // Reset all options for this question
      for (var i = 0; i < _questions[questionIndex].options.length; i++) {
        _questions[questionIndex].options[i].isSelected = false;
      }
      // Select the chosen option
      _questions[questionIndex].options[optionIndex].isSelected = true;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishQuiz();
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finishQuiz() {
    _stopwatch.stop();
    _timer?.cancel();
    
    int correctAnswers = 0;
    for (var question in _questions) {
      if (question.isAnswered() && question.isCorrect()) {
        correctAnswers++;
      }
    }

    final result = QuizResult(
      totalQuestions: _questions.length,
      correctAnswers: correctAnswers,
      timeTaken: _stopwatch.elapsed,
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultScreen(result: result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                _timeElapsed,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress indicator
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / _questions.length,
            backgroundColor: Colors.deepPurple.shade100,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Questions
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentQuestionIndex = index;
                });
              },
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                return QuestionCard(
                  question: _questions[index],
                  onOptionSelected: (optionIndex) => _selectOption(index, optionIndex),
                );
              },
            ),
          ),
          // Navigation buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentQuestionIndex > 0 ? _previousQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _questions[_currentQuestionIndex].isAnswered()
                      ? _currentQuestionIndex < _questions.length - 1
                          ? _nextQuestion
                          : _finishQuiz
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    _currentQuestionIndex < _questions.length - 1 ? 'Next' : 'Finish',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
