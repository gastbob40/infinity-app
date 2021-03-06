import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinity/domain/notifiers/calendar_notifier.dart';
import 'package:infinity/views/pages/calendar/search_page.dart';
import 'package:infinity/views/theme.dart';
import 'package:provider/provider.dart';

class CalendarHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalendarNotifier calendarNotifier = Provider.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              calendarNotifier.currentYear.toString(),
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primaryFontColor,
                fontSize: 40,
              ),
            ),
            Text(
              calendarNotifier.currentMonth,
              style: GoogleFonts.rubik(
                fontSize: 30,
                fontWeight: FontWeight.w100,
                color: Theme.of(context).colorScheme.secondaryFontColor,
              ),
            )
          ],
        ),
        Spacer(),
        Row(
          children: [
            IconButton(
                onPressed: () => selectDate(context, calendarNotifier),
                icon: Icon(
                  Icons.event_outlined,
                  color: Theme.of(context).colorScheme.primaryFontColor,
                )),
            PopupMenuButton<String>(
              onSelected: (value) =>
                  popupAction(context, value, calendarNotifier),
              itemBuilder: (BuildContext context) {
                return {'Groups', 'Refresh'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
      ],
    );
  }

  selectDate(BuildContext context, CalendarNotifier calendarNotifier) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: calendarNotifier.currentDate,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != calendarNotifier.currentDate)
      calendarNotifier.setDate(selected);
  }

  popupAction(
      BuildContext context, String value, CalendarNotifier calendarNotifier) {
    if (value == 'Groups') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    } else if (value == 'Refresh') {
      calendarNotifier.fetch();
    }
  }
}
