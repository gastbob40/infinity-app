import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo2',
      home: Navigation(),
    );
  }
}

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [Calendar(), News()];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('ze')),
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.event_outlined), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.email_outlined), label: 'News')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text('Calendar'),
      ),
    );
  }
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text('News'),
      ),
    );
  }
}
