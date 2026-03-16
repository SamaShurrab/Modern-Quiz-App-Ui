import 'package:flutter/material.dart';
import 'package:modern_quiz_app_ui/classes/questions_model.dart';
import 'package:modern_quiz_app_ui/constatnts/colors.dart';
import 'package:modern_quiz_app_ui/constatnts/paths.dart';
import 'package:modern_quiz_app_ui/constatnts/strings.dart';
import 'package:modern_quiz_app_ui/custom%20widget/custom_card.dart';
import 'package:modern_quiz_app_ui/pages/section_description_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<Color>> gradientColor = [
      [AppColors.primaryColor, AppColors.primaryColorLight],
      [AppColors.color4, AppColors.colorgradianet4],
      [AppColors.color2, AppColors.colorgradianet2],
    ];
    QuestionsModel questionsModel = QuestionsModel();
    List<IconData> iconDataList = [
      Icons.check,
      Icons.arrow_forward_ios_rounded,
      Icons.lock,
      Icons.lock,
    ];

    List<String> imagePathList = [
      AppPaths.flutterImgePath,
      AppPaths.andriodImagePath,
      AppPaths.frontImagePath,
    ];
    List<String> sectionDescription = [
      AppStrings.flutterSectionDes,
      AppStrings.andriodSectionDes,
      AppStrings.frontEndSectionDes,
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(side: BorderSide.none),
                      padding: EdgeInsets.all(0),
                    ),
                    label: Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                      size: 22,
                    ),
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(side: BorderSide.none),
                      padding: EdgeInsets.all(0),
                    ),
                    onPressed: () {},
                    label: Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                      size: 22,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.letsPlay,
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.color1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.beTheFirst,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 40),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: questionsModel.questionSections.length,
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CustomCard(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SectionDescriptionPage(
                                  backGround: gradientColor[index],
                                  level: "${AppStrings.level}  ${index + 1}",
                                  imageSectionPath: imagePathList[index],
                                  sectionDescription: sectionDescription[index],
                                  sectionQuestion:
                                      questionsModel.questionSections[index],
                                );
                              },
                            ),
                          );
                        },
                        index: index + 1,
                        gradientColor: gradientColor[index],
                        iconData: iconDataList[index],
                        questionSection: questionsModel.questionSections[index],
                      ),
                      Positioned(
                        right: 20,
                        top: -40,
                        child: Image.asset(
                          imagePathList[index],
                          width: 95,
                          height: 95,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
