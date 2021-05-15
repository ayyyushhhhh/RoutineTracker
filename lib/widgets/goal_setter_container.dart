import 'package:flutter/material.dart';

enum inputType { goal, intake }

class GoalSetter extends StatelessWidget {
  final String goalValue;
  final double fontsize;

  GoalSetter({Key key, @required this.goalValue, this.fontsize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          goalValue,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontsize == null ? 30 : fontsize,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2),
        ),
      ),
    );
  }
}
