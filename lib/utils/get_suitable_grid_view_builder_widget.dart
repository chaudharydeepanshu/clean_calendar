import 'package:clean_calendar/state/properties_state.dart';
import 'package:clean_calendar/ui/grid_views.dart';
import 'package:flutter/material.dart';

Widget getSuitableGridViewBuilderWidget(
    {required DateTime pageViewMonthDate,
    required List<DateTime> pageViewElementsDates,
    required DatePickerSelectionMode dateSelectionMode}) {
  if (dateSelectionMode == DatePickerSelectionMode.disable) {
    return NoSelectionGridViewBuilder(
      pageViewMonthDate: pageViewMonthDate,
      pageViewElementsDates: pageViewElementsDates,
    );
  }
  if (dateSelectionMode == DatePickerSelectionMode.range) {
    return DateRangeSelectionGridViewBuilder(
      pageViewMonthDate: pageViewMonthDate,
      pageViewElementsDates: pageViewElementsDates,
    );
  } else {
    return const SizedBox();
  }
}
