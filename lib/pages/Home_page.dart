import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:routinetracker/model/periods.dart';
import 'package:routinetracker/pages/period_tracker_screen.dart';
import 'package:routinetracker/pages/water_tracker_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final tabs = [
    WaterTrackerScreen(),
    ChangeNotifierProvider<Periods>(
        create: (BuildContext context) => Periods(),
        child: PeriodTrackerScreen())
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          //selectedFontSize: 20,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.glassWhiskey,
                ),
                backgroundColor: Colors.blue,
                label: "Water Tracker"),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.tint,
                color: Colors.pinkAccent,
              ),
              backgroundColor: Colors.pinkAccent,
              label: "Periods Tracker",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
