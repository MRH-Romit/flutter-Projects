class Question {
  final String id;
  final String text;
  final List<Option> options;
  final String explanation;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.explanation,
  });

  bool isAnswered() {
    return options.any((option) => option.isSelected);
  }

  bool isCorrect() {
    return options.every((option) => option.isSelected == option.isCorrect);
  }
}

class Option {
  final String text;
  final bool isCorrect;
  bool isSelected;

  Option({
    required this.text,
    required this.isCorrect,
    this.isSelected = false,
  });
}
