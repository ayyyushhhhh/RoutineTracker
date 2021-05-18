import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinetracker/model/periods.dart';
import 'package:routinetracker/pages/habit_tracker_screen.dart';
import 'package:routinetracker/pages/period_tracker_screen.dart';
import 'package:routinetracker/pages/water_tracker_screen.dart';
import 'package:routinetracker/settings/prefrences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: await_only_futures
  await Prefrences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) => Periods(),
          child: PeriodTrackerScreen()),
    );
  }
}
