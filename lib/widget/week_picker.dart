import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinity/models/calendar_notifier.dart';
import 'package:provider/provider.dart';

const Color blockColor = Color(0xFF252525);
const Color separator = Color(0x1FFFFFFF);

const days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

class WeekPicker extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    CalendarNotifier calendarNotifier = Provider.of(context);

    return Container(
        height: 70,
        decoration: BoxDecoration(
          color: blockColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 1,
              offset: Offset(0, 1), // Shadow position
            )
          ],
        ),
        padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: Listener(
          child: PageView.builder(
            onPageChanged: (index) async {
              print(index);
              if (index == 2)
                calendarNotifier.nextWeek();
              else if (index == 0) calendarNotifier.prevWeek();

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

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: date
                        .getWeekDays()
                        .mapIndexed((e, i) => Column(children: [
                              Text(
                                days[i],
                                style: GoogleFonts.rubik(),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                e.toString(),
                                style: GoogleFonts.rubik(
                                    fontSize: 11, color: Colors.white60),
                              )
                            ]))
                        .toList()),
              );
            },
          ),
        ));
  }
}
