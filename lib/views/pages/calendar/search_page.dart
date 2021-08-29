import 'package:flutter/material.dart';
import 'package:infinity/views/widget/calendar/group_select_widget.dart';
import 'package:infinity/views/widget/calendar/teacher_select_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Search Page"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Groups',
              ),
              Tab(
                text: 'Teachers',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GroupSelectWidget(),
            TeacherSelectWidget(),
          ],
        ),
      ),
    );
  }
}
