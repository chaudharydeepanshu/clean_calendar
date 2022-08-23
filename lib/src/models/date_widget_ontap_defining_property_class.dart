import 'package:clean_calendar/src/state/properties_state.dart';

class DateWidgetOnTapDefiningProperties {
  final CalendarPropertiesState readCalendarPropertiesStateProviderValue;

  final DatePickerSelectionMode dateSelectionMode;

  DateWidgetOnTapDefiningProperties(
      {required this.readCalendarPropertiesStateProviderValue,
      required this.dateSelectionMode});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateWidgetOnTapDefiningProperties &&
          runtimeType == other.runtimeType &&
          readCalendarPropertiesStateProviderValue ==
              other.readCalendarPropertiesStateProviderValue &&
          dateSelectionMode == other.dateSelectionMode;

  @override
  int get hashCode =>
      readCalendarPropertiesStateProviderValue.hashCode ^
      dateSelectionMode.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'DateWidgetOnTapDefiningProperties{readCalendarPropertiesStateProviderValue: $readCalendarPropertiesStateProviderValue, dateSelectionMode: $dateSelectionMode}';
  }
}
