// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:table_calendar/table_calendar.dart';

Color primaryColor = const Color(0xff71858E);

class CallanderEvent extends StatefulWidget {
  CallanderEvent(
      {super.key, this.height, this.width, required this.lessonsAvailableAt});
  double? height;
  double? width;
  final List<DateTime> lessonsAvailableAt;

  @override
  State<CallanderEvent> createState() => _CallanderEventState();
}

class _CallanderEventState extends State<CallanderEvent> {
  DateTime? dateSelected;
  DateTime focusedDay = DateTime.now();
  String? timeSlotSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: focusedDay,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
              ),
              onPageChanged: (focusedDay) {
                setState(() {
                  this.focusedDay = focusedDay;
                });
              },
              pageJumpingEnabled: false,
              pageAnimationEnabled: false,
              calendarBuilders: CalendarBuilders(
                todayBuilder: (context, day, focusedDay) => DayBuilder(
                    isHighlighted: widget.lessonsAvailableAt
                        .where((element) => compareDates(element, day))
                        .isNotEmpty,
                    day: day),
                defaultBuilder: (context, day, focusedDay) => DayBuilder(
                    isHighlighted: widget.lessonsAvailableAt
                        .where((element) => compareDates(element, day))
                        .isNotEmpty,
                    day: day),
                weekNumberBuilder: (context, weekNumber) => const SizedBox(),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                if (widget.lessonsAvailableAt
                    .where((element) => compareDates(element, selectedDay))
                    .isNotEmpty)
                  FFAppState().update(() {
                    FFAppState().callenderDateSelected = DateTime(
                        selectedDay.year, selectedDay.month, selectedDay.day);
                  });
              },
            ),
          ),
        ],
      ),
    );
  }

  bool compareDates(DateTime d1, DateTime d2) {
    return d1.day == d2.day && d1.month == d2.month && d1.year == d2.year;
  }
}

class DayBuilder extends StatelessWidget {
  const DayBuilder({super.key, required this.isHighlighted, required this.day});
  final bool isHighlighted;
  final DateTime day;

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isHighlighted ? Colors.orange : Colors.transparent,
        ),
        child: Text(
          day.day.toString(),
          style: TextStyle(
            color: isHighlighted ? Colors.white : null,
          ),
        ));
  }
}
