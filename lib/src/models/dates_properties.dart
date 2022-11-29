import 'package:clean_calendar/src/models/dates_decoration.dart';

class DatesProperties {
  /// - datesDecoration, changes the dates decoration.
  final DatesDecoration? datesDecoration;

  /// - disable, disable dates.
  final bool? disable;

  /// - hide, hide dates.
  final bool? hide;

  DatesProperties({
    this.datesDecoration,
    this.disable,
    this.hide,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatesProperties &&
          runtimeType == other.runtimeType &&
          datesDecoration == other.datesDecoration &&
          disable == other.disable &&
          hide == other.hide;

  @override
  int get hashCode =>
      datesDecoration.hashCode ^ disable.hashCode ^ hide.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'DatesProperties{decorationProperties: $datesDecoration, disable: $disable, hide: $hide}';
  }
}
