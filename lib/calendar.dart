import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinity/widget/week_picker.dart';

const Color blockColor = Color(0xFF252525);
const Color separator = Color(0x1FFFFFFF);

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2021',
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    'Septembre',
                    style: GoogleFonts.rubik(
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                        color: Colors.white60),
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.event_outlined,
                        color: Colors.white,
                      )),
                  PopupMenuButton<String>(
                    onSelected: null,
                    itemBuilder: (BuildContext context) {
                      return {'Logout', 'Settings'}.map((String choice) {
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
          ),
          SizedBox(
            height: 30,
          ),
          WeekPicker(),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
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
                  height: 100,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(width: 1, color: separator)),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '9h00',
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w100),
                            ),
                            Text(
                              '10h00',
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w100),
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
                            Text('Séminaire Algo', style: GoogleFonts.rubik()),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(Icons.place_outlined, size: 11, color: Colors.white60,),
                                  Text('VA 106', style: GoogleFonts.rubik(fontSize: 11, color: Colors.white60),)
                                ],),
                                Row(children: [
                                  Icon(Icons.person_outlined, size: 11, color: Colors.white60,),
                                  Text('Nom Prenom', style: GoogleFonts.rubik(fontSize: 11, color: Colors.white60),)
                                ],)
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ))
            ]),
          )
        ],
      ),
    ));
  }
}
