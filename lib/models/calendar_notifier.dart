import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension LanguageExtension on DateTime {
  String getMonthString() {
    return new DateFormat.MMMM().format(this);
  }

  String getDayStringString() {
    return new DateFormat.EEEE().format(this);
  }

  List<int> getWeekDays() {
    List<int> days = [];
    DateTime start = this.subtract(Duration(days: this.weekday));

    for (var i = 0; i < 7; i++) {
      days.add(start.day);
      start = start.add(Duration(days: 1));
    }

    return days;
  }
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

class CalendarNotifier extends ChangeNotifier {
  DateTime _currentDate = new DateTime.now();

  int get currentDay => _currentDate.day;
  String get currentMonth => _currentDate.getMonthString();
  int get currentYear => _currentDate.year;
  DateTime get currentDate => _currentDate;

  void setDate(DateTime dateTime) {
    this._currentDate = dateTime;
    this.notifyListeners();
  }

  void nextWeek() {
    this._currentDate = this._currentDate.add(Duration(days: 7));
    this.notifyListeners();
  }

  void prevWeek() {
    this._currentDate = this._currentDate.subtract(Duration(days: 7));
    this.notifyListeners();
  }
}