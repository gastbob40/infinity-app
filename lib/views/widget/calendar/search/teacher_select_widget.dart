import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinity/data/repository/teacher_repository.dart';
import 'package:infinity/domain/entities/selection_entity.dart';
import 'package:infinity/domain/entities/teacher_entity.dart';
import 'package:infinity/domain/notifiers/calendar_notifier.dart';
import 'package:provider/provider.dart';

class TeacherSelectWidget extends StatefulWidget {
  const TeacherSelectWidget({Key? key}) : super(key: key);

  @override
  _TeacherSelectWidgetState createState() => _TeacherSelectWidgetState();
}

class _TeacherSelectWidgetState extends State<TeacherSelectWidget> {
  List<TeacherEntity> allTeachers = [];
  List<TeacherEntity> displayTeachers = [];

  @override
  Widget build(BuildContext context) {
    TeacherRepository teacherRepository = TeacherRepository();
    CalendarNotifier calendarNotifier = Provider.of(context);

    return Container(
      child: FutureBuilder<List<TeacherEntity>>(
        future: teacherRepository.getTeachers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              'There was an error :(',
              style: Theme.of(context).textTheme.headline5,
            );
          }

          if (snapshot.hasData) {
            if (this.allTeachers.length == 0) {
              this.allTeachers = snapshot.data ?? [];
              this.displayTeachers = this.allTeachers;
            }

            return Container(
              padding: EdgeInsets.all(16),
              child: Column(children: [
                TextField(
                  onChanged: filter,
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: GoogleFonts.rubik(
                      color: Theme.of(context).accentColor,
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).accentColor,
                    ),
                    fillColor: Theme.of(context).accentColor,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                    child: ListView.separated(
                  itemCount: displayTeachers.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.white30,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () =>
                          calendarNotifier.setTeacher(displayTeachers[index]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              displayTeachers[index].name,
                              style: GoogleFonts.rubik(fontSize: 16),
                            ),
                          ),
                          Radio(
                            value: displayTeachers[index].id,
                            groupValue: calendarNotifier.selection.type ==
                                SelectionType.TEACHER
                                ? calendarNotifier.selection.teacherEntity?.id
                                : -1,
                            onChanged: (i) => calendarNotifier
                                .setTeacher(displayTeachers[index]),
                            activeColor: Theme.of(context).accentColor,
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            fillColor: MaterialStateColor.resolveWith(
                                    (states) => Theme.of(context).accentColor),
                          )
                        ],
                      ),
                    );
                  },
                )),
              ]),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).accentColor,
            ),
          );
        },
      ),
    );
  }

  void filter(String filter) {
    setState(() {
      displayTeachers = this.allTeachers.where((e) => e.match(filter)).toList();
    });
  }
}
