import 'package:flutter/material.dart';
import 'package:infinity/data/repository/reservation_repository.dart';
import 'package:infinity/data/repository/selection_repository.dart';
import 'package:infinity/domain/entities/day_reservations_entity.dart';
import 'package:infinity/domain/entities/group_entity.dart';
import 'package:infinity/domain/entities/reservation_entity.dart';
import 'package:infinity/domain/entities/selection_entity.dart';
import 'package:infinity/domain/entities/teacher_entity.dart';
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
    DateTime start = this.subtract(Duration(days: this.weekday - 1));

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
  // Repository
  SelectionRepository _selectionRepository = SelectionRepository();
  ReservationRepository _reservationRepository = ReservationRepository();

  // Data
  DateTime _currentDate = new DateTime.now();
  SelectionEntity selection = SelectionEntity.empty();
  List<DayReservationsEntity> daysReservations = [];
  bool _loading = true;

  int get currentDay => _currentDate.day;

  String get currentMonth => _currentDate.getMonthString();

  int get currentYear => _currentDate.year;

  DateTime get currentDate => _currentDate;

  int get currentWeekDay => _currentDate.weekday - 1;

  bool get loading => _loading;

  List<ReservationEntity> getDayReservation(DateTime date) {
    for (int i = 0; i < daysReservations.length; i++) {
      DayReservationsEntity element = daysReservations[i];
      if (element.year == date.year &&
          element.month == date.month &&
          element.day == date.day) return element.reservations;
    }

    return [];
  }

  bool hasDayReservation(DateTime date) {
    for (int i = 0; i < daysReservations.length; i++) {
      DayReservationsEntity element = daysReservations[i];
      if (element.year == date.year &&
          element.month == date.month &&
          element.day == date.day) return true;
    }

    return false;
  }

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

  void fetch() async {
    this._loading = true;
    this.notifyListeners();
    this.selection = await _selectionRepository.getSelection();
    this.daysReservations =
        await _reservationRepository.getReservation(selection);
    this._loading = false;
    this.notifyListeners();
  }

  void setWeekDay(int weekday) {
    this._currentDate = this
        .currentDate
        .subtract(Duration(days: currentWeekDay))
        .add(Duration(days: weekday));
    this.notifyListeners();
  }

  void setTeacher(TeacherEntity teacherEntity) {
    this.selection = SelectionEntity(
        type: SelectionType.TEACHER, teacherEntity: teacherEntity);
    _selectionRepository.setSelection(this.selection);
    this.fetch();
  }

  setGroup(GroupEntity groupEntity) {
    this.selection =
        SelectionEntity(type: SelectionType.GROUP, groupEntity: groupEntity);
    _selectionRepository.setSelection(this.selection);
    this.notifyListeners();
    this.fetch();
  }

  void prevDay() {
    this._currentDate = this.currentDate.subtract(Duration(days: 1));
    this.notifyListeners();
  }

  void nextDay() {
    this._currentDate = this.currentDate.add(Duration(days: 1));
    this.notifyListeners();
  }
}
