import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:clean_calendar/src/ui/calendar_dates_section/pageview_builders.dart';
import 'package:flutter/material.dart';

class CalendarDatesSection extends StatelessWidget {
  const CalendarDatesSection(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;

  @override
  Widget build(BuildContext context) {
    if (calendarProperties.dateSelectionMode ==
                DatePickerSelectionMode.singleOrMultiple ||
            calendarProperties.dateSelectionMode ==
                DatePickerSelectionMode.disable
        // || dateSelectionMode == DatePickerSelectionMode.multiple
        ) {
      return ScrollablePageViewBuilder(
        calendarProperties: calendarProperties,
        pageControllerState: pageControllerState,
      );
    }
    // if (dateSelectionMode == DatePickerSelectionMode.range) {
    //   return const NonScrollablePageViewBuilder();
    // }
    else {
      return const SizedBox();
    }
  }
}
