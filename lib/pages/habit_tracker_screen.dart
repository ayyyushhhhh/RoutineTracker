import 'package:flutter/material.dart';

class HabitTrackerScreen extends StatefulWidget {
  @override
  _HabitTrackerScreenState createState() => _HabitTrackerScreenState();
}

class _HabitTrackerScreenState extends State<HabitTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Habbit",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      iconSize: 30,
                      onPressed: () {})
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
