import 'package:clean_calendar/state/properties_state.dart';
import 'package:clean_calendar/state/providers.dart';
import 'package:clean_calendar/utils/space_fixer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Only use Ink if its parent is a button otherwise it will act weird such as this https://github.com/flutter/flutter/issues/73315
/// Use space fixer between containers of same color to fis lines due to antialiasing.

class CalendarStreakStartDenseDate extends StatelessWidget {
  const CalendarStreakStartDenseDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;
        double? datesBorderRadius =
            datesProperties.decorationProperties?.datesBorderRadius;

        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            side: BorderSide.none,
            shape: datesBorderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(datesBorderRadius),
                      bottomLeft: Radius.circular(datesBorderRadius),
                    ),
                  )
                : null,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: pageViewElementDate.month == pageViewMonthDate.month
              ? () {
                  // widget.onSelectedDate.call(widget.date);
                }
              : null,
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    child: Container(
                      margin: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          border: datesBorderColor != null
                              ? Border.symmetric(
                                  horizontal: BorderSide(
                                      color: datesBorderColor, width: 1))
                              : null,
                          color: datesBackgroundColor,
                        ),
                        child: Container(
                          width: 40 / 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Container(
                      margin: const EdgeInsets.all(4.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          border: datesBorderColor != null
                              ? Border.all(color: datesBorderColor, width: 1)
                              : null,
                          borderRadius: datesBorderRadius != null
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(datesBorderRadius),
                                  bottomLeft:
                                      Radius.circular(datesBorderRadius),
                                )
                              : null,
                          color: datesBackgroundColor,
                        ),
                        child: Center(
                          child: Text(
                            pageViewElementDate.day.toString(),
                            style: datesTextStyle != null
                                ? datesTextStyle.copyWith(
                                    color: datesTextColor,
                                  )
                                : TextStyle(color: datesTextColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// No middle border mode
              /*Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    width: 40,
                    child: Container(
                      margin: const EdgeInsets.all(4.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          border: datesBorderColor != null
                              ? Border.all(color: datesBorderColor, width: 1)
                              : null,
                          borderRadius: datesBorderRadius != null
                              ? BorderRadius.only(
                            topLeft: Radius.circular(datesBorderRadius),
                            bottomLeft:
                            Radius.circular(datesBorderRadius),
                          )
                              : null,
                          color: datesBackgroundColor,
                        ),
                        child: Container(
                          // margin: const EdgeInsets.only(left: 4.0),
                          child: Center(
                            child: Text(
                              pageViewElementDate.day.toString(),
                              style: datesTextStyle != null
                                  ? datesTextStyle.copyWith(
                                color: datesTextColor,
                              )
                                  : TextStyle(color: datesTextColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      margin: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          border: datesBorderColor != null
                              ? Border.symmetric(
                              horizontal: BorderSide(
                                  color: datesBorderColor, width: 1))
                              : null,
                          color: datesBackgroundColor,
                        ),
                        child: Container(
                          width: 40 / 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),*/
              ///
              /// Little far Border mode
              /*SizedBox(
                width: 40,
                child: Container(
                  margin:
                      const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      border: datesBorderColor != null
                          ? Border.all(color: datesBorderColor, width: 1)
                          : null,
                      borderRadius: datesBorderRadius != null
                          ? BorderRadius.only(
                              topLeft: Radius.circular(datesBorderRadius),
                              bottomLeft: Radius.circular(datesBorderRadius),
                            )
                          : null,
                      color: datesBackgroundColor,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 4.0),
                      child: Center(
                        child: Text(
                          pageViewElementDate.day.toString(),
                          style: datesTextStyle != null
                              ? datesTextStyle.copyWith(
                                  color: datesTextColor,
                                )
                              : TextStyle(color: datesTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),*/
              ///
              datesBackgroundColor != null
                  ? Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 4),
                      child: SpaceFixerVerticalInkLine(
                        overflowWidth: 1,
                        overflowColor: datesBackgroundColor,
                        border: datesBorderColor != null
                            ? Border.symmetric(
                                horizontal: BorderSide(
                                    color: datesBorderColor, width: 1))
                            : null,
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 4.0,
                      bottom: 4.0,
                      right: pageViewElementDate.weekday == DateTime.saturday
                          ? 4
                          : 0),
                  child: Ink(
                    decoration: BoxDecoration(
                      border: datesBorderColor != null
                          ? Border.symmetric(
                              horizontal:
                                  BorderSide(color: datesBorderColor, width: 1))
                          : null,
                      color: datesBackgroundColor,
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

class CalendarStreakStartDenseSplashDate extends StatelessWidget {
  const CalendarStreakStartDenseSplashDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;
        double? datesBorderRadius =
            datesProperties.decorationProperties?.datesBorderRadius;

        return InkWell(
          // clipBehavior: Clip.antiAlias,
          customBorder: const RoundedRectangleBorder(side: BorderSide.none),
          borderRadius: datesBorderRadius != null
              ? BorderRadius.only(
                  topLeft: Radius.circular(datesBorderRadius),
                  bottomLeft: Radius.circular(datesBorderRadius))
              : null,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          enableFeedback: false,
          onTap: pageViewElementDate.month == pageViewMonthDate.month
              ? () {
                  // simulateTapOnAnOffset(
                  //     getWidgetCenterOffsetInfo(widgetKey));
                }
              : null,
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  side: BorderSide.none,
                  shape: datesBorderRadius != null
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(datesBorderRadius),
                            bottomLeft: Radius.circular(datesBorderRadius),
                          ),
                        )
                      : null,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: pageViewElementDate.month == pageViewMonthDate.month
                    ? () {
                        // widget.onSelectedDate.call(widget.date);
                      }
                    : null,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SizedBox(
                      child: Container(
                        margin: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            border: datesBorderColor != null
                                ? Border.symmetric(
                                    horizontal: BorderSide(
                                        color: datesBorderColor, width: 1))
                                : null,
                            color: datesBackgroundColor,
                          ),
                          child: Container(
                            width: 40 / 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            border: datesBorderColor != null
                                ? Border.all(color: datesBorderColor, width: 1)
                                : null,
                            borderRadius: datesBorderRadius != null
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(datesBorderRadius),
                                    bottomLeft:
                                        Radius.circular(datesBorderRadius),
                                  )
                                : null,
                            color: datesBackgroundColor,
                          ),
                          child: Center(
                            child: Text(
                              pageViewElementDate.day.toString(),
                              style: datesTextStyle != null
                                  ? datesTextStyle.copyWith(
                                      color: datesTextColor,
                                    )
                                  : TextStyle(color: datesTextColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              datesBackgroundColor != null
                  ? Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 4),
                      child: SpaceFixerVerticalLine(
                        overflowWidth: 1,
                        overflowColor: datesBackgroundColor,
                        border: datesBorderColor != null
                            ? Border.symmetric(
                                horizontal: BorderSide(
                                    color: datesBorderColor, width: 1))
                            : null,
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 4.0,
                      bottom: 4.0,
                      right: pageViewElementDate.weekday == DateTime.saturday
                          ? 4
                          : 0),
                  decoration: BoxDecoration(
                    border: datesBorderColor != null
                        ? Border.symmetric(
                            horizontal:
                                BorderSide(color: datesBorderColor, width: 1))
                        : null,
                    color: datesBackgroundColor,
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

class CalendarStreakStartExpandedDate extends StatelessWidget {
  const CalendarStreakStartExpandedDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;
        double? datesBorderRadius =
            datesProperties.decorationProperties?.datesBorderRadius;

        return OutlinedButton(
          // clipBehavior: Clip.antiAlias,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            // backgroundColor: Theme.of(context).colorScheme.primary,
            // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide.none,
            // side: BorderSide(width: 1, color: Theme.of(context).dividerColor),
            shape: datesBorderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(datesBorderRadius),
                        bottomLeft: Radius.circular(datesBorderRadius)),
                  )
                : null,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: pageViewElementDate.month == pageViewMonthDate.month
              ? () {
                  // widget.onSelectedDate.call(widget.date);
                }
              : null,
          child: Padding(
            padding: EdgeInsets.only(
                top: 4,
                bottom: 4,
                left: 4,
                right:
                    pageViewElementDate.weekday == DateTime.saturday ? 4 : 0),
            child: Ink(
              decoration: BoxDecoration(
                border: datesBorderColor != null
                    ? Border(
                        top: BorderSide(color: datesBorderColor, width: 1),
                        bottom: BorderSide(color: datesBorderColor, width: 1),
                        left: BorderSide(color: datesBorderColor, width: 1),
                        right: BorderSide(color: datesBorderColor, width: 1),
                      )
                    : null,
                borderRadius: datesBorderRadius != null
                    ? BorderRadius.only(
                        topLeft: Radius.circular(datesBorderRadius),
                        bottomLeft: Radius.circular(datesBorderRadius))
                    : null,
                color: datesBackgroundColor,
              ),
              child: Center(
                child: Text(
                  pageViewElementDate.day.toString(),
                  style: datesTextStyle != null
                      ? datesTextStyle.copyWith(
                          color: datesTextColor,
                        )
                      : TextStyle(color: datesTextColor),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CalendarStreakBetweenDenseSplashDate extends StatelessWidget {
  const CalendarStreakBetweenDenseSplashDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;

        return Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: 4.0,
                    bottom: 4.0,
                    left:
                        pageViewElementDate.weekday == DateTime.sunday ? 4 : 0),
                decoration: BoxDecoration(
                  border: datesBorderColor != null
                      ? Border.symmetric(
                          horizontal:
                              BorderSide(color: datesBorderColor, width: 1),
                        )
                      : null,
                  color: datesBackgroundColor,
                ),
              ),
            ),
            datesBackgroundColor != null
                ? Container(
                    margin: const EdgeInsets.only(top: 4, bottom: 4),
                    child: SpaceFixerVerticalLine(
                      overflowWidth: 1,
                      overflowColor: datesBackgroundColor,
                      border: datesBorderColor != null
                          ? Border.symmetric(
                              horizontal:
                                  BorderSide(color: datesBorderColor, width: 1))
                          : null,
                    ),
                  )
                : const SizedBox(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                side: BorderSide.none,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: pageViewElementDate.month == pageViewMonthDate.month
                  ? () {
                      // widget.onSelectedDate.call(widget.date);
                    }
                  : null,
              child: Container(
                margin: const EdgeInsets.only(top: 4, bottom: 4),
                width: 40,
                child: Ink(
                  decoration: BoxDecoration(
                    border: datesBorderColor != null
                        ? Border.symmetric(
                            horizontal:
                                BorderSide(color: datesBorderColor, width: 1))
                        : null,
                    color: datesBackgroundColor,
                  ),
                  child: Center(
                    child: Text(
                      pageViewElementDate.day.toString(),
                      style: datesTextStyle != null
                          ? datesTextStyle.copyWith(
                              color: datesTextColor,
                            )
                          : TextStyle(color: datesTextColor),
                    ),
                  ),
                ),
              ),
            ),
            datesBackgroundColor != null
                ? Container(
                    margin: const EdgeInsets.only(top: 4, bottom: 4),
                    child: SpaceFixerVerticalLine(
                      overflowWidth: 1,
                      overflowColor: datesBackgroundColor,
                      border: datesBorderColor != null
                          ? Border.symmetric(
                              horizontal:
                                  BorderSide(color: datesBorderColor, width: 1))
                          : null,
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: 4.0,
                    bottom: 4.0,
                    right: pageViewElementDate.weekday == DateTime.saturday
                        ? 4
                        : 0),
                decoration: BoxDecoration(
                  border: datesBorderColor != null
                      ? Border.symmetric(
                          horizontal:
                              BorderSide(color: datesBorderColor, width: 1))
                      : null,
                  color: datesBackgroundColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CalendarStreakBetweenExpandedDate extends StatelessWidget {
  const CalendarStreakBetweenExpandedDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;

        return OutlinedButton(
          // clipBehavior: Clip.antiAlias,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            // backgroundColor: Theme.of(context).colorScheme.primary,
            // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide.none,
            // side: BorderSide(width: 1, color: Theme.of(context).dividerColor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: pageViewElementDate.month == pageViewMonthDate.month
              ? () {
                  // onSelectedDate.call(date);
                }
              : null,
          child: Container(
            margin: EdgeInsets.only(
              top: 4,
              bottom: 4,
              right: pageViewElementDate.weekday == DateTime.saturday ? 4 : 0,
              left: pageViewElementDate.weekday == DateTime.sunday ? 4 : 0,
            ),
            child: Ink(
              decoration: BoxDecoration(
                border: datesBorderColor != null
                    ? Border.symmetric(
                        horizontal:
                            BorderSide(color: datesBorderColor, width: 1))
                    : null,
                color: datesBackgroundColor,
              ),
              child: Container(
                margin: EdgeInsets.only(
                  right: pageViewElementDate.weekday == DateTime.sunday ? 4 : 0,
                  left:
                      pageViewElementDate.weekday == DateTime.saturday ? 4 : 0,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Center(
                      child: Text(
                        pageViewElementDate.day.toString(),
                        style: datesTextStyle != null
                            ? datesTextStyle.copyWith(
                                color: datesTextColor,
                              )
                            : TextStyle(color: datesTextColor),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CalendarStreakEndDenseDate extends StatelessWidget {
  const CalendarStreakEndDenseDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;
        double? datesBorderRadius =
            datesProperties.decorationProperties?.datesBorderRadius;

        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            side: BorderSide.none,
            shape: datesBorderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(datesBorderRadius),
                      bottomRight: Radius.circular(datesBorderRadius),
                    ),
                  )
                : null,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: pageViewElementDate.month == pageViewMonthDate.month
              ? () {
                  // widget.onSelectedDate.call(widget.date);
                }
              : null,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 4.0,
                      bottom: 4.0,
                      left: pageViewElementDate.weekday == DateTime.sunday
                          ? 4
                          : 0),
                  child: Ink(
                    decoration: BoxDecoration(
                      border: datesBorderColor != null
                          ? Border(
                              top:
                                  BorderSide(color: datesBorderColor, width: 1),
                              bottom:
                                  BorderSide(color: datesBorderColor, width: 1),
                              // left:
                              //     BorderSide(color: datesBorderColor, width: 1),
                            )
                          : null,
                      color: datesBackgroundColor,
                    ),
                  ),
                ),
              ),
              datesBackgroundColor != null
                  ? Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 4),
                      child: SpaceFixerVerticalInkLine(
                        overflowWidth: 1,
                        overflowColor: datesBackgroundColor,
                        border: datesBorderColor != null
                            ? Border.symmetric(
                                horizontal: BorderSide(
                                    color: datesBorderColor, width: 1))
                            : null,
                      ),
                    )
                  : const SizedBox(),
              Stack(
                children: [
                  SizedBox(
                    child: Container(
                      margin: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          border: datesBorderColor != null
                              ? Border.symmetric(
                                  horizontal: BorderSide(
                                      color: datesBorderColor, width: 1))
                              : null,
                          color: datesBackgroundColor,
                        ),
                        child: Container(
                          width: 40 / 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Container(
                      margin: const EdgeInsets.all(4.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          border: datesBorderColor != null
                              ? Border.all(color: datesBorderColor, width: 1)
                              : null,
                          borderRadius: datesBorderRadius != null
                              ? BorderRadius.only(
                                  topRight: Radius.circular(datesBorderRadius),
                                  bottomRight:
                                      Radius.circular(datesBorderRadius),
                                )
                              : null,
                          color: datesBackgroundColor,
                        ),
                        child: Center(
                          child: Text(
                            pageViewElementDate.day.toString(),
                            style: datesTextStyle != null
                                ? datesTextStyle.copyWith(
                                    color: datesTextColor,
                                  )
                                : TextStyle(color: datesTextColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CalendarStreakEndDenseSplashDate extends StatelessWidget {
  const CalendarStreakEndDenseSplashDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;
        double? datesBorderRadius =
            datesProperties.decorationProperties?.datesBorderRadius;

        return InkWell(
          // clipBehavior: Clip.antiAlias,
          customBorder: const RoundedRectangleBorder(side: BorderSide.none),
          borderRadius: datesBorderRadius != null
              ? BorderRadius.only(
                  topRight: Radius.circular(datesBorderRadius),
                  bottomRight: Radius.circular(datesBorderRadius))
              : null,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          enableFeedback: false,
          onTap: pageViewElementDate.month == pageViewMonthDate.month
              ? () {
                  // simulateTapOnAnOffset(
                  //     getWidgetCenterOffsetInfo(widgetKey));
                }
              : null,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 4.0,
                      bottom: 4.0,
                      left: pageViewElementDate.weekday == DateTime.sunday
                          ? 4
                          : 0),
                  decoration: BoxDecoration(
                    border: datesBorderColor != null
                        ? Border.symmetric(
                            horizontal:
                                BorderSide(color: datesBorderColor, width: 1))
                        : null,
                    color: datesBackgroundColor,
                  ),
                ),
              ),
              datesBackgroundColor != null
                  ? Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 4),
                      child: SpaceFixerVerticalLine(
                        overflowWidth: 1,
                        overflowColor: datesBackgroundColor,
                        border: datesBorderColor != null
                            ? Border.symmetric(
                                horizontal: BorderSide(
                                    color: datesBorderColor, width: 1))
                            : null,
                      ),
                    )
                  : const SizedBox(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  side: BorderSide.none,
                  shape: datesBorderRadius != null
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(datesBorderRadius),
                            bottomRight: Radius.circular(datesBorderRadius),
                          ),
                        )
                      : null,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: pageViewElementDate.month == pageViewMonthDate.month
                    ? () {
                        // widget.onSelectedDate.call(widget.date);
                      }
                    : null,
                child: Stack(
                  children: [
                    SizedBox(
                      child: Container(
                        margin: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            border: datesBorderColor != null
                                ? Border.symmetric(
                                    horizontal: BorderSide(
                                        color: datesBorderColor, width: 1))
                                : null,
                            color: datesBackgroundColor,
                          ),
                          child: Container(
                            width: 40 / 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            border: datesBorderColor != null
                                ? Border.all(color: datesBorderColor, width: 1)
                                : null,
                            borderRadius: datesBorderRadius != null
                                ? BorderRadius.only(
                                    topRight:
                                        Radius.circular(datesBorderRadius),
                                    bottomRight:
                                        Radius.circular(datesBorderRadius),
                                  )
                                : null,
                            color: datesBackgroundColor,
                          ),
                          child: Center(
                            child: Text(
                              pageViewElementDate.day.toString(),
                              style: datesTextStyle != null
                                  ? datesTextStyle.copyWith(
                                      color: datesTextColor,
                                    )
                                  : TextStyle(color: datesTextColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CalendarStreakEndExpandedDate extends StatelessWidget {
  const CalendarStreakEndExpandedDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;
        double? datesBorderRadius =
            datesProperties.decorationProperties?.datesBorderRadius;

        return OutlinedButton(
          // clipBehavior: Clip.antiAlias,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            // backgroundColor: Theme.of(context).colorScheme.primary,
            // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide.none,
            // side: BorderSide(width: 1, color: Theme.of(context).dividerColor),
            shape: datesBorderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(datesBorderRadius),
                        bottomRight: Radius.circular(datesBorderRadius)),
                  )
                : null,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: pageViewElementDate.month == pageViewMonthDate.month
              ? () {
                  // widget.onSelectedDate.call(widget.date);
                }
              : null,
          child: Padding(
            padding: EdgeInsets.only(
                top: 4,
                bottom: 4,
                right: 4,
                left: pageViewElementDate.weekday == DateTime.sunday ? 4 : 0),
            child: Ink(
              decoration: BoxDecoration(
                border: datesBorderColor != null
                    ? Border(
                        top: BorderSide(color: datesBorderColor, width: 1),
                        bottom: BorderSide(color: datesBorderColor, width: 1),
                        left: BorderSide(color: datesBorderColor, width: 1),
                        right: BorderSide(color: datesBorderColor, width: 1),
                      )
                    : null,
                borderRadius: datesBorderRadius != null
                    ? BorderRadius.only(
                        topRight: Radius.circular(datesBorderRadius),
                        bottomRight: Radius.circular(datesBorderRadius))
                    : null,
                color: datesBackgroundColor,
              ),
              child: Center(
                child: Text(
                  pageViewElementDate.day.toString(),
                  style: datesTextStyle != null
                      ? datesTextStyle.copyWith(
                          color: datesTextColor,
                        )
                      : TextStyle(color: datesTextColor),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CalendarStreakSingleDenseDate extends StatelessWidget {
  const CalendarStreakSingleDenseDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;
        double? datesBorderRadius =
            datesProperties.decorationProperties?.datesBorderRadius;

        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            side: BorderSide.none,
            shape: datesBorderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(datesBorderRadius)),
                  )
                : null,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: pageViewElementDate.month == pageViewMonthDate.month
              ? () {
                  // widget.onSelectedDate.call(widget.date);
                }
              : null,
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                width: 40,
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      border: datesBorderColor != null
                          ? Border.all(color: datesBorderColor, width: 1)
                          : null,
                      borderRadius: datesBorderRadius != null
                          ? BorderRadius.all(Radius.circular(datesBorderRadius))
                          : null,
                      color: datesBackgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        pageViewElementDate.day.toString(),
                        style: datesTextStyle != null
                            ? datesTextStyle.copyWith(
                                color: datesTextColor,
                              )
                            : TextStyle(color: datesTextColor),
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CalendarStreakSingleDenseSplashDate extends StatelessWidget {
  const CalendarStreakSingleDenseSplashDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;
        double? datesBorderRadius =
            datesProperties.decorationProperties?.datesBorderRadius;

        return InkWell(
          // clipBehavior: Clip.antiAlias,
          // customBorder: const RoundedRectangleBorder(side: BorderSide.none),
          // borderRadius: datesBorderRadius != null
          //     ? BorderRadius.all(Radius.circular(datesBorderRadius))
          //     : null,
          // focusColor: Colors.transparent,
          // hoverColor: Colors.transparent,
          // highlightColor: Colors.transparent,
          // overlayColor: MaterialStateProperty.all(Colors.transparent),
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          enableFeedback: false,
          onTap: pageViewElementDate.month == pageViewMonthDate.month
              ? () {
                  // Offset widgetCenterOffset =
                  //     getWidgetCenterOffsetInfo(widgetKey);
                  // // print(widgetCenterOffset);
                  // simulateTapOnAnOffset(widgetCenterOffset);
                }
              : null,
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero,
                  // splashFactory: NoSplash.splashFactory,
                  padding: EdgeInsets.zero,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  // backgroundColor: Theme.of(context).colorScheme.primary,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: BorderSide.none,
                  // side: BorderSide(width: 1, color: Theme.of(context).dividerColor),
                  shape: datesBorderRadius != null
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(datesBorderRadius)),
                        )
                      : null,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: pageViewElementDate.month == pageViewMonthDate.month
                    ? () {
                        // widget.onSelectedDate.call(widget.date);
                      }
                    : null,
                child: SizedBox(
                  width: 40,
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        border: datesBorderColor != null
                            ? Border.all(color: datesBorderColor, width: 1)
                            : null,
                        borderRadius: datesBorderRadius != null
                            ? BorderRadius.all(
                                Radius.circular(datesBorderRadius))
                            : null,
                        color: datesBackgroundColor,
                      ),
                      child: Center(
                        child: Text(
                          // key: widgetKey,
                          pageViewElementDate.day.toString(),
                          style: datesTextStyle != null
                              ? datesTextStyle.copyWith(
                                  color: datesTextColor,
                                )
                              : TextStyle(color: datesTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CalendarStreakSingleExpandedDate extends StatelessWidget {
  const CalendarStreakSingleExpandedDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
            dateSuitablePropertiesProvider(IndividualDateElementProperties(
                    pageViewElementDate: pageViewElementDate,
                    pageViewMonthDate: pageViewMonthDate))
                .select((value) => value));

        DatesProperties datesProperties = dateSuitablePropertiesProviderValue;

        Color? datesBackgroundColor =
            datesProperties.decorationProperties?.datesBackgroundColor;
        Color? datesTextColor =
            datesProperties.decorationProperties?.datesTextColor;
        TextStyle? datesTextStyle =
            datesProperties.decorationProperties?.datesTextStyle;
        Color? datesBorderColor =
            datesProperties.decorationProperties?.datesBorderColor;
        double? datesBorderRadius =
            datesProperties.decorationProperties?.datesBorderRadius;

        return OutlinedButton(
          // clipBehavior: Clip.antiAlias,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            // backgroundColor: Theme.of(context).colorScheme.primary,
            // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide.none,
            // side: BorderSide(width: 1, color: Theme.of(context).dividerColor),
            shape: datesBorderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(datesBorderRadius)),
                  )
                : null,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: pageViewElementDate.month == pageViewMonthDate.month
              ? () {
                  // widget.onSelectedDate.call(widget.date);
                }
              : null,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Ink(
              decoration: BoxDecoration(
                border: datesBorderColor != null
                    ? Border.all(color: datesBorderColor, width: 1)
                    : null,
                borderRadius: datesBorderRadius != null
                    ? BorderRadius.all(Radius.circular(datesBorderRadius))
                    : null,
                color: datesBackgroundColor,
              ),
              child: Center(
                child: Text(
                  pageViewElementDate.day.toString(),
                  style: datesTextStyle != null
                      ? datesTextStyle.copyWith(
                          color: datesTextColor,
                        )
                      : TextStyle(color: datesTextColor),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
