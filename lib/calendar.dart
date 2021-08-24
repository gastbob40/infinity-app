import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:google_fonts/google_fonts.dart';

const Color blockColor = Color(0xFF252525);

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
                        fontSize: 30, fontWeight: FontWeight.w100, color: Colors.white60),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ['Lun', 1],
                ['Mar', 2],
                ['Mer', 3],
                ['Jeu', 4],
                ['Ven', 5],
                ['Sam', 6],
                ['Dim', 7]
              ]
                  .map((e) => Column(children: [
                        Text(
                          e[0].toString(),
                          style: GoogleFonts.rubik(),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          e[1].toString(),
                          style: GoogleFonts.rubik(
                            fontSize: 11,
                            color: Colors.white60
                          ),
                        )
                      ]))
                  .toList(),
            ),
          ),
        ],
      ),
    ));
  }
}
