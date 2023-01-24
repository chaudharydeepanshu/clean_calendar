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
    if (calendarProperties.datesForStreaks.contains(pageViewElementDate)) {
      return calendarProperties.streakDatesProperties.copyWith(
          datesDecoration: calendarProperties
              .streakDatesProperties.datesDecoration
              ?.copyWith(
        datesTextColor: calendarProperties
            .currentDateProperties.datesDecoration?.datesTextColor,
        datesBorderColor: calendarProperties
            .currentDateProperties.datesDecoration?.datesBorderColor,
        datesTextStyle: calendarProperties
            .currentDateProperties.datesDecoration?.datesTextStyle,
      ));
    } else {
      return calendarProperties.currentDateProperties;
    }
  }
  if (calendarProperties.datesForStreaks.contains(pageViewElementDate)) {
    return calendarProperties.streakDatesProperties;
  } else {
    return calendarProperties.generalDatesProperties;
  }
}
