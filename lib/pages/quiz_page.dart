import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modern_quiz_app_ui/classes/questions_model.dart';
import 'package:modern_quiz_app_ui/constatnts/colors.dart';
import 'package:modern_quiz_app_ui/constatnts/strings.dart';
import 'package:modern_quiz_app_ui/custom%20widget/circular_count_down.dart';
import 'package:modern_quiz_app_ui/pages/result_page.dart';

class QuizPage extends StatefulWidget {
  final List<Color> backGround;
  final String imageSectionPath;
  final String sectionQuestion;
  final Color textColor;

  const QuizPage({
    super.key,
    required this.backGround,
    required this.imageSectionPath,
    required this.sectionQuestion,
    required this.textColor,
  });

  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  QuestionsModel questionsModel = QuestionsModel();
  int live = 3;
  int userAnswerIndex = -1;
  Timer? timer;
  final int totalSeconds = 10;
  int timeLeft = 10;

  void _goNext() {
    if (userAnswerIndex != -1) {
      questionsModel.checkAneswr(userAnswerIndex);
    }

    if (questionsModel.isFinished()) {
      timer?.cancel();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultPage(
            numberCorrectQuestion: questionsModel.correctAnswers,
            totalQuestion: questionsModel.getNumberQuestionBySectionName(
              widget.sectionQuestion,
            ),
            colors: widget.backGround,
          ),
        ),
      );
    } else {
      setState(() {
        questionsModel.nextQuestion();
        userAnswerIndex = -1;
        timeLeft = totalSeconds;
      });
      startTimer();
    }
  }

  void startTimer() {
    timer?.cancel();
    setState(() {
      timeLeft = totalSeconds;
    });
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        t.cancel();
        _goNext();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    questionsModel.getQuestionTextBySectionName(widget.sectionQuestion);
    questionsModel.getQuestionOptionsBySectionName(widget.sectionQuestion);
    questionsModel.getCorrectAnswerBySectionName(widget.sectionQuestion);

    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: CircularCountDown(
          timeLeft: timeLeft,
          totalSeconds: totalSeconds,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: widget.backGround[1],
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: OutlinedButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              shape: CircleBorder(),
              side: BorderSide(color: Colors.white),
            ),
            label: Icon(Icons.close, color: Colors.white, size: 20),
          ),
        ),
        actionsPadding: const EdgeInsets.only(right: 20),
        actions: [
          OutlinedButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white),
              padding: EdgeInsets.all(0),
            ),
            label: Row(
              children: [
                Icon(Icons.favorite, color: Colors.white, size: 20),
                SizedBox(width: 10),
                Text(
                  live.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.backGround,
            begin: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                widget.imageSectionPath,
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "${AppStrings.question} ${questionsModel.numberQuestion + 1} ${AppStrings.of} ${questionsModel.getNumberQuestionBySectionName(widget.sectionQuestion)} ",
              style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              questionsModel.questionText[questionsModel.numberQuestion],
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 50),
            ListView.builder(
              shrinkWrap: true,
              itemCount: questionsModel
                  .questionOptions[questionsModel.numberQuestion]
                  .length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userAnswerIndex = index;
                      
                        Future.delayed(Duration(milliseconds: 500), () {
                          _goNext();
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: userAnswerIndex == index
                          ? questionsModel.correctAnswerList[questionsModel
                                        .numberQuestion] ==
                                    userAnswerIndex
                                ? AppColors.buttonColorDark
                                : Colors.red
                          : Colors.white,
                      elevation: 3,
                      padding: EdgeInsets.all(20),
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 12,
                          child: Text(
                            questionsModel.questionOptions[questionsModel
                                .numberQuestion][index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: userAnswerIndex == index
                                  ? Colors.white
                                  : widget.textColor,
                            ),
                          ),
                        ),
                        ?userAnswerIndex == index
                            ? questionsModel.correctAnswerList[questionsModel
                                          .numberQuestion] ==
                                      userAnswerIndex
                                  ? Expanded(
                                      child: Icon(
                                        Icons.check_sharp,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )
                                  : Expanded(
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )
                            : null,
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
