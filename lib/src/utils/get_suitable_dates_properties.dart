import 'package:clean_calendar/src/state/properties_state.dart';

DatesProperties getSuitableDatesProperties({
  required DateTime pageViewElementDate,
  required DateTime pageViewMonthDate,
  required DateTime currentDateOfCalendar,
  required List<DateTime> datesForStreaks,
  required List<DateTime> selectedDates,
  required DatesProperties leadingTrailingDatesProperties,
  required DatesProperties streakDatesProperties,
  required DatesProperties generalDatesProperties,
  required DatesProperties currentDateProperties,
  required DatesProperties selectedDatesProperties,
}) {
  if (pageViewElementDate.month != pageViewMonthDate.month) {
    return leadingTrailingDatesProperties;
  }

  if (selectedDates.contains(pageViewElementDate)) {
    return selectedDatesProperties;
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
