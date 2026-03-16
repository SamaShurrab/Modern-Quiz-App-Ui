import 'package:flutter/material.dart';
import 'package:modern_quiz_app_ui/constatnts/strings.dart';
import 'package:modern_quiz_app_ui/pages/quiz_page.dart';

class SectionDescriptionPage extends StatelessWidget {
  final String level;
  final String sectionQuestion;
  final String imageSectionPath;
  final String sectionDescription;
  final List<Color> backGround;

  const SectionDescriptionPage({
    super.key,
    required this.level,
    required this.imageSectionPath,
    required this.sectionQuestion,
    required this.sectionDescription,
    required this.backGround,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: backGround,
                begin: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    shape: CircleBorder(),
                    side: BorderSide(color: Colors.white),
                  ),
                  label: Icon(Icons.close, color: Colors.white, size: 22),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(imageSectionPath, width: 210, height: 210),
                ),
                SizedBox(height: 70),
                Text(
                  level,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  sectionQuestion,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  sectionDescription,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      shadowColor: Colors.grey,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return QuizPage(
                              textColor: backGround[0],
                              backGround: backGround,
                              imageSectionPath: imageSectionPath,
                              sectionQuestion: sectionQuestion,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      AppStrings.game,
                      style: TextStyle(
                        color: backGround[0],
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
