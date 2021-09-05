import 'package:flutter/material.dart';
import 'package:infinity/domain/entities/selection_entity.dart';
import 'package:infinity/domain/notifiers/calendar_notifier.dart';
import 'package:infinity/views/widget/calendar/home/calendar_reservations_item_widget.dart';
import 'package:provider/provider.dart';

const Color blockColor = Color(0xFF252525);
const Color separator = Color(0x1FFFFFFF);

class CalendarReservationsWidget extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 1);

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
      child: Listener(
        child: PageView.builder(
            onPageChanged: (index) async {
              print(index);
              if (index == 2)
                calendarNotifier.nextDay();
              else if (index == 0) calendarNotifier.prevDay();

              if (index != 1) {
                pageController.animateToPage(1,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              }
            },
            itemCount: 3,
            controller: pageController,
            itemBuilder: (context, index) {
              var date = calendarNotifier.currentDate;
              if (index == 0)
                date = date.subtract(Duration(days: 7));
              else if (index == 2) date = date.add(Duration(days: 7));

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: SingleChildScrollView(
                  child: Column(
                    children: calendarNotifier
                        .getDayReservation(date)
                        .map((e) => CalendarReservationsItemWidget(e))
                        .toList(),
                  ),
                ),
              );
            }),
      ),
    );

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
