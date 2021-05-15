import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:routinetracker/models/water_tracker_model.dart';
import 'package:routinetracker/settings/prefrences.dart';
import 'package:routinetracker/widgets/container_clipper.dart';
import 'package:routinetracker/widgets/goal_setter_container.dart';
import 'package:routinetracker/widgets/radial_progress_indicator.dart';

// ignore: must_be_immutable
class WaterTrackerScreen extends StatefulWidget {
  @override
  _WaterTrackerScreenState createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  final WaterTrackerModel waterTrackerModel = WaterTrackerModel();
  double intake;
  double goal;
  @override
  void initState() {
    super.initState();
    intake = Prefrences.getIntake();
    goal = Prefrences.getGoal();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: ContainerClipper(),
                child: StreamBuilder<double>(
                    stream: waterTrackerModel.intakeStream,
                    initialData: intake,
                    builder: (context, snapshot) {
                      intake = snapshot.data;
                      Prefrences.saveIntake(intake);
                      return StreamBuilder<double>(
                          stream: waterTrackerModel.goalStream,
                          initialData: goal,
                          builder: (context, snapshot) {
                            goal = snapshot.data;
                            Prefrences.saveIntake(intake);
                            return Container(
                              height: screenHeight / 2,
                              width: screenWidth,
                              color: Colors.teal,
                              child: CustomPaint(
                                painter: RadialProgressIndicator(
                                    intakeVal: intake, goalVal: goal),
                                child: Center(
                                  child: Text(
                                    "${intake.toStringAsFixed(2)}L / ${goal.toStringAsFixed(2)}L",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Set Goal",
                style: TextStyle(fontSize: 30, letterSpacing: 1.5),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () => waterTrackerModel.updateGoal(2),
                  child: GoalSetter(
                    goalValue: '2L',
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => waterTrackerModel.updateGoal(2.5),
                  child: GoalSetter(
                    goalValue: '2.5L',
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => waterTrackerModel.updateGoal(3),
                  child: GoalSetter(
                    goalValue: '3L',
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => waterTrackerModel.updateGoal(3.5),
                  child: GoalSetter(
                    goalValue: '3.5L',
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => waterTrackerModel.updateGoal(4),
                  child: GoalSetter(
                    goalValue: '4L',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Stack(children: [
              Container(
                height: 100,
                width: 100,
                child: Icon(
                  FontAwesomeIcons.glassWhiskey,
                  color: Colors.blueAccent,
                  size: 100,
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Icon(
                  CupertinoIcons.add_circled,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Add Intake",
                style: TextStyle(fontSize: 30, letterSpacing: 1.5),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () => waterTrackerModel.updateInkate(intake + 0.100),
                  child: GoalSetter(
                    goalValue: '0.100L',
                    fontsize: 20,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => waterTrackerModel.updateInkate(intake + 0.250),
                  child: GoalSetter(
                    goalValue: '0.250L',
                    fontsize: 20,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => waterTrackerModel.updateInkate(intake + 0.500),
                  child: GoalSetter(
                    goalValue: '0.500L',
                    fontsize: 20,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => waterTrackerModel.updateInkate(intake + 1),
                  child: GoalSetter(
                    goalValue: '1L',
                    fontsize: 20,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => waterTrackerModel.updateInkate(intake + 1.5),
                  child: GoalSetter(
                    goalValue: '1.5L',
                    fontsize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
