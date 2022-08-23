import 'package:clean_calendar/src/state/properties_state.dart';

Function()? getSuitableDatesOnTap({
  required CalendarPropertiesState readCalendarPropertiesStateProviderValue,
  required DatePickerSelectionMode dateSelectionMode,
  required DateTime pageViewElementDate,
}) {
  return dateSelectOnTapType(
      readCalendarPropertiesStateProviderValue:
          readCalendarPropertiesStateProviderValue,
      pageViewElementDate: pageViewElementDate,
      dateSelectionMode: dateSelectionMode);
}

Function()? dateSelectOnTapType({
  required CalendarPropertiesState readCalendarPropertiesStateProviderValue,
  required DatePickerSelectionMode dateSelectionMode,
  required DateTime pageViewElementDate,
}) {
  if (dateSelectionMode == DatePickerSelectionMode.disable) {
    return null;
  }
  if (dateSelectionMode == DatePickerSelectionMode.single) {
    return () {
      List<DateTime> selectedDates =
          readCalendarPropertiesStateProviderValue.selectedDates;

      if (selectedDates.contains(pageViewElementDate)) {
        readCalendarPropertiesStateProviderValue
            .updateSelectedDates(selectedDates: []);
      } else {
        readCalendarPropertiesStateProviderValue
            .updateSelectedDates(selectedDates: [pageViewElementDate]);
      }
    };
  } else {
    return null;
  }
}
