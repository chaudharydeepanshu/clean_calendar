import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/ui/calendar_dates_section/grid_view_elements/calendar_streak_date_widgets.dart';
import 'package:flutter/material.dart';

class GetSuitableCalendarStreakDateWidget extends StatelessWidget {
  const GetSuitableCalendarStreakDateWidget(
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
    /// Called when streak date have streak date just before and just after also.
    if (calendarProperties.datesForStreaks
            .contains(pageViewElementDate.add(const Duration(days: 1))) &&
        calendarProperties.datesForStreaks
            .contains(pageViewElementDate.subtract(const Duration(days: 1))) &&
        calendarProperties.datesForStreaks.contains(pageViewElementDate)) {
      if (calendarProperties.enableDenseViewForDates &&
          calendarProperties.enableDenseSplashForDates) {
        return CalendarStreakBetweenDenseSplashDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (calendarProperties.enableDenseViewForDates) {
        return CalendarStreakBetweenExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakBetweenExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    }

    /// Called when streak date have a streak date just after.
    if (calendarProperties.datesForStreaks
        .contains(pageViewElementDate.add(const Duration(days: 1)))) {
      if (calendarProperties.enableDenseViewForDates &&
          calendarProperties.enableDenseSplashForDates) {
        return CalendarStreakStartDenseSplashDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (calendarProperties.enableDenseViewForDates) {
        return CalendarStreakStartDenseDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakStartExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    }

    /// Called when streak date have a streak date just before.
    if (calendarProperties.datesForStreaks
        .contains(pageViewElementDate.subtract(const Duration(days: 1)))) {
      if (calendarProperties.enableDenseViewForDates &&
          calendarProperties.enableDenseSplashForDates) {
        return CalendarStreakEndDenseSplashDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (calendarProperties.enableDenseViewForDates) {
        return CalendarStreakEndDenseDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakEndExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    }

    /// Called when streak date doesn't have streak date just before and just after also.
    if (calendarProperties.datesForStreaks.contains(pageViewElementDate)) {
      if (calendarProperties.enableDenseViewForDates &&
          calendarProperties.enableDenseSplashForDates) {
        return CalendarStreakSingleDenseSplashDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (calendarProperties.enableDenseViewForDates) {
        return CalendarStreakSingleDenseDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      }
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakSingleExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }
}
