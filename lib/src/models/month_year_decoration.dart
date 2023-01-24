import 'package:flutter/material.dart';

class MonthYearDecoration {
  /// - monthYearTextColor, changes the month and year text color.
  final Color? monthYearTextColor;

  /// - monthYearTextStyle, changes the month and year text style.
  final TextStyle? monthYearTextStyle;

  MonthYearDecoration({
    this.monthYearTextColor,
    this.monthYearTextStyle,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthYearDecoration &&
          runtimeType == other.runtimeType &&
          monthYearTextColor == other.monthYearTextColor &&
          monthYearTextStyle == other.monthYearTextStyle;

  @override
  int get hashCode => monthYearTextColor.hashCode ^ monthYearTextStyle.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'MonthYearDecoration{monthYearTextColor: $monthYearTextColor, monthYearTextStyle: $monthYearTextStyle}';
  }
}
