import 'package:clean_calendar/src/state/properties_state.dart';

Function()? getSuitableDatesOnTap({
  required CalendarPropertiesState readCalendarPropertiesStateProviderValue,
  required DatesProperties leadingTrailingDatesProperties,
  required DatesProperties streakDatesProperties,
  required DatesProperties generalDatesProperties,
  required DatesProperties currentDateProperties,
  required DatesProperties selectedDatesProperties,
  required DateTime currentDateOfCalendar,
  required List<DateTime> datesForStreaks,
  required List<DateTime> selectedDates,
  required DatePickerSelectionMode dateSelectionMode,
  required DateTime pageViewMonthDate,
  required DateTime pageViewElementDate,
}) {
  if (pageViewElementDate.month != pageViewMonthDate.month) {
    if (leadingTrailingDatesProperties.disable == true) {
      return null;
    } else {
      return dateSelectOnTapType(
          readCalendarPropertiesStateProviderValue:
              readCalendarPropertiesStateProviderValue,
          pageViewElementDate: pageViewElementDate,
          selectedDates: selectedDates,
          dateSelectionMode: dateSelectionMode);
    }
  }

  if (datesForStreaks.contains(pageViewElementDate)) {
    if (streakDatesProperties.disable == true) {
      return null;
    } else {
      return dateSelectOnTapType(
          readCalendarPropertiesStateProviderValue:
              readCalendarPropertiesStateProviderValue,
          pageViewElementDate: pageViewElementDate,
          selectedDates: selectedDates,
          dateSelectionMode: dateSelectionMode);
    }
  }

  if (pageViewElementDate ==
      DateTime.utc(currentDateOfCalendar.year, currentDateOfCalendar.month,
          currentDateOfCalendar.day)) {
    if (currentDateProperties.disable == true) {
      return null;
    } else {
      return dateSelectOnTapType(
          readCalendarPropertiesStateProviderValue:
              readCalendarPropertiesStateProviderValue,
          pageViewElementDate: pageViewElementDate,
          selectedDates: selectedDates,
          dateSelectionMode: dateSelectionMode);
    }
  }

  if (selectedDates.contains(pageViewElementDate)) {
    if (selectedDatesProperties.disable == true) {
      return null;
    } else {
      return dateSelectOnTapType(
          readCalendarPropertiesStateProviderValue:
              readCalendarPropertiesStateProviderValue,
          pageViewElementDate: pageViewElementDate,
          selectedDates: selectedDates,
          dateSelectionMode: dateSelectionMode);
    }
  }

  if (pageViewElementDate.month == pageViewMonthDate.month) {
    if (generalDatesProperties.disable == true) {
      return null;
    } else {
      return dateSelectOnTapType(
          readCalendarPropertiesStateProviderValue:
              readCalendarPropertiesStateProviderValue,
          pageViewElementDate: pageViewElementDate,
          selectedDates: selectedDates,
          dateSelectionMode: dateSelectionMode);
    }
  } else {
    return null;
  }
}

Function()? dateSelectOnTapType({
  required CalendarPropertiesState readCalendarPropertiesStateProviderValue,
  required List<DateTime> selectedDates,
  required DatePickerSelectionMode dateSelectionMode,
  required DateTime pageViewElementDate,
}) {
  if (dateSelectionMode == DatePickerSelectionMode.disable) {
    return null;
  }
  if (dateSelectionMode == DatePickerSelectionMode.single) {
    return () {
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
