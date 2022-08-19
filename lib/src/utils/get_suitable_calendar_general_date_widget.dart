import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/ui/grid_view_elements/calendar_general_date_widgets.dart';
import 'package:flutter/material.dart';

Widget getSuitableCalendarGeneralDateWidget(
    {required bool enableDenseViewForDates,
    required bool enableDenseSplashForDates,
    required DateTime pageViewElementDate,
    required DateTime pageViewMonthDate,
    required CalendarPropertiesState
        watchCalendarPropertiesStateProviderValue}) {
  if (enableDenseViewForDates && enableDenseSplashForDates) {
    return CalendarGeneralDenseSplashDate(
      pageViewElementDate: pageViewElementDate,
      pageViewMonthDate: pageViewMonthDate,
    );
  }
  if (enableDenseViewForDates) {
    return CalendarGeneralDenseDate(
      pageViewElementDate: pageViewElementDate,
      pageViewMonthDate: pageViewMonthDate,
    );
  }
  if (!enableDenseViewForDates) {
    return CalendarGeneralExpandedDate(
      pageViewElementDate: pageViewElementDate,
      pageViewMonthDate: pageViewMonthDate,
    );
  } else {
    return const SizedBox();
  }
}
