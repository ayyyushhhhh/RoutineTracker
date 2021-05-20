import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:routinetracker/model/periods.dart';
import 'package:routinetracker/settings/prefrences.dart';
import 'package:routinetracker/widgets/periodsTracker/calender_container.dart';
import 'package:routinetracker/widgets/periodsTracker/period_tracker_radial_indicator.dart';
import 'package:routinetracker/widgets/periodsTracker/periods_info_card.dart';

class PeriodTrackerScreen extends StatelessWidget {
  final scaffoldState = GlobalKey<ScaffoldState>();

  void _buildCalender(
      BuildContext scafoldContext, double screenHeight, double screenWidth) {
    showModalBottomSheet(
        isDismissible: true,
        context: scafoldContext,
        builder: (BuildContext context) {
          return CalendarContainer(
            screenHeight: screenHeight,
            screenWidth: screenHeight,
            periods: Provider.of<Periods>(scafoldContext, listen: false),
          );
        });
  }

  void _updateData(Periods data) {
    int currentAverage = Prefrences.getAverageDays();
    int diff = DateTime.now()
        .difference(DateTime.parse(Prefrences.getPeriodFirstDayDate()))
        .inDays;
    int newAverage = (currentAverage + diff.abs()) ~/ 2;
    data.updateAverageDays(newAverage);
    data.updatePeriodsFirstDay(DateTime.now().toString());
    Prefrences.savePeriodDayDate(DateTime.now().toString());
    data.updatePeriodDay();
    data.updateRemainingDays();
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldState,
      body: Container(
        height: _screenHeight,
        width: _screenWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Color(0xFFFD699D),
          ],
        )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "Periods Tracker",
                  style: TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFD699D)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: _screenHeight / 2,
                width: _screenWidth,
                child: CustomPaint(
                  painter: RadialPeriodTracker(),
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFFE9079)),
                      child: InkWell(
                        onTap: () {
                          _buildCalender(context, _screenHeight, _screenWidth);
                        },
                        child: Center(
                            child: Text(
                          "Enter Last Period",
                          style: TextStyle(
                            color: Color(0xFFDD3637),
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Consumer<Periods>(
                builder: (BuildContext context, data, Widget child) =>
                    Container(
                        height: 60,
                        margin: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "AVERAGE CYCLE",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purpleAccent),
                                ),
                                Text(data.averagePeriodCycle.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white))
                              ],
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.tint,
                                      color: Colors.red,
                                    ),
                                    iconSize: 30,
                                    onPressed: () {
                                      _updateData(data);
                                    }),
                                Text(
                                  "(Tap here on Periods)",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "REMAINING DAYS",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                Text(data.remainingDays.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white))
                              ],
                            ),
                          ],
                        )),
              ),
              Consumer<Periods>(
                builder: (BuildContext context, data, Widget child) =>
                    Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PeriodsInfoCard(
                          headingText: "Last Period Date", date: data.firstDay),
                      SizedBox(
                        width: 20,
                      ),
                      PeriodsInfoCard(
                          headingText: "Predicted Date", date: data.periodDay),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
