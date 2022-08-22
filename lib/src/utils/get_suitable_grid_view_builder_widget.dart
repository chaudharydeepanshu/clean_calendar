import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/ui/grid_views.dart';
import 'package:flutter/material.dart';

Widget getSuitableMonthViewGridViewBuilderWidget(
    {required DateTime pageViewMonthDate,
    required List<DateTime> pageViewElementsDates,
    required DatePickerSelectionMode dateSelectionMode}) {
  if (dateSelectionMode == DatePickerSelectionMode.disable) {
    return NoSelectionMonthViewGridViewBuilder(
      pageViewMonthDate: pageViewMonthDate,
      pageViewElementsDates: pageViewElementsDates,
    );
  }
  if (dateSelectionMode == DatePickerSelectionMode.single) {
    return DateSingleMultipleSelectionMonthViewGridViewBuilder(
      pageViewMonthDate: pageViewMonthDate,
      pageViewElementsDates: pageViewElementsDates,
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

Widget getSuitableWeekViewGridViewBuilderWidget(
    {required DateTime pageViewDate,
    required List<DateTime> pageViewElementsDates,
    required DatePickerSelectionMode dateSelectionMode}) {
  if (dateSelectionMode == DatePickerSelectionMode.disable) {
    return NoSelectionWeekViewGridViewBuilder(
      pageViewDate: pageViewDate,
      pageViewElementsDates: pageViewElementsDates,
    );
  }
  if (dateSelectionMode == DatePickerSelectionMode.single) {
    return DateSingleMultipleSelectionWeekViewGridViewBuilder(
      pageViewDate: pageViewDate,
      pageViewElementsDates: pageViewElementsDates,
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
