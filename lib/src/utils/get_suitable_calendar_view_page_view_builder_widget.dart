import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/ui/page_view_builders.dart';
import 'package:flutter/material.dart';

Widget getSuitableCalendarViewScrollablePageViewBuilderWidget(
    {required DatePickerCalendarView datePickerCalendarView}) {
  if (datePickerCalendarView == DatePickerCalendarView.monthView) {
    return const MonthViewScrollablePageViewBuilder();
  }
  if (datePickerCalendarView == DatePickerCalendarView.weekView) {
    return const WeekViewScrollablePageViewBuilder();
  }
  // if (dateSelectionMode == DatePickerSelectionMode.range) {
  //   return const NonScrollablePageViewBuilder();
  // }
  else {
    return const SizedBox();
  }
}

Widget getSuitableCalendarViewNonScrollablePageViewBuilderWidget(
    {required DatePickerCalendarView datePickerCalendarView}) {
  if (datePickerCalendarView == DatePickerCalendarView.monthView) {
    return const MonthViewNonScrollablePageViewBuilder();
  }
  if (datePickerCalendarView == DatePickerCalendarView.weekView) {
    return const WeekViewNonScrollablePageViewBuilder();
  }
  // if (dateSelectionMode == DatePickerSelectionMode.range) {
  //   return const NonScrollablePageViewBuilder();
  // }
  else {
    return const SizedBox();
  }
}
