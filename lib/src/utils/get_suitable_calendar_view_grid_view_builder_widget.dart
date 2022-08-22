import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/ui/calendar_view.dart';
import 'package:flutter/material.dart';

Widget getSuitableCalendarViewGridViewBuilderWidget({
  required DateTime pageViewDate,
  required DatePickerCalendarView datePickerCalendarView,
}) {
  if (datePickerCalendarView == DatePickerCalendarView.monthView) {
    return MonthViewCalendarDatesSection(
      pageViewDate: pageViewDate,
    );
  }
  if (datePickerCalendarView == DatePickerCalendarView.weekView) {
    return WeekViewCalendarDatesSection(
      pageViewDate: pageViewDate,
    );
  }
  // if (dateSelectionMode == DatePickerSelectionMode.range) {
  //   return DateRangeSelectionGridViewBuilder(
  //     pageViewMonthDate: pageViewMonthDate,
  //     pageViewElementsDates: pageViewElementsDates,
  //   );
  // }
  else {
    return const SizedBox();
  }
}
