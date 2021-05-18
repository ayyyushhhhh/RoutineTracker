import 'dart:async';

class WaterTrackerBloc {
  StreamController<double> _goalStreamController = StreamController<double>();
  StreamController<double> _intakeStreamController =
      StreamController<double>.broadcast();

  Stream<double> get intakeStream => _intakeStreamController.stream;
  Stream<double> get goalStream => _goalStreamController.stream;

  void updateInkate(double intakeValue) {
    _intakeStreamController.add(intakeValue);
  }

  void updateGoal(double goalValue) {
    _goalStreamController.add(goalValue);
  }

  void dispose() {
    _goalStreamController.close();
    _intakeStreamController.close();
  }
}
