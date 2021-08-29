import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinity/views/widget/calendar/home/calendar_header_widget.dart';
import 'package:infinity/views/widget/calendar/home/calendar_reservations_widget.dart';
import 'package:infinity/views/widget/calendar/home/week_picker.dart';

const Color blockColor = Color(0xFF252525);
const Color separator = Color(0x1FFFFFFF);

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CalendarHeaderWidget(),
          SizedBox(
            height: 30,
          ),
          WeekPicker(),
          SizedBox(
            height: 30,
          ),
          CalendarReservationsWidget()
        ],
      ),
    ));
  }
}
