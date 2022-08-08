import 'package:clean_calendar/ui/grid_view_elements/calendar_streak_date_widgets.dart';
import 'package:flutter/material.dart';

Widget getSuitableCalendarStreakDateWidget(
    {required bool enableDenseViewForDates,
    required bool enableDenseSplashForDates,
    required DateTime pageViewElementDate,
    required DateTime pageViewMonthDate,
    required List<DateTime> datesForStreaks}) {
  /// Called when streak date have streak date just before and just after also.
  if (datesForStreaks
          .contains(pageViewElementDate.add(const Duration(days: 1))) &&
      datesForStreaks
          .contains(pageViewElementDate.subtract(const Duration(days: 1))) &&
      datesForStreaks.contains(pageViewElementDate)) {
    if (enableDenseViewForDates && enableDenseSplashForDates) {
      return CalendarStreakBetweenDenseSplashDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    }
    if (enableDenseViewForDates) {
      return CalendarStreakBetweenExpandedDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    }
    if (!enableDenseViewForDates) {
      return CalendarStreakBetweenExpandedDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    } else {
      return const SizedBox();
    }
  }

  /// Called when streak date have a streak date just after.
  if (datesForStreaks
      .contains(pageViewElementDate.add(const Duration(days: 1)))) {
    if (enableDenseViewForDates && enableDenseSplashForDates) {
      return CalendarStreakStartDenseSplashDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    }
    if (enableDenseViewForDates) {
      return CalendarStreakStartDenseDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    }
    if (!enableDenseViewForDates) {
      return CalendarStreakStartExpandedDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    } else {
      return const SizedBox();
    }
  }

  /// Called when streak date have a streak date just before.
  if (datesForStreaks
      .contains(pageViewElementDate.subtract(const Duration(days: 1)))) {
    if (enableDenseViewForDates && enableDenseSplashForDates) {
      return CalendarStreakEndDenseSplashDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    }
    if (enableDenseViewForDates) {
      return CalendarStreakEndDenseDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    }
    if (!enableDenseViewForDates) {
      return CalendarStreakEndExpandedDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    } else {
      return const SizedBox();
    }
  }

  /// Called when streak date doesn't have streak date just before and just after also.
  if (datesForStreaks.contains(pageViewElementDate)) {
    if (enableDenseViewForDates && enableDenseSplashForDates) {
      return CalendarStreakSingleDenseSplashDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    }
    if (enableDenseViewForDates) {
      return CalendarStreakSingleDenseDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    }
    if (!enableDenseViewForDates) {
      return CalendarStreakSingleExpandedDate(
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    } else {
      return const SizedBox();
    }
  } else {
    return const SizedBox();
  }
}
