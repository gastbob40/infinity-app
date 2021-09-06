import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinity/domain/entities/selection_entity.dart';
import 'package:infinity/domain/notifiers/calendar_notifier.dart';
import 'package:infinity/views/widget/calendar/home/calendar_reservations_item_widget.dart';
import 'package:provider/provider.dart';

const Color blockColor = Color(0xFF252525);
const Color separator = Color(0x1FFFFFFF);

class CalendarReservationsWidget extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 1);
  int currentPage = 1;

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
      child: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is UserScrollNotification) {
            if (notification.direction == ScrollDirection.idle) {
              if (this.currentPage == 2)
                calendarNotifier.nextDay();
              else if (this.currentPage == 0) calendarNotifier.prevDay();

              if (this.currentPage != 1) {
                pageController.jumpToPage(1);
              }
            }
          }

          return true;
        },
        child: PageView.builder(
            physics: ClampingScrollPhysics(),
            onPageChanged: (index) async {
              this.currentPage = index;
            },
            itemCount: 3,
            controller: pageController,
            itemBuilder: (context, index) {
              var date = calendarNotifier.currentDate;
              if (index == 0)
                date = date.subtract(Duration(days: 1));
              else if (index == 2) date = date.add(Duration(days: 1));

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
