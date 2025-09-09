import 'package:flutter/material.dart';
import 'package:modern_quiz_app_ui/constatnts/strings.dart';
import 'package:modern_quiz_app_ui/pages/home_page.dart';

class ResultPage extends StatelessWidget {
  final int numberCorrectQuestion;
  final List<Color> colors;
  final int totalQuestion;
  const ResultPage({
    super.key,
    required this.numberCorrectQuestion,
    required this.colors,
    required this.totalQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: colors[0],
                shape: BoxShape.circle,
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors[1],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.score,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "$numberCorrectQuestion/$totalQuestion",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),

            Text(
              numberCorrectQuestion >= 3
                  ? AppStrings.congratulations
                  : AppStrings.failed,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Text(
              numberCorrectQuestion >= 3
                  ? AppStrings.congratulationsMessage
                  : AppStrings.failedMessage,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 50),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors[0],
                  elevation: 3,
                  padding: EdgeInsets.all(20),
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  AppStrings.back,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
