import '../models/question.dart';

class QuizService {
  List<Question> getQuestions() {
    return [
      Question(
        id: '1',
        text: 'What programming language does Flutter use?',
        options: [
          Option(text: 'Java', isCorrect: false),
          Option(text: 'Kotlin', isCorrect: false),
          Option(text: 'Dart', isCorrect: true),
          Option(text: 'Swift', isCorrect: false),
        ],
        explanation: 'Flutter uses Dart, a client-optimized language for fast apps on any platform.',
      ),
      Question(
        id: '2',
        text: 'Which widget is used to create a scrollable list of widgets?',
        options: [
          Option(text: 'Container', isCorrect: false),
          Option(text: 'ListView', isCorrect: true),
          Option(text: 'Row', isCorrect: false),
          Option(text: 'Column', isCorrect: false),
        ],
        explanation: 'ListView is the most commonly used scrolling widget that displays a scrollable list of children widgets.',
      ),
      Question(
        id: '3',
        text: 'What is "hot reload" in Flutter?',
        options: [
          Option(text: 'A feature that automatically fixes bugs', isCorrect: false),
          Option(text: 'A feature that updates the app when you save changes without losing the state', isCorrect: true),
          Option(text: 'A feature that optimizes app performance', isCorrect: false),
          Option(text: 'A feature that compiles Dart code to native machine code', isCorrect: false),
        ],
        explanation: 'Hot reload allows you to quickly and easily experiment, build UIs, add features, and fix bugs without restarting the app.',
      ),
      Question(
        id: '4',
        text: 'What is a StatefulWidget in Flutter?',
        options: [
          Option(text: 'A widget that has an immutable state', isCorrect: false),
          Option(text: 'A widget that never updates', isCorrect: false),
          Option(text: 'A widget that can change over time', isCorrect: true),
          Option(text: 'A widget used only for animations', isCorrect: false),
        ],
        explanation: 'StatefulWidget can change its appearance in response to events triggered by user interactions or when it receives data.',
      ),
      Question(
        id: '5',
        text: 'Which of the following is NOT a Flutter layout widget?',
        options: [
          Option(text: 'Container', isCorrect: false),
          Option(text: 'Row', isCorrect: false),
          Option(text: 'ScrollView', isCorrect: true),
          Option(text: 'Column', isCorrect: false),
        ],
        explanation: 'ScrollView is not a layout widget but a scrollable widget. Container, Row, and Column are layout widgets in Flutter.',
      ),
    ];
  }
}
