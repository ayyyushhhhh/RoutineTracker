import 'package:flutter/material.dart';
import 'package:routinetracker/model/periods.dart';
import 'package:routinetracker/settings/prefrences.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarContainer extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  final Periods periods;
  const CalendarContainer({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.periods,
  }) : super(key: key);

  @override
  _CalendarContainerState createState() => _CalendarContainerState();
}

class _CalendarContainerState extends State<CalendarContainer> {
  DateTime _focusedDay = DateTime.parse(Prefrences.getPeriodFirstDayDate());
  DateTime _selectedDay = DateTime.parse(Prefrences.getPeriodDayDate());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedDay);
    return Container(
      height: widget.screenHeight / 2,
      width: widget.screenWidth,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2021, 03, 01),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = _selectedDay; // update `_focusedDay` here as well
          });
          widget.periods.updatePeriodsFirstDay(_focusedDay.toString());
          Prefrences.savePeriodDayDate(_focusedDay.toString());
          widget.periods.updatePeriodDay();
        },
      ),
    );
  }
}
