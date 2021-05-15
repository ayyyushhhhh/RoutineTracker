import 'package:shared_preferences/shared_preferences.dart';

class Prefrences {
  static SharedPreferences preferences;

  static void init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveGoal(double value) async {
    preferences.setDouble("savedGoal", value);
  }

  static void saveIntake(double value) async {
    if (value == null) {
      value = 0;
    }
    preferences.setDouble("savedIntake", value);
  }

  static double getIntake() {
    double intake = preferences.getDouble("savedIntake");
    if (intake == null) {
      return 0;
    }
    return intake;
  }

  static double getGoal() {
    double goal = preferences.getDouble("savedGoal");
    if (goal == null) {
      return 2;
    }
    return goal;
  }
}
