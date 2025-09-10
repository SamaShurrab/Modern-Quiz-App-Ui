import 'package:modern_quiz_app_ui/classes/question.dart';
import 'package:modern_quiz_app_ui/constatnts/strings.dart';

class QuestionsModel {
  // int currentNumQuestion = 1;
  int numberQuestion = 0;
  List<Question> questions = [
    Question(
      questionText: "What is Flutter mainly used for?",
      questionOptions: [
        "Data analysis",
        "Cross-platform mobile app development",
        "Operating system design",
      ],
      correctAnswer: 1,
      questionSection: AppStrings.flutterSection,
    ),
    Question(
      questionText: "Which programming language does Flutter use?",
      questionOptions: ["Dart", "Java", "JavaScript"],
      correctAnswer: 0,
      questionSection: AppStrings.flutterSection,
    ),
    Question(
      questionText:
          "Which widget is used to create scrollable lists in Flutter?",
      questionOptions: ["ListView", "Row", "Column"],
      correctAnswer: 0,
      questionSection: AppStrings.flutterSection,
    ),
    Question(
      questionText: "What does the hot reload feature in Flutter do?",
      questionOptions: [
        "Restarts the entire app",
        "Instantly updates code changes without losing state",
        "Deletes cache files",
      ],
      correctAnswer: 1,
      questionSection: AppStrings.flutterSection,
    ),
    Question(
      questionText:
          "Which widget is commonly used for creating layouts in a row?",
      questionOptions: ["Column", "Row", "Stack"],
      correctAnswer: 1,
      questionSection: AppStrings.flutterSection,
    ),
    Question(
      questionText:
          "Which programming language is officially supported for Android development?",
      questionOptions: ["Kotlin", "Swift", "Ruby"],
      correctAnswer: 0,
      questionSection: AppStrings.andriodSection,
    ),
    Question(
      questionText:
          "What is the file extension of an Android application package?",
      questionOptions: [".exe", ".apk", ".jar"],
      correctAnswer: 1,
      questionSection: AppStrings.andriodSection,
    ),
    Question(
      questionText:
          "What is the name of the Android UI component used to display text input from the user?",
      questionOptions: ["Button", "EditText", "TextView"],
      correctAnswer: 1,
      questionSection: AppStrings.andriodSection,
    ),
    Question(
      questionText: "Which tool is used to build and manage Android projects?",
      questionOptions: ["Gradle", "Node.js", "Docker"],
      correctAnswer: 0,
      questionSection: AppStrings.andriodSection,
    ),
  ];
  List<String> questionSections = [
    AppStrings.flutterSection,
    AppStrings.andriodSection,
    AppStrings.frontEndSection,
  ];

  List<String> questionText = [];
  List<List<String>> questionOptions = [];
  List<int> correctAnswerList = [];
  int correctAnswers = 0;

  List<String> getQuestionOptions() {
    return questions[numberQuestion].questionOptions;
  }

  String getQuestionSection() {
    return questions[numberQuestion].questionSection;
  }

  void getQuestionTextBySectionName(String sectionName) {
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].questionSection == sectionName) {
        questionText.add(questions[i].questionText);
      }
    }
  }

  void getQuestionOptionsBySectionName(String sectionName) {
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].questionSection == sectionName) {
        questionOptions.add(questions[i].questionOptions);
      }
    }
  }

  void getCorrectAnswerBySectionName(String sectionName) {
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].questionSection == sectionName) {
        correctAnswerList.add(questions[i].correctAnswer);
      }
    }
  }

  void checkAneswr(int userAnswerIndex) {
    if (correctAnswerList[numberQuestion] == userAnswerIndex) {
      ++correctAnswers;
    }
    
  }

  int getNumberQuestionBySectionName(String sectionQuestion) {
    int numberQuestion = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].questionSection == sectionQuestion) {
        numberQuestion++;
      }
    }

    return numberQuestion;
  }

  bool isFinished() {
    return numberQuestion >= questionText.length - 1;
  }

  int nextQuestion() {
    return ++numberQuestion;
  }
}
