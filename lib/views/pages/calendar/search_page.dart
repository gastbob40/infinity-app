import 'package:flutter/material.dart';
import 'package:infinity/views/widget/calendar/group_select_widget.dart';
import 'package:infinity/views/widget/calendar/teacher_select_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    GroupSelectWidget(),
    TeacherSelectWidget(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Search Page"),
          bottom: TabBar(
            onTap: _onItemTap,
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
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      ),
    );
  }
}
