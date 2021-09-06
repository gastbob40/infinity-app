import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinity/domain/entities/reservation_entity.dart';
import 'package:infinity/views/theme.dart';

class CalendarReservationsItemWidget extends StatelessWidget {
  ReservationEntity reservationEntity;

  CalendarReservationsItemWidget(this.reservationEntity);

  @override
  Widget build(BuildContext context) {
    print(this.reservationEntity);
    return GestureDetector(
      onTap: () => showReservationEntity(context, this.reservationEntity),
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.blockBackgroundColor,
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
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.separatorColor)),
                ),
                padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reservationEntity.getFormattedStart(),
                      style: GoogleFonts.rubik(fontWeight: FontWeight.w100),
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
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.place_outlined,
                                  size: 11,
                                  color: Colors.white60,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  reservationEntity.rooms,
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: Colors.white60),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 4),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_outlined,
                                  size: 11,
                                  color: Colors.white60,
                                ),
                                Expanded(
                                  child: Text(
                                    reservationEntity.teachers,
                                    style: GoogleFonts.rubik(
                                        fontSize: 11, color: Colors.white60),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
        margin: EdgeInsets.only(bottom: 16),
      ),
    );
  }

  showReservationEntity(
      BuildContext context, ReservationEntity reservationEntity) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reservationEntity.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(fontSize: 18),
              ),
              Text(
                reservationEntity.type,
                style: GoogleFonts.rubik(
                  fontSize: 13,
                  color: Colors.white60,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Icon(
                    Icons.schedule_outlined,
                    size: 15,
                    color: Colors.white60,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      reservationEntity.getFormattedStart() +
                          ' to ' +
                          reservationEntity.getFormattedEnd(),
                      style: GoogleFonts.rubik(
                          fontSize: 15, color: Colors.white60),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.place_outlined,
                    size: 15,
                    color: Colors.white60,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      reservationEntity.rooms,
                      style: GoogleFonts.rubik(
                          fontSize: 15, color: Colors.white60),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person_outlined,
                    size: 15,
                    color: Colors.white60,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      reservationEntity.teachers,
                      style: GoogleFonts.rubik(
                          fontSize: 15, color: Colors.white60),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.groups_outlined,
                    size: 15,
                    color: Colors.white60,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      reservationEntity.groups,
                      style: GoogleFonts.rubik(
                          fontSize: 15, color: Colors.white60),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
