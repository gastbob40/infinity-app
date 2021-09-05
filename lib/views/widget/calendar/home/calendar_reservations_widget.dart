import 'package:flutter/material.dart';
import 'package:infinity/domain/entities/selection_entity.dart';
import 'package:infinity/domain/notifiers/calendar_notifier.dart';
import 'package:infinity/views/widget/calendar/home/calendar_reservations_item_widget.dart';
import 'package:provider/provider.dart';

const Color blockColor = Color(0xFF252525);
const Color separator = Color(0x1FFFFFFF);

class CalendarReservationsWidget extends StatelessWidget {
  const CalendarReservationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalendarNotifier calendarNotifier = Provider.of(context);

    if (calendarNotifier.selection.type == SelectionType.NONE) {
      return Expanded(child: Text('No group selected'));
    }

    if (calendarNotifier.loading == true) {
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).accentColor,
          ),
        ),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: calendarNotifier
              .getDayReservation(calendarNotifier.currentDate)
              .map((e) => CalendarReservationsItemWidget(e))
              .toList(),
        ),
      ),
    );
  }
}
