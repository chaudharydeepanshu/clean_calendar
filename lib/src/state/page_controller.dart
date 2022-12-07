import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:flutter/material.dart';

class PageControllerState extends ChangeNotifier {
  PageControllerState(this.calendarProperties);

  final CalendarProperties calendarProperties;

  late DateTime initialViewMonthDateTime =
      calendarProperties.initialViewMonthDateTime;

  late DateTime startDateOfCalendar = calendarProperties.startDateOfCalendar;

  late DateTime endDateOfCalendar = calendarProperties.endDateOfCalendar;

  late DatePickerCalendarView datePickerCalendarView =
      calendarProperties.datePickerCalendarView;

  late PageController _pageController;
  PageController get pageController => _pageController;

  late DateTime _pageViewDateTime;
  DateTime get pageViewDateTime => _pageViewDateTime;

  late int initialIndex;

  late int _pageViewIndex;

  /// The list of integers form -ve to +ve index with initial date at 0 index.
  late List<int> listOfIntegersFromStartToAndEndDateWithInitialAs0;

  init() {
    _pageViewDateTime = calendarProperties.initialViewMonthDateTime;

    int monthsCountBeforeInitialDateToStartDate =
        DateUtils.monthDelta(startDateOfCalendar, _pageViewDateTime);

    int monthsCountAfterInitialDateToStartDate =
        DateUtils.monthDelta(_pageViewDateTime, endDateOfCalendar);

    int startIndex = -1 * monthsCountBeforeInitialDateToStartDate;

    int endIndex = monthsCountAfterInitialDateToStartDate;

    listOfIntegersFromStartToAndEndDateWithInitialAs0 = [
      for (var i = startIndex; i <= endIndex; i += 1) i
    ];

    initialIndex = monthsCountBeforeInitialDateToStartDate;

    _pageViewIndex = initialIndex;

    _pageController =
        PageController(initialPage: _pageViewIndex, viewportFraction: 1);

    _pageController.addListener(() {
      // Get index according to the direction
      // _pageController.page! > _initialIndex => swiping to the right, going to the left / previous element
      // _pageController.page! < _initialIndex => swiping to the left, going to the right / next element

      int index = _pageController.page!.round() != _pageViewIndex
          ? _pageController.page!.round()
          : _pageViewIndex;

      if (index == _pageViewIndex) {
        return;
      }
      if (_pageController.page! < _pageViewIndex) {
        _prev(index);
      } else if (_pageController.page! > _pageViewIndex) {
        _next(index);
      }
    });
  }

  // Update list and jump to the middle element
  void _next(int index) {
    if (datePickerCalendarView == DatePickerCalendarView.monthView) {
      _pageViewDateTime = initialViewMonthDateTime.copyWith(
          month:
              (initialViewMonthDateTime.month + (index - initialIndex)).toInt(),
          day: 1);

      calendarProperties.onCalendarViewDate?.call(_pageViewDateTime);

      _pageViewIndex = index;
    }
    if (datePickerCalendarView == DatePickerCalendarView.weekView) {
      _pageViewDateTime = initialViewMonthDateTime.copyWith(
          day: (initialViewMonthDateTime.day + ((index - initialIndex) * 7))
              .toInt());

      calendarProperties.onCalendarViewDate?.call(_pageViewDateTime);

      _pageViewIndex = index;
    }

    notifyListeners();
  }

  // Update list and jump to the middle element
  void _prev(int index) {
    if (datePickerCalendarView == DatePickerCalendarView.monthView) {
      _pageViewDateTime = initialViewMonthDateTime.copyWith(
          month:
              (initialViewMonthDateTime.month - (initialIndex - index)).toInt(),
          day: 1);

      calendarProperties.onCalendarViewDate?.call(_pageViewDateTime);

      _pageViewIndex = index;
    }
    if (datePickerCalendarView == DatePickerCalendarView.weekView) {
      _pageViewDateTime = initialViewMonthDateTime.copyWith(
          day: (initialViewMonthDateTime.day - ((initialIndex - index) * 7))
              .toInt());

      calendarProperties.onCalendarViewDate?.call(_pageViewDateTime);

      _pageViewIndex = index;
    }

    notifyListeners();
  }
}

// Todo: Remove after dart 2.19 in stable flutter channel due to introduction of copyWith in DateTime
// https://github.com/dart-lang/sdk/issues/24644
extension DateTimeExtension on DateTime {
  DateTime copy() {
    if (isUtc) {
      return DateTime.utc(
        year,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
    }
    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    bool? isUtc,
  }) {
    if (isUtc ?? this.isUtc) {
      return DateTime.utc(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond,
      );
    }
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
    );
  }
}
