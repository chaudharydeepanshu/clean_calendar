import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/utils/get_suitable_calendar_general_date_widget.dart';
import 'package:clean_calendar/src/utils/get_suitable_calendar_streak_date_widget.dart';
import 'package:flutter/material.dart';

class CalendarDateWidget extends StatelessWidget {
  const CalendarDateWidget(
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
    if (calendarProperties.datesForStreaks.contains(pageViewElementDate)) {
      return GetSuitableCalendarStreakDateWidget(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate);
    }
    if (!calendarProperties.datesForStreaks.contains(pageViewElementDate)) {
      return GetSuitableCalendarGeneralDateWidget(
        calendarProperties: calendarProperties,
        pageViewElementDate: pageViewElementDate,
        pageViewDate: pageViewDate,
      );
    } else {
      return const SizedBox();
    }
  }
}
