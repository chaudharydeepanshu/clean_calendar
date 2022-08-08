import 'package:clean_calendar/state/properties_state.dart';
import 'package:clean_calendar/ui/page_view_builders.dart';
import 'package:flutter/material.dart';

Widget getSuitablePageViewBuilderWidget(
    {required DatePickerSelectionMode dateSelectionMode}) {
  if (dateSelectionMode == DatePickerSelectionMode.single ||
      dateSelectionMode == DatePickerSelectionMode.disable ||
      dateSelectionMode == DatePickerSelectionMode.multiple) {
    return const ScrollablePageViewBuilder();
  }
  if (dateSelectionMode == DatePickerSelectionMode.range) {
    return const NonScrollablePageViewBuilder();
  } else {
    return const SizedBox();
  }
}
