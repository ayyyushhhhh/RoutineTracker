import 'package:flutter/cupertino.dart';
import 'package:routinetracker/settings/prefrences.dart';

class Periods extends ChangeNotifier {
  int averagePeriodCycle = Prefrences.getAverageDays();
  String firstDay = Prefrences.getPeriodFirstDayDate();
  String periodDay = Prefrences.getPeriodDayDate();
  int remainingDays = DateTime.parse(Prefrences.getPeriodDayDate())
      .difference(DateTime.now())
      .inDays;
  String get periodFirstDate => firstDay;
  String get periodDayDate => periodDay;

  void updatePeriodsFirstDay(String date) {
    Prefrences.savePeriodFirstDayDate(date);
    firstDay = date;
    notifyListeners();
  }

  void updatePeriodDay() {
    periodDay = Prefrences.getPeriodDayDate();
    print(periodDay);
    notifyListeners();
  }

  void updateAverageDays(int diffrence) {
    diffrence = diffrence.abs();
    Prefrences.saveAverageDays(diffrence);
    averagePeriodCycle = Prefrences.getAverageDays();
    notifyListeners();
  }

  void updateRemainingDays() {
    remainingDays = DateTime.parse(Prefrences.getPeriodDayDate())
        .difference(DateTime.now())
        .inDays;
    notifyListeners();
  }
}
