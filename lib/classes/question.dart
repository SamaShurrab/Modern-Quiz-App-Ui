class Question {
  final String questionText;
  final List<String> questionOptions;
  final int correctAnswer;
  final String questionSection;

  const Question({
    required this.questionText,
    required this.questionOptions,
    required this.correctAnswer,
    required this.questionSection
  });
}
