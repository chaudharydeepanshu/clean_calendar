import 'package:clean_calendar/src/state/properties_state.dart';

DatesProperties getSuitableDatesProperties({
  required DateTime pageViewElementDate,
  required DateTime pageViewMonthDate,
  required DateTime currentDateOfCalendar,
  required List<DateTime> datesForStreaks,
  required DatesProperties leadingTrailingDatesProperties,
  required DatesProperties streakDatesProperties,
  required DatesProperties generalDatesProperties,
  required DatesProperties currentDateProperties,
}) {
  if (pageViewElementDate.month != pageViewMonthDate.month) {
    return leadingTrailingDatesProperties;
  }
  if (pageViewElementDate ==
      DateTime.utc(currentDateOfCalendar.year, currentDateOfCalendar.month,
          currentDateOfCalendar.day)) {
    return currentDateProperties;
  }
  if (datesForStreaks.contains(pageViewElementDate)) {
    return streakDatesProperties;
  } else {
    return generalDatesProperties;
  }
}
