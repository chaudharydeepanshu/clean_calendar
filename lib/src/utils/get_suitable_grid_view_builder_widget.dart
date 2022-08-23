import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/ui/grid_views.dart';
import 'package:flutter/material.dart';

class GetSuitableMonthViewGridViewBuilderWidget extends StatelessWidget {
  const GetSuitableMonthViewGridViewBuilderWidget(
      {Key? key,
      required this.pageViewMonthDate,
      required this.pageViewElementsDates,
      required this.dateSelectionMode})
      : super(key: key);

  final DateTime pageViewMonthDate;
  final List<DateTime> pageViewElementsDates;
  final DatePickerSelectionMode dateSelectionMode;

  @override
  Widget build(BuildContext context) {
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
}

class GetSuitableWeekViewGridViewBuilderWidget extends StatelessWidget {
  const GetSuitableWeekViewGridViewBuilderWidget(
      {Key? key,
      required this.pageViewDate,
      required this.pageViewElementsDates,
      required this.dateSelectionMode})
      : super(key: key);

  final DateTime pageViewDate;
  final List<DateTime> pageViewElementsDates;
  final DatePickerSelectionMode dateSelectionMode;

  @override
  Widget build(BuildContext context) {
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
}
