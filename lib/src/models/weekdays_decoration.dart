import 'package:flutter/material.dart';

class WeekdaysDecoration {
  /// - weekdayTextColor, changes the weekday text color.
  final Color? weekdayTextColor;

  /// - weekdayTextStyle, changes the weekday text style.
  final TextStyle? weekdayTextStyle;

  WeekdaysDecoration({
    this.weekdayTextColor,
    this.weekdayTextStyle,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekdaysDecoration &&
          runtimeType == other.runtimeType &&
          weekdayTextColor == other.weekdayTextColor &&
          weekdayTextStyle == other.weekdayTextStyle;

  @override
  int get hashCode => weekdayTextColor.hashCode ^ weekdayTextStyle.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'WeekdaysDecoration{weekdayTextColor: $weekdayTextColor, weekdayTextStyle: $weekdayTextStyle}';
  }
}
