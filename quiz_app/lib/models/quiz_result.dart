class QuizResult {
  final int totalQuestions;
  final int correctAnswers;
  final Duration timeTaken;

  QuizResult({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.timeTaken,
  });

  int get score => (correctAnswers / totalQuestions * 100).round();

  String get formattedTime {
    final minutes = timeTaken.inMinutes;
    final seconds = timeTaken.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
