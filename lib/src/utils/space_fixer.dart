import 'package:flutter/material.dart';

class SpaceFixerHorizontalLine extends StatelessWidget {
  /// [SpaceFixerHorizontalLine] hides space or line between two same color non-ink widgets placed horizontally.
  ///
  /// ```dart
  /// SpaceFixerHorizontalLine(
  ///     overflowHeight: 3,
  ///     overflowColor: Colors.black,
  /// ),
  /// ```
  ///
  const SpaceFixerHorizontalLine({
    super.key,
    @Deprecated('Context is no longer required.') this.context,
    required this.overflowColor,
    this.width,
    required this.overflowHeight,
    this.border,
  });

  final BuildContext? context;

  /// Use [overflowColor] to set color of [SpaceFixerVerticalLine].
  final Color overflowColor;

  /// Use [overflowHeight] to set height of [SpaceFixerVerticalLine].
  final double overflowHeight;

  /// Use [width] is used to provide custom width to the [SpaceFixerVerticalLine].
  final double? width;

  /// Use [border] to set border to the [SpaceFixerVerticalLine].
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext buildContext, BoxConstraints boxConstraints) {
        final double width;
        width = this.width ??
            boxConstraints.maxWidth; //MediaQuery.of(context).size.width - 1;
        return SizedBox(
          width: width,
          height: 0,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                width: width,
                height: overflowHeight,
                child: Container(
                  width: width,
                  height: overflowHeight,
                  decoration: BoxDecoration(
                    color: overflowColor,
                    border: border,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SpaceFixerVerticalLine extends StatelessWidget {
  /// [SpaceFixerVerticalLine] hides space or line between two same color non-ink widgets placed vertically.
  ///
  /// ```dart
  /// SpaceFixerVerticalLine(
  ///     overflowWidth: 3,
  ///     overflowColor: Colors.black,
  /// ),
  /// ```
  ///
  const SpaceFixerVerticalLine({
    super.key,
    @Deprecated('Context is no longer required.') this.context,
    required this.overflowColor,
    this.overflowWidth = 2,
    this.height,
    this.border,
  });

  final BuildContext? context;

  /// Use [overflowColor] to set color of [SpaceFixerVerticalLine].
  final Color overflowColor;

  /// Use [overflowWidth] to set width of [SpaceFixerVerticalLine].
  final double overflowWidth;

  /// Use [height] is used to provide custom height to the [SpaceFixerVerticalLine].
  final double? height;

  /// Use [border] to set border to the [SpaceFixerVerticalLine].
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext buildContext, BoxConstraints boxConstraints) {
        final double height;
        height = this.height ??
            boxConstraints.maxHeight; //MediaQuery.of(context).size.height;
        return SizedBox(
          width: 0,
          height: height,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                width: overflowWidth,
                height: height,
                child: Container(
                  width: overflowWidth,
                  height: height,
                  decoration: BoxDecoration(
                    color: overflowColor,
                    border: border,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SpaceFixerHorizontalInkLine extends StatelessWidget {
  /// [SpaceFixerHorizontalInkLine] hides space or line between two same color ink widgets placed horizontally inside button.
  ///
  /// ```dart
  /// SpaceFixerHorizontalInkLine(
  ///     overflowHeight: 3,
  ///     overflowColor: Colors.black,
  /// ),
  /// ```
  ///
  const SpaceFixerHorizontalInkLine({
    super.key,
    required this.overflowColor,
    this.width,
    required this.overflowHeight,
    this.border,
  });

  /// Use [overflowColor] to set color of [SpaceFixerVerticalLine].
  final Color overflowColor;

  /// Use [overflowHeight] to set height of [SpaceFixerVerticalLine].
  final double overflowHeight;

  /// Use [width] is used to provide custom width to the [SpaceFixerVerticalLine].
  final double? width;

  /// Use [border] to set border to the [SpaceFixerVerticalLine].
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext buildContext, BoxConstraints boxConstraints) {
        final double width;
        width = this.width ??
            boxConstraints.maxWidth; //MediaQuery.of(context).size.width - 1;
        return SizedBox(
          width: width,
          height: 0,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                width: width,
                height: overflowHeight,
                child: SizedBox(
                  width: width,
                  height: overflowHeight,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: overflowColor,
                      border: border,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SpaceFixerVerticalInkLine extends StatelessWidget {
  /// [SpaceFixerVerticalInkLine] hides space or line between two same color ink widgets placed vertically inside button.
  ///
  /// ```dart
  /// SpaceFixerVerticalInkLine(
  ///     overflowWidth: 3,
  ///     overflowColor: Colors.black,
  /// ),
  /// ```
  ///
  const SpaceFixerVerticalInkLine({
    super.key,
    required this.overflowColor,
    this.overflowWidth = 2,
    this.height,
    this.border,
  });

  /// Use [overflowColor] to set color of [SpaceFixerVerticalLine].
  final Color overflowColor;

  /// Use [overflowWidth] to set width of [SpaceFixerVerticalLine].
  final double overflowWidth;

  /// Use [height] is used to provide custom height to the [SpaceFixerVerticalLine].
  final double? height;

  /// Use [border] to set border to the [SpaceFixerVerticalLine].
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext buildContext, BoxConstraints boxConstraints) {
        final double height;
        height = this.height ??
            boxConstraints.maxHeight; //MediaQuery.of(context).size.height;
        return SizedBox(
          width: 0,
          height: height,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                width: overflowWidth,
                height: height,
                child: SizedBox(
                  width: overflowWidth,
                  height: height,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: overflowColor,
                      border: border,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
