import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/models/dates_properties.dart';

DatesProperties getSuitableDatesProperties({
  required CalendarProperties calendarProperties,
  required DateTime pageViewElementDate,
  required DateTime pageViewDate,
}) {
  if (calendarProperties.selectedDates.contains(pageViewElementDate)) {
    return calendarProperties.selectedDatesProperties;
  }
  if (pageViewElementDate.month != pageViewDate.month) {
    return calendarProperties.leadingTrailingDatesProperties;
  }
  if (pageViewElementDate == calendarProperties.currentDateOfCalendar) {
    return calendarProperties.currentDateProperties;
  }
  if (calendarProperties.datesForStreaks.contains(pageViewElementDate)) {
    return calendarProperties.streakDatesProperties;
  } else {
    return calendarProperties.generalDatesProperties;
  }
}
