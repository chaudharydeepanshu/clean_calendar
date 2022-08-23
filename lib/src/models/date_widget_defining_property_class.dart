import 'package:flutter/foundation.dart';

class DateWidgetDefiningProperties {
  final bool enableDenseViewForDates;
  final bool enableDenseSplashForDates;
  final List<DateTime> datesForStreaks;

  DateWidgetDefiningProperties(
      {required this.enableDenseViewForDates,
      required this.enableDenseSplashForDates,
      required this.datesForStreaks});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateWidgetDefiningProperties &&
          runtimeType == other.runtimeType &&
          enableDenseViewForDates == other.enableDenseViewForDates &&
          enableDenseSplashForDates == other.enableDenseSplashForDates &&
          listEquals(datesForStreaks, other.datesForStreaks);

  @override
  int get hashCode =>
      enableDenseViewForDates.hashCode ^
      enableDenseSplashForDates.hashCode ^
      datesForStreaks.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'DateWidgetDefiningProperties{enableDenseViewForDates: $enableDenseViewForDates, enableDenseSplashForDates: $enableDenseSplashForDates, datesForStreaks: $datesForStreaks}';
  }
}
