import 'package:clean_calendar/src/models/date_widget_defining_property_class.dart';
import 'package:clean_calendar/src/state/providers.dart';
import 'package:clean_calendar/src/utils/get_suitable_calendar_general_date_widget.dart';
import 'package:clean_calendar/src/utils/get_suitable_calendar_streak_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarDateWidget extends StatelessWidget {
  const CalendarDateWidget(
      {Key? key, required this.pageViewElementDate, required this.pageViewDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DateWidgetDefiningProperties dateWidgetDefiningProperties = ref
            .watch(dateWidgetDefiningPropertyProvider.select((value) => value));

        Widget calendarDateWidget = GetSuitableCalendarDateWidget(
            enableDenseViewForDates:
                dateWidgetDefiningProperties.enableDenseViewForDates,
            enableDenseSplashForDates:
                dateWidgetDefiningProperties.enableDenseSplashForDates,
            pageViewElementDate: pageViewElementDate,
            pageViewMonthDate: pageViewDate,
            datesForStreaks: dateWidgetDefiningProperties.datesForStreaks);
        return calendarDateWidget;
      },
    );
  }
}

class GetSuitableCalendarDateWidget extends StatelessWidget {
  const GetSuitableCalendarDateWidget({
    Key? key,
    required this.enableDenseViewForDates,
    required this.enableDenseSplashForDates,
    required this.pageViewElementDate,
    required this.pageViewMonthDate,
    required this.datesForStreaks,
  }) : super(key: key);

  final bool enableDenseViewForDates;
  final bool enableDenseSplashForDates;
  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;
  final List<DateTime> datesForStreaks;

  @override
  Widget build(BuildContext context) {
    if (datesForStreaks.contains(pageViewElementDate)) {
      return GetSuitableCalendarStreakDateWidget(
          enableDenseViewForDates: enableDenseViewForDates,
          enableDenseSplashForDates: enableDenseSplashForDates,
          pageViewElementDate: pageViewElementDate,
          pageViewMonthDate: pageViewMonthDate,
          datesForStreaks: datesForStreaks);
    }
    if (!datesForStreaks.contains(pageViewElementDate)) {
      return GetSuitableCalendarGeneralDateWidget(
        enableDenseViewForDates: enableDenseViewForDates,
        enableDenseSplashForDates: enableDenseSplashForDates,
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
      );
    } else {
      return const SizedBox();
    }
  }
}
