import 'package:clean_calendar/src/models/month_year_decoration.dart';
import 'package:clean_calendar/src/models/navigator_decoration.dart';

class HeaderProperties {
  /// - monthYearDecoration, changes the decoration of all months and years decoration in the header area of calendar.
  final MonthYearDecoration? monthYearDecoration;

  /// - navigatorDecoration, changes the decoration of navigator.
  final NavigatorDecoration? navigatorDecoration;

  HeaderProperties({
    this.monthYearDecoration,
    this.navigatorDecoration,
  });

  Map<String, dynamic> toMap() {
    return {
      'monthYearDecoration': monthYearDecoration,
      'navigatorDecoration': navigatorDecoration,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeaderProperties &&
          runtimeType == other.runtimeType &&
          monthYearDecoration == other.monthYearDecoration &&
          navigatorDecoration == other.navigatorDecoration;

  @override
  int get hashCode =>
      monthYearDecoration.hashCode ^ navigatorDecoration.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'HeaderProperties{monthYearDecoration: $monthYearDecoration, navigatorDecoration: $navigatorDecoration}';
  }
}
