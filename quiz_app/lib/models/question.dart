class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  Question({required this.text, required this.options, required this.correctIndex});
}

final List<Question> sampleQuestions = [
  Question(
    text: 'What is the capital of France?',
    options: ['Berlin', 'London', 'Paris', 'Madrid'],
    correctIndex: 2,
  ),
  Question(
    text: 'Which planet is known as the Red Planet?',
    options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
    correctIndex: 1,
  ),
  Question(
    text: 'Who wrote Hamlet?',
    options: ['Charles Dickens', 'William Shakespeare', 'Mark Twain', 'Jane Austen'],
    correctIndex: 1,
  ),
  Question(
    text: 'What is the largest ocean on Earth?',
    options: ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
    correctIndex: 3,
  ),
  Question(
    text: 'Which element has the chemical symbol O?',
    options: ['Gold', 'Oxygen', 'Silver', 'Iron'],
    correctIndex: 1,
  ),
];
