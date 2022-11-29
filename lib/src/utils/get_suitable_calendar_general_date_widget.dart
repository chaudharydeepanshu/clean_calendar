import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/ui/calendar_dates_section/grid_view_elements/calendar_general_date_widgets.dart';
import 'package:flutter/material.dart';

class GetSuitableCalendarGeneralDateWidget extends StatelessWidget {
  const GetSuitableCalendarGeneralDateWidget(
      {Key? key,
      required this.calendarProperties,
      required this.pageViewElementDate,
      required this.pageViewDate})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final DateTime pageViewElementDate;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    if (calendarProperties.enableDenseViewForDates &&
        calendarProperties.enableDenseSplashForDates) {
      return CalendarGeneralDenseSplashDate(
        calendarProperties: calendarProperties,
        pageViewElementDate: pageViewElementDate,
        pageViewDate: pageViewDate,
      );
    }
    if (calendarProperties.enableDenseViewForDates) {
      return CalendarGeneralDenseDate(
        calendarProperties: calendarProperties,
        pageViewElementDate: pageViewElementDate,
        pageViewDate: pageViewDate,
      );
    }
    if (!calendarProperties.enableDenseViewForDates) {
      return CalendarGeneralExpandedDate(
        calendarProperties: calendarProperties,
        pageViewElementDate: pageViewElementDate,
        pageViewDate: pageViewDate,
      );
    } else {
      return const SizedBox();
    }
  }
}
