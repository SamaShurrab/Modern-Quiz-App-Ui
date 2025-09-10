import 'package:flutter/material.dart';

class CircularCountDown extends StatelessWidget {
  final int timeLeft;
  final int totalSeconds;
  const CircularCountDown({
    super.key,
    required this.timeLeft,
    required this.totalSeconds,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = timeLeft / totalSeconds;
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SizedBox(
              height: 45,
              width: 45,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 4,
                backgroundColor: Colors.white38,
                valueColor: const AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            timeLeft.toString().padLeft(2, "0"),
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
