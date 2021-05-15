import 'package:flutter/material.dart';
import 'package:routinetracker/pages/water_tracker_screen.dart';
import 'package:routinetracker/settings/prefrences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: WaterTrackerScreen(),
    );
  }
}
