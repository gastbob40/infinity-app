import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:infinity/domain/notifiers/calendar_notifier.dart';
import 'package:infinity/news.dart';
import 'package:infinity/views/pages/calendar/calendar_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  Intl.defaultLocale = 'en_US';
  initializeDateFormatting('en_US', '');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CalendarNotifier>(create: (_) {
      CalendarNotifier calendar = CalendarNotifier();
      calendar.fetch();
      return calendar;
    })
  ], child: MyApp()));
}

const Color darkBackground = Color(0xFF2D2D2D);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          accentColor: Colors.blue,
          backgroundColor: Color(0xFFF6F6F6)),
      dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          backgroundColor: darkBackground),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        home: Navigation(),
      ),
    );
  }
}

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [CalendarPage(), News()];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
