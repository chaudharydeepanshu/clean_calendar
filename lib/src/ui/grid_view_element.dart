import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/state/providers.dart';
import 'package:clean_calendar/src/utils/get_suitable_calendar_general_date_widget.dart';
import 'package:clean_calendar/src/utils/get_suitable_calendar_streak_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarDateWidget extends StatelessWidget {
  const CalendarDateWidget(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final Widget dateSuitableWidgetProviderValue = ref
            .watch(dateSuitableWidgetProvider(IndividualDateElementProperties(
          pageViewElementDate: pageViewElementDate,
          pageViewMonthDate: pageViewDate,
        )).select((value) => value));

        Widget calendarDateWidget = dateSuitableWidgetProviderValue;
        return calendarDateWidget;
      },
    );
  }
}

Widget getSuitableCalendarDateWidget(
    {required bool enableDenseViewForDates,
    required bool enableDenseSplashForDates,
    required DateTime pageViewElementDate,
    required DateTime pageViewMonthDate,
    required List<DateTime> datesForStreaks,
    required CalendarPropertiesState
        watchCalendarPropertiesStateProviderValue}) {
  if (datesForStreaks.contains(pageViewElementDate)) {
    return getSuitableCalendarStreakDateWidget(
        enableDenseViewForDates: enableDenseViewForDates,
        enableDenseSplashForDates: enableDenseSplashForDates,
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
        datesForStreaks: datesForStreaks);
  }
  if (!datesForStreaks.contains(pageViewElementDate)) {
    return getSuitableCalendarGeneralDateWidget(
        enableDenseViewForDates: enableDenseViewForDates,
        enableDenseSplashForDates: enableDenseSplashForDates,
        pageViewElementDate: pageViewElementDate,
        pageViewMonthDate: pageViewMonthDate,
        watchCalendarPropertiesStateProviderValue:
            watchCalendarPropertiesStateProviderValue);
  } else {
    return const SizedBox();
  }
}
