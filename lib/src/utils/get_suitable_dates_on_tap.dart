import 'package:clean_calendar/src/models/calendar_properties.dart';

Function()? getSuitableDatesOnTap({
  required CalendarProperties calendarProperties,
  required DateTime pageViewElementDate,
}) {
  if (calendarProperties.dateSelectionMode == DatePickerSelectionMode.disable) {
    return null;
  }
  if (calendarProperties.dateSelectionMode ==
      DatePickerSelectionMode.singleOrMultiple) {
    return () {
      calendarProperties.onSelectedDates?.call([pageViewElementDate]);
    };
  } else {
    return null;
  }
}
