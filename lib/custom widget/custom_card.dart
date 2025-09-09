import 'package:flutter/material.dart';
import 'package:modern_quiz_app_ui/constatnts/strings.dart';

class CustomCard extends StatelessWidget {
  final List<Color> gradientColor;
  final String questionSection;
  final IconData iconData;
  final int index;
  final void Function()? onTap;
  const CustomCard({
    super.key,
    required this.questionSection,
    required this.iconData,
    required this.gradientColor,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 70),
      padding: EdgeInsets.all(30),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: gradientColor,
          begin: Alignment.centerLeft,
        ),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                padding: EdgeInsets.all(0),
              ),
              child: Icon(iconData, color: Colors.white, size: 20),
            ),
            SizedBox(height: 15),
            Text(
              "${AppStrings.level} $index",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white60,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 3),
            Text(
              questionSection,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
