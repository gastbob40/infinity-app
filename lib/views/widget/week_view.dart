import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color blockColor = Color(0xFF252525);
const Color separator = Color(0x1FFFFFFF);

const days = [
  ['Lun', 1],
  ['Mar', 2],
  ['Mer', 3],
  ['Jeu', 4],
  ['Ven', 5],
  ['Sam', 6],
  ['Dim', 7]
];

class WeekView extends StatelessWidget {
  const WeekView({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
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
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index)  {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: days.map((e) => Column(children: [
                    Text(
                      e[0].toString(),
                      style: GoogleFonts.rubik(),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      (int.parse(e[1].toString()) + index * 7).toString(),
                      style: GoogleFonts.rubik(
                          fontSize: 11, color: Colors.white60),
                    )
                  ])).toList()
              ),
            );
          },
        )
    );
  }
}
