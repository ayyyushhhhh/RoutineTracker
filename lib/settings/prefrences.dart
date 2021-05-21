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

  static String getDate() {
    String date = preferences.getString("currentDate");
    if (date == null) {
      Prefrences.saveDate(DateTime.now().toString());
      return DateTime.now().toString();
    }
    return date;
  }

  static void saveDate(String date) async {
    if (date == null) {
      date = DateTime.now().toString();
    }
    preferences.setString("currentDate", date);
  }

  static String getPeriodFirstDayDate() {
    String date = preferences.getString("periodFirstDayDate");
    if (date == null) {
      return DateTime.now().toString();
    }
    return date;
  }

  static void savePeriodFirstDayDate(String date) {
    if (date == null) {
      date = DateTime.now().toString();
    }
    preferences.setString("periodFirstDayDate", date);
  }

  static String getPeriodDayDate() {
    String date = preferences.getString("periodDayDate");
    if (date == null) {
      return DateTime.now().add(Duration(days: 28)).toString();
    }
    return date;
  }

  static void savePeriodDayDate(String date) {
    int duration = Prefrences.getAverageDays();
    if (date == null) {
      date = DateTime.now().add(Duration(days: duration)).toString();
    } else {
      date = DateTime.parse(preferences.getString("periodFirstDayDate"))
          .add(Duration(days: duration))
          .toString();
    }
    preferences.setString("periodDayDate", date);
  }

  static int getAverageDays() {
    int average = preferences.getInt("averageDays");
    if (average == null) {
      return 28;
    }
    return average;
  }

  static void saveAverageDays(int average) {
    preferences.setInt("averageDays", average);
  }
}
