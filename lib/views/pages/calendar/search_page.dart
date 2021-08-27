import 'package:flutter/material.dart';
import 'package:infinity/domain/notifiers/calendar_notifier.dart';
import 'package:provider/provider.dart';

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
      ),
    );
  }
}