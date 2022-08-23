import 'package:clean_calendar/src/ui/grid_view_elements/calendar_general_date_widgets.dart';
import 'package:flutter/material.dart';

class GetSuitableCalendarGeneralDateWidget extends StatelessWidget {
  const GetSuitableCalendarGeneralDateWidget(
      {Key? key,
      required this.enableDenseViewForDates,
      required this.enableDenseSplashForDates,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final bool enableDenseViewForDates;
  final bool enableDenseSplashForDates;
  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
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
}
