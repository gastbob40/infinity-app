import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinity/domain/entities/reservation_entity.dart';

const Color blockColor = Color(0xFF252525);
const Color separator = Color(0x1FFFFFFF);

class CalendarReservationsItemWidget extends StatelessWidget {
  ReservationEntity reservationEntity;

  CalendarReservationsItemWidget(this.reservationEntity);

  @override
  Widget build(BuildContext context) {
    print(this.reservationEntity);
    return Container(
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
              border: Border(right: BorderSide(width: 1, color: separator)),
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  reservationEntity.getFormattedStart(),
                  style: GoogleFonts.rubik(fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  reservationEntity.getFormattedEnd(),
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
                Text(reservationEntity.name, style: GoogleFonts.rubik()),
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
                          reservationEntity.rooms,
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
                          reservationEntity.teachers,
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
      margin: EdgeInsets.only(bottom: 16),
    );
  }
}
