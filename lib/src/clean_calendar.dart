library clean_calendar;

import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/ui/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CleanCalendar extends StatelessWidget {
  /// - CleanCalendar, Shows a simple Calendar.
  const CleanCalendar({
    Key? key,
    this.datePickerCalendarView,
    this.streakDatesProperties,
    this.currentDateProperties,
    this.generalDatesProperties,
    this.leadingTrailingDatesProperties,
    this.selectedDatesProperties,
    // this.selectedRangeBetweenDatesProperties,
    this.enableDenseViewForDates,
    this.enableDenseSplashForDates,
    this.startDateOfCalendar,
    this.endDateOfCalendar,
    this.dateSelectionMode,
    // this.disablePastDates,
    this.initialViewMonthDateTime,
    this.currentDateOfCalendar,
    this.datesForStreaks,
    this.selectedDates,
    this.onSelectedDates,
    this.onCalendarViewDate,
    this.startWeekday,
    this.weekdaysSymbol,
    this.monthsSymbol,
  })  : assert(weekdaysSymbol == null || weekdaysSymbol.length == 7,
            'either weekdaysSymbol should be null or its length should be 7'),
        assert(monthsSymbol == null || monthsSymbol.length == 12,
            'either monthsSymbol should be null or its length should be 12'),
        super(key: key);

  /// - datePickerCalendarView, It takes calendar view type.
  final DatePickerCalendarView? datePickerCalendarView;

  /// - streakDatesProperties, It takes customisation properties for streak dates.
  final DatesProperties? streakDatesProperties;

  /// - currentDateProperties, It takes customisation properties for current dates.
  final DatesProperties? currentDateProperties;

  /// - generalDatesProperties, It takes customisation properties for general dates.
  final DatesProperties? generalDatesProperties;

  /// - leadingTrailingDatesProperties, It takes customisation properties for leading dates.
  final DatesProperties? leadingTrailingDatesProperties;

  /// - selectedDatesProperties, It takes customisation properties for selected dates.
  final DatesProperties? selectedDatesProperties;
  // final DatesProperties? selectedRangeBetweenDatesProperties;

  /// - enableDenseViewForDates, Set true to allow date boundary to shrink.
  final bool? enableDenseViewForDates;

  /// - enableDenseSplashForDates, Set true to allow date tap splash to shrink.
  final bool? enableDenseSplashForDates;

  /// - endDateOfCalendar, It takes start date for calendar view.
  final DateTime? startDateOfCalendar;

  /// - endDateOfCalendar, It takes end date for calendar view.
  final DateTime? endDateOfCalendar;

  /// - dateSelectionMode, It takes DatePickerSelectionMode which Provides different modes for date selection.
  final DatePickerSelectionMode? dateSelectionMode;

  // final bool? disablePastDates;

  /// - initialViewMonthDateTime, It takes initial month date for calendar view.
  /// Defaults to current date and if current is not between startDateOfCalendar and endDateOfCalendar then defaults to start date.
  final DateTime? initialViewMonthDateTime;

  /// - currentDateOfCalendar, It takes current or today date for calendar view.
  /// Defaults to DateTime.now().
  final DateTime? currentDateOfCalendar;

  /// - datesForStreaks, It takes the list of dates to be shown as streaks.
  final List<DateTime>? datesForStreaks;

  /// - selectedDates, It takes the list of pre-selected dates to be shown as selected.
  final List<DateTime>? selectedDates;

  /// - onSelectedDates, A callback to get the current selected dates.
  final ValueChanged<List<DateTime>>? onSelectedDates;

  /// - onCalendarViewDate, A callback to get the current calendar view date.
  final ValueChanged<DateTime>? onCalendarViewDate;

  /// - startWeekday, It takes the weekday from which the calendar view should start.
  ///
  /// Defaults to sunday.
  final WeekDay? startWeekday;

  /// - weekdaysSymbol, It takes the weekdays symbol list.
  ///
  /// Provide list from Monday to Sunday.
  /// Defaults to ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
  final List<String>? weekdaysSymbol;

  /// - monthsSymbol, It takes the months symbol list.
  ///
  /// Provide list from January to December.
  /// Defaults to ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  final List<String>? monthsSymbol;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Calendar(
          datePickerCalendarView: datePickerCalendarView,
          streakDatesProperties: streakDatesProperties,
          currentDateProperties: currentDateProperties,
          generalDatesProperties: generalDatesProperties,
          leadingTrailingDatesProperties: leadingTrailingDatesProperties,
          selectedDatesProperties: selectedDatesProperties,
          // selectedRangeBetweenDatesProperties:  selectedRangeBetweenDatesProperties,
          enableDenseViewForDates: enableDenseViewForDates,
          enableDenseSplashForDates: enableDenseSplashForDates,
          startDateOfCalendar: startDateOfCalendar,
          endDateOfCalendar: endDateOfCalendar,
          dateSelectionMode: dateSelectionMode,
          // disablePastDates:  disablePastDates,
          initialViewMonthDateTime: initialViewMonthDateTime,
          currentDateOfCalendar: currentDateOfCalendar,
          datesForStreaks: datesForStreaks,
          selectedDates: selectedDates,
          onSelectedDates: onSelectedDates,
          onCalendarViewDate: onCalendarViewDate,
          startWeekday: startWeekday,
          weekdaysSymbol: weekdaysSymbol,
          monthsSymbol: monthsSymbol,
          context: context),
    );
  }
}
