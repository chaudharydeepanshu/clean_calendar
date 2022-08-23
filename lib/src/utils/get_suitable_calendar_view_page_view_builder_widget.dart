import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/ui/page_view_builders.dart';
import 'package:flutter/material.dart';

class GetSuitableCalendarViewScrollablePageViewBuilderWidget
    extends StatelessWidget {
  const GetSuitableCalendarViewScrollablePageViewBuilderWidget(
      {Key? key, required this.datePickerCalendarView})
      : super(key: key);

  final DatePickerCalendarView datePickerCalendarView;

  @override
  Widget build(BuildContext context) {
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
}

class GetSuitableCalendarViewNonScrollablePageViewBuilderWidget
    extends StatelessWidget {
  const GetSuitableCalendarViewNonScrollablePageViewBuilderWidget(
      {Key? key, required this.datePickerCalendarView})
      : super(key: key);

  final DatePickerCalendarView datePickerCalendarView;

  @override
  Widget build(BuildContext context) {
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
}
