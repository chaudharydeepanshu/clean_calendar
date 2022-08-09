library clean_calendar;

import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/ui/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A Calendar.
class CleanCalendar extends StatelessWidget {
  const CleanCalendar(
      {Key? key,
      this.streakDatesProperties,
      this.currentDateProperties,
      this.generalDatesProperties,
      this.leadingTrailingDatesProperties,
      // this.selectedDatesProperties,
      // this.selectedRangeBetweenDatesProperties,
      this.enableDenseViewForDates,
      this.enableDenseSplashForDates,
      // this.startDateOfCalendar,
      // this.endDateOfCalendar,
      // this.dateSelectionMode,
      // this.disablePastDates,
      // this.initialViewMonthDateTime,
      this.currentDateOfCalendar,
      this.datesForStreaks})
      : super(key: key);

  final DatesProperties? streakDatesProperties;
  final DatesProperties? currentDateProperties;
  final DatesProperties? generalDatesProperties;
  final DatesProperties? leadingTrailingDatesProperties;
  // final DatesProperties? selectedDatesProperties;
  // final DatesProperties? selectedRangeBetweenDatesProperties;

  final bool? enableDenseViewForDates;
  final bool? enableDenseSplashForDates;

  // final DateTime? startDateOfCalendar;
  // final DateTime? endDateOfCalendar;

  // final DatePickerSelectionMode? dateSelectionMode;

  // final bool? disablePastDates;

  // final DateTime? initialViewMonthDateTime;
  final DateTime? currentDateOfCalendar;

  final List<DateTime>? datesForStreaks;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Calendar(
          streakDatesProperties: streakDatesProperties,
          currentDateProperties: currentDateProperties,
          generalDatesProperties: generalDatesProperties,
          leadingTrailingDatesProperties: leadingTrailingDatesProperties,
          // selectedDatesProperties:   selectedDatesProperties,
          // selectedRangeBetweenDatesProperties:  selectedRangeBetweenDatesProperties,
          enableDenseViewForDates: enableDenseViewForDates,
          enableDenseSplashForDates: enableDenseSplashForDates,
          // startDateOfCalendar:  startDateOfCalendar,
          // endDateOfCalendar: endDateOfCalendar,
          // dateSelectionMode: dateSelectionMode,
          // disablePastDates:  disablePastDates,
          // initialViewMonthDateTime:  initialViewMonthDateTime,
          currentDateOfCalendar: currentDateOfCalendar,
          datesForStreaks: datesForStreaks,
          context: context),
    );
  }
}
