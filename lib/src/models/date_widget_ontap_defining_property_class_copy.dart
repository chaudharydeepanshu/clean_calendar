import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:flutter/foundation.dart';

class DateWidgetOnTapDefiningProperties {
  final CalendarPropertiesState readCalendarPropertiesStateProviderValue;

  final List<DateTime> datesForStreaks;
  final List<DateTime> selectedDates;

  final DatesProperties leadingTrailingDatesProperties;
  final DatesProperties streakDatesProperties;
  final DatesProperties generalDatesProperties;
  final DatesProperties currentDateProperties;
  final DatesProperties selectedDatesProperties;

  final DateTime currentDateOfCalendar;

  final DatePickerSelectionMode dateSelectionMode;

  final bool enableDenseViewForDates;
  final bool enableDenseSplashForDates;

  DateWidgetOnTapDefiningProperties({
    required this.readCalendarPropertiesStateProviderValue,
    required this.datesForStreaks,
    required this.selectedDates,
    required this.leadingTrailingDatesProperties,
    required this.streakDatesProperties,
    required this.generalDatesProperties,
    required this.currentDateProperties,
    required this.selectedDatesProperties,
    required this.currentDateOfCalendar,
    required this.dateSelectionMode,
    required this.enableDenseViewForDates,
    required this.enableDenseSplashForDates,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateWidgetOnTapDefiningProperties &&
          runtimeType == other.runtimeType &&
          readCalendarPropertiesStateProviderValue ==
              other.readCalendarPropertiesStateProviderValue &&
          listEquals(datesForStreaks, other.datesForStreaks) &&
          listEquals(selectedDates, other.selectedDates) &&
          leadingTrailingDatesProperties ==
              other.leadingTrailingDatesProperties &&
          streakDatesProperties == other.streakDatesProperties &&
          generalDatesProperties == other.generalDatesProperties &&
          currentDateProperties == other.currentDateProperties &&
          selectedDatesProperties == other.selectedDatesProperties &&
          currentDateOfCalendar == other.currentDateOfCalendar &&
          dateSelectionMode == other.dateSelectionMode &&
          enableDenseViewForDates == other.enableDenseViewForDates &&
          enableDenseSplashForDates == other.enableDenseSplashForDates;

  @override
  int get hashCode =>
      readCalendarPropertiesStateProviderValue.hashCode ^
      datesForStreaks.hashCode ^
      selectedDates.hashCode ^
      leadingTrailingDatesProperties.hashCode ^
      streakDatesProperties.hashCode ^
      generalDatesProperties.hashCode ^
      currentDateProperties.hashCode ^
      selectedDatesProperties.hashCode ^
      currentDateOfCalendar.hashCode ^
      dateSelectionMode.hashCode ^
      enableDenseViewForDates.hashCode ^
      enableDenseSplashForDates.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'DateWidgetOnTapDefiningProperties{readCalendarPropertiesStateProviderValue: $readCalendarPropertiesStateProviderValue, datesForStreaks: $datesForStreaks, selectedDates: $selectedDates, leadingTrailingDatesProperties: $leadingTrailingDatesProperties, streakDatesProperties: $streakDatesProperties, generalDatesProperties: $generalDatesProperties, currentDateProperties: $currentDateProperties, selectedDatesProperties: $selectedDatesProperties, currentDateOfCalendar: $currentDateOfCalendar, dateSelectionMode: $dateSelectionMode, enableDenseViewForDates: $enableDenseViewForDates, enableDenseSplashForDates: $enableDenseSplashForDates}';
  }
}
