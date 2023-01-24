import 'package:flutter/material.dart';

class NavigatorDecoration {
  /// - navigateLeftButtonIcon, changes the Icon widget for left navigation icon.
  final Icon? navigateLeftButtonIcon;

  /// - navigateRightButtonIcon, changes the Icon widget for right navigation icon.
  final Icon? navigateRightButtonIcon;

  /// - navigatorResetButtonIcon, changes the Icon widget for right navigation icon.
  final Icon? navigatorResetButtonIcon;

  NavigatorDecoration({
    this.navigateLeftButtonIcon,
    this.navigateRightButtonIcon,
    this.navigatorResetButtonIcon,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavigatorDecoration &&
          runtimeType == other.runtimeType &&
          navigateLeftButtonIcon == other.navigateLeftButtonIcon &&
          navigateRightButtonIcon == other.navigateRightButtonIcon &&
          navigatorResetButtonIcon == other.navigatorResetButtonIcon;

  @override
  int get hashCode =>
      navigateLeftButtonIcon.hashCode ^
      navigateRightButtonIcon.hashCode ^
      navigatorResetButtonIcon.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'NavigatorDecoration{navigateLeftButtonIcon: $navigateLeftButtonIcon, navigateRightButtonIcon: $navigateRightButtonIcon, navigatorResetButtonIcon: $navigatorResetButtonIcon}';
  }
}
