import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinity/data/repository/group_repository.dart';
import 'package:infinity/domain/entities/group_entity.dart';
import 'package:infinity/domain/entities/selection_entity.dart';
import 'package:infinity/domain/notifiers/calendar_notifier.dart';
import 'package:provider/provider.dart';

class GroupSelectWidget extends StatefulWidget {
  const GroupSelectWidget({Key? key}) : super(key: key);

  @override
  _GroupSelectWidgetState createState() => _GroupSelectWidgetState();
}

class _GroupSelectWidgetState extends State<GroupSelectWidget> {
  List<GroupEntity> allGroups = [];
  List<GroupEntity> displayGroups = [];

  @override
  Widget build(BuildContext context) {
    GroupRepository groupRepository = GroupRepository();
    CalendarNotifier calendarNotifier = Provider.of(context);

    return Container(
      child: FutureBuilder<List<GroupEntity>>(
        future: groupRepository.getGroups(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              'There was an error :(',
              style: Theme.of(context).textTheme.headline5,
            );
          }

          if (snapshot.hasData) {
            if (this.allGroups.length == 0) {
              this.allGroups = snapshot.data ?? [];
              this.displayGroups = this.allGroups;
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
                  itemCount: displayGroups.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.white30,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () =>
                          calendarNotifier.setGroup(displayGroups[index]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              displayGroups[index].name,
                              style: GoogleFonts.rubik(fontSize: 16),
                            ),
                          ),
                          Radio(
                            value: displayGroups[index].id,
                            groupValue: calendarNotifier.selection.type ==
                                    SelectionType.GROUP
                                ? calendarNotifier.selection.groupEntity?.id
                                : -1,
                            onChanged: (i) =>
                                calendarNotifier.setGroup(displayGroups[index]),
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
      displayGroups = this.allGroups.where((e) => e.match(filter)).toList();
    });
  }
}
