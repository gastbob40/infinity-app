import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinity/domain/entities/day_reservations_entity.dart';
import 'package:infinity/domain/entities/selection_entity.dart';
import 'package:infinity/domain/notifiers/calendar_notifier.dart';
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

    return Expanded(
      child: FutureBuilder<List<DayReservationsEntity>>(
          future: calendarNotifier.getDaysReservations(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                'There was an error :(',
                style: Theme.of(context).textTheme.headline5,
              );
            }

            if (snapshot.hasData) {
              return Text(
                'There is some data',
                style: Theme.of(context).textTheme.headline5,
              );
            }

            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).accentColor,
              ),
            );
          }),
    );

    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
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
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border(right: BorderSide(width: 1, color: separator)),
                  ),
                  padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '9h00',
                        style: GoogleFonts.rubik(fontWeight: FontWeight.w100),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        '10h00',
                        style: GoogleFonts.rubik(fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Reprise Alexandre', style: GoogleFonts.rubik()),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.place_outlined,
                                size: 11,
                                color: Colors.white60,
                              ),
                              Text(
                                'VA 106',
                                style: GoogleFonts.rubik(
                                    fontSize: 11, color: Colors.white60),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person_outlined,
                                size: 11,
                                color: Colors.white60,
                              ),
                              Text(
                                'Nom Prenom',
                                style: GoogleFonts.rubik(
                                    fontSize: 11, color: Colors.white60),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
