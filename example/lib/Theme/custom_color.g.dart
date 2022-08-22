import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const turquoise = Color(0xFF0081A7);
const pink = Color(0xFFFFC8DD);

CustomColors lightCustomColors = const CustomColors(
  sourceTurquoise: Color(0xFF0081A7),
  turquoise: Color(0xFF006685),
  onTurquoise: Color(0xFFFFFFFF),
  turquoiseContainer: Color(0xFFBFE9FF),
  onTurquoiseContainer: Color(0xFF001F2A),
  sourcePink: Color(0xFFFFC8DD),
  pink: Color(0xFF96416B),
  onPink: Color(0xFFFFFFFF),
  pinkContainer: Color(0xFFFFD8E6),
  onPinkContainer: Color(0xFF3D0024),
);

CustomColors darkCustomColors = const CustomColors(
  sourceTurquoise: Color(0xFF0081A7),
  turquoise: Color(0xFF6CD2FF),
  onTurquoise: Color(0xFF003547),
  turquoiseContainer: Color(0xFF004D65),
  onTurquoiseContainer: Color(0xFFBFE9FF),
  sourcePink: Color(0xFFFFC8DD),
  pink: Color(0xFFFFAFD1),
  onPink: Color(0xFF5C113B),
  pinkContainer: Color(0xFF792952),
  onPinkContainer: Color(0xFFFFD8E6),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceTurquoise,
    required this.turquoise,
    required this.onTurquoise,
    required this.turquoiseContainer,
    required this.onTurquoiseContainer,
    required this.sourcePink,
    required this.pink,
    required this.onPink,
    required this.pinkContainer,
    required this.onPinkContainer,
  });

  final Color? sourceTurquoise;
  final Color? turquoise;
  final Color? onTurquoise;
  final Color? turquoiseContainer;
  final Color? onTurquoiseContainer;
  final Color? sourcePink;
  final Color? pink;
  final Color? onPink;
  final Color? pinkContainer;
  final Color? onPinkContainer;

  @override
  CustomColors copyWith({
    Color? sourceTurquoise,
    Color? turquoise,
    Color? onTurquoise,
    Color? turquoiseContainer,
    Color? onTurquoiseContainer,
    Color? sourcePink,
    Color? pink,
    Color? onPink,
    Color? pinkContainer,
    Color? onPinkContainer,
  }) {
    return CustomColors(
      sourceTurquoise: sourceTurquoise ?? this.sourceTurquoise,
      turquoise: turquoise ?? this.turquoise,
      onTurquoise: onTurquoise ?? this.onTurquoise,
      turquoiseContainer: turquoiseContainer ?? this.turquoiseContainer,
      onTurquoiseContainer: onTurquoiseContainer ?? this.onTurquoiseContainer,
      sourcePink: sourcePink ?? this.sourcePink,
      pink: pink ?? this.pink,
      onPink: onPink ?? this.onPink,
      pinkContainer: pinkContainer ?? this.pinkContainer,
      onPinkContainer: onPinkContainer ?? this.onPinkContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceTurquoise: Color.lerp(sourceTurquoise, other.sourceTurquoise, t),
      turquoise: Color.lerp(turquoise, other.turquoise, t),
      onTurquoise: Color.lerp(onTurquoise, other.onTurquoise, t),
      turquoiseContainer:
          Color.lerp(turquoiseContainer, other.turquoiseContainer, t),
      onTurquoiseContainer:
          Color.lerp(onTurquoiseContainer, other.onTurquoiseContainer, t),
      sourcePink: Color.lerp(sourcePink, other.sourcePink, t),
      pink: Color.lerp(pink, other.pink, t),
      onPink: Color.lerp(onPink, other.onPink, t),
      pinkContainer: Color.lerp(pinkContainer, other.pinkContainer, t),
      onPinkContainer: Color.lerp(onPinkContainer, other.onPinkContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///   * [CustomColors.sourceTurquoise]
  ///   * [CustomColors.turquoise]
  ///   * [CustomColors.onTurquoise]
  ///   * [CustomColors.turquoiseContainer]
  ///   * [CustomColors.onTurquoiseContainer]
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
      sourceTurquoise: sourceTurquoise!.harmonizeWith(dynamic.primary),
      turquoise: turquoise!.harmonizeWith(dynamic.primary),
      onTurquoise: onTurquoise!.harmonizeWith(dynamic.primary),
      turquoiseContainer: turquoiseContainer!.harmonizeWith(dynamic.primary),
      onTurquoiseContainer:
          onTurquoiseContainer!.harmonizeWith(dynamic.primary),
    );
  }
}
