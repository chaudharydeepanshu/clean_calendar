import 'package:clean_calendar/src/models/date_widget_ontap_defining_property_class.dart';
import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/state/providers.dart';
import 'package:clean_calendar/src/utils/get_suitable_dates_on_tap.dart';
import 'package:clean_calendar/src/utils/get_widget_center_offset_info.dart';
import 'package:clean_calendar/src/utils/simulate_tap_on_an_offset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarGeneralDenseDate extends StatelessWidget {
  const CalendarGeneralDenseDate(
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
        final DateWidgetOnTapDefiningProperties
            dateWidgetOnTapDefiningProperties =
            ref.watch(dateSuitableDatesOnTapProvider.select((value) => value));

        final Function()? dateSuitableDatesOnTap = getSuitableDatesOnTap(
          readCalendarPropertiesStateProviderValue:
              dateWidgetOnTapDefiningProperties
                  .readCalendarPropertiesStateProviderValue,
          dateSelectionMode:
              dateWidgetOnTapDefiningProperties.dateSelectionMode,
          pageViewElementDate: pageViewElementDate,
        );

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
        bool hide = datesProperties.hide ?? false;
        bool disable = datesProperties.disable ?? false;

        return !hide
            ? InkResponse(
                containedInkWell: true,
                highlightShape: BoxShape.rectangle,
                customBorder: datesBorderRadius != null
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(datesBorderRadius)),
                      )
                    : null,
                splashFactory: InkRipple.splashFactory,
                onTap: disable ? null : dateSuitableDatesOnTap,
                child: Row(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    SizedBox(
                      width: 40,
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        child: Container(
                          //Replace here with Ink after this fix https://github.com/flutter/flutter/issues/73315
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
              )
            : const SizedBox();
      },
    );
  }
}
// class CalendarGeneralDenseDate extends StatelessWidget {
//   const CalendarGeneralDenseDate(
//       {Key? key,
//       required this.pageViewElementDate,
//       required this.pageViewMonthDate})
//       : super(key: key);
//
//   final DateTime pageViewElementDate;
//   final DateTime pageViewMonthDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (BuildContext context, WidgetRef ref, Widget? child) {
//         final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
//             dateSuitablePropertiesProvider(IndividualDateElementProperties(
//                     pageViewElementDate: pageViewElementDate,
//                     pageViewMonthDate: pageViewMonthDate))
//                 .select((value) => value));
//
//         DatesProperties datesProperties = dateSuitablePropertiesProviderValue;
//
//         Color? datesBackgroundColor =
//             datesProperties.decorationProperties?.datesBackgroundColor;
//         Color? datesTextColor =
//             datesProperties.decorationProperties?.datesTextColor;
//         TextStyle? datesTextStyle =
//             datesProperties.decorationProperties?.datesTextStyle;
//         Color? datesBorderColor =
//             datesProperties.decorationProperties?.datesBorderColor;
//         double? datesBorderRadius =
//             datesProperties.decorationProperties?.datesBorderRadius;
//
//         return OutlinedButton(
//           style: OutlinedButton.styleFrom(
//             padding: EdgeInsets.zero,
//             foregroundColor: Theme.of(context).colorScheme.onSurface,
//             side: BorderSide.none,
//             shape: datesBorderRadius != null
//                 ? RoundedRectangleBorder(
//                     borderRadius:
//                         BorderRadius.all(Radius.circular(datesBorderRadius)),
//                   )
//                 : null,
//           ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
//           onPressed: pageViewElementDate.month == pageViewMonthDate.month
//               ? () {
//                   // widget.onSelectedDate.call(widget.date);
//                 }
//               : null,
//           child: Row(
//             children: [
//               const Expanded(
//                 child: SizedBox(),
//               ),
//               SizedBox(
//                 width: 40,
//                 child: Container(
//                   margin: const EdgeInsets.all(4.0),
//                   child: Ink(
//                     decoration: BoxDecoration(
//                       border: datesBorderColor != null
//                           ? Border.all(color: datesBorderColor, width: 1)
//                           : null,
//                       borderRadius: datesBorderRadius != null
//                           ? BorderRadius.all(Radius.circular(datesBorderRadius))
//                           : null,
//                       color: datesBackgroundColor,
//                     ),
//                     child: Center(
//                       child: Text(
//                         pageViewElementDate.day.toString(),
//                         style: datesTextStyle != null
//                             ? datesTextStyle.copyWith(
//                                 color: datesTextColor,
//                               )
//                             : TextStyle(color: datesTextColor),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const Expanded(
//                 child: SizedBox(),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class CalendarGeneralDenseSplashDate extends StatelessWidget {
  const CalendarGeneralDenseSplashDate(
      {Key? key,
      required this.pageViewElementDate,
      required this.pageViewMonthDate})
      : super(key: key);

  final DateTime pageViewElementDate;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    final GlobalKey widgetKey = GlobalKey();

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DateWidgetOnTapDefiningProperties
            dateWidgetOnTapDefiningProperties =
            ref.watch(dateSuitableDatesOnTapProvider.select((value) => value));

        final Function()? dateSuitableDatesOnTap = getSuitableDatesOnTap(
          readCalendarPropertiesStateProviderValue:
              dateWidgetOnTapDefiningProperties
                  .readCalendarPropertiesStateProviderValue,
          dateSelectionMode:
              dateWidgetOnTapDefiningProperties.dateSelectionMode,
          pageViewElementDate: pageViewElementDate,
        );

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
        bool hide = datesProperties.hide ?? false;
        bool disable = datesProperties.disable ?? false;

        return !hide
            ? InkResponse(
                // clipBehavior: Clip.antiAlias,
                // customBorder: const RoundedRectangleBorder(side: BorderSide.none),
                // borderRadius: datesBorderRadius != null
                //     ? BorderRadius.all(Radius.circular(datesBorderRadius))
                //     : null,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                enableFeedback: false,
                onTap: disable
                    ? null
                    : () {
                        Offset widgetCenterOffset =
                            getWidgetCenterOffsetInfo(widgetKey);
                        // print(widgetCenterOffset);
                        simulateTapOnAnOffset(widgetCenterOffset);
                      },
                child: Row(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    InkResponse(
                      containedInkWell: true,
                      // highlightColor: Colors.blue,
                      highlightShape: BoxShape.rectangle,
                      customBorder: datesBorderRadius != null
                          ? RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(datesBorderRadius)),
                            )
                          : null,
                      splashFactory: InkRipple.splashFactory,
                      onTap: dateSuitableDatesOnTap,
                      child: SizedBox(
                        width: 40,
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          child: Container(
                            //Replace here with Ink after this fix https://github.com/flutter/flutter/issues/73315
                            decoration: BoxDecoration(
                              border: datesBorderColor != null
                                  ? Border.all(
                                      color: datesBorderColor, width: 1)
                                  : null,
                              borderRadius: datesBorderRadius != null
                                  ? BorderRadius.all(
                                      Radius.circular(datesBorderRadius))
                                  : null,
                              color: datesBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                key: widgetKey,
                                pageViewElementDate.day.toString(),
                                overflow: TextOverflow.ellipsis,
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
              )
            : const SizedBox();
      },
    );
  }
}

// class CalendarGeneralDenseSplashDate extends StatelessWidget {
//   const CalendarGeneralDenseSplashDate(
//       {Key? key,
//       required this.pageViewElementDate,
//       required this.pageViewMonthDate})
//       : super(key: key);
//
//   final DateTime pageViewElementDate;
//   final DateTime pageViewMonthDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (BuildContext context, WidgetRef ref, Widget? child) {
//         final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
//             dateSuitablePropertiesProvider(IndividualDateElementProperties(
//                     pageViewElementDate: pageViewElementDate,
//                     pageViewMonthDate: pageViewMonthDate))
//                 .select((value) => value));
//
//         DatesProperties datesProperties = dateSuitablePropertiesProviderValue;
//
//         Color? datesBackgroundColor =
//             datesProperties.decorationProperties?.datesBackgroundColor;
//         Color? datesTextColor =
//             datesProperties.decorationProperties?.datesTextColor;
//         TextStyle? datesTextStyle =
//             datesProperties.decorationProperties?.datesTextStyle;
//         Color? datesBorderColor =
//             datesProperties.decorationProperties?.datesBorderColor;
//         double? datesBorderRadius =
//             datesProperties.decorationProperties?.datesBorderRadius;
//
//         return InkWell(
//           // clipBehavior: Clip.antiAlias,
//           // customBorder: const RoundedRectangleBorder(side: BorderSide.none),
//           // borderRadius: datesBorderRadius != null
//           //     ? BorderRadius.all(Radius.circular(datesBorderRadius))
//           //     : null,
//           // focusColor: Colors.transparent,
//           // hoverColor: Colors.transparent,
//           // highlightColor: Colors.transparent,
//           // overlayColor: MaterialStateProperty.all(Colors.transparent),
//           splashColor: Colors.transparent,
//           splashFactory: NoSplash.splashFactory,
//           enableFeedback: false,
//           onTap: pageViewElementDate.month == pageViewMonthDate.month
//               ? () {
//                   // Offset widgetCenterOffset =
//                   //     getWidgetCenterOffsetInfo(widgetKey);
//                   // // print(widgetCenterOffset);
//                   // simulateTapOnAnOffset(widgetCenterOffset);
//                 }
//               : null,
//           child: Row(
//             children: [
//               const Expanded(
//                 child: SizedBox(),
//               ),
//               OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   minimumSize: Size.zero,
//                   // splashFactory: NoSplash.splashFactory,
//                   padding: EdgeInsets.zero,
//                   foregroundColor: Theme.of(context).colorScheme.onSurface,
//                   // backgroundColor: Theme.of(context).colorScheme.primary,
//                   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   side: BorderSide.none,
//                   // side: BorderSide(width: 1, color: Theme.of(context).dividerColor),
//                   shape: datesBorderRadius != null
//                       ? RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                               Radius.circular(datesBorderRadius)),
//                         )
//                       : null,
//                 ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
//                 onPressed: pageViewElementDate.month == pageViewMonthDate.month
//                     ? () {
//                         // widget.onSelectedDate.call(widget.date);
//                       }
//                     : null,
//                 child: SizedBox(
//                   width: 40,
//                   child: Container(
//                     margin: const EdgeInsets.all(4.0),
//                     child: Ink(
//                       decoration: BoxDecoration(
//                         border: datesBorderColor != null
//                             ? Border.all(color: datesBorderColor, width: 1)
//                             : null,
//                         borderRadius: datesBorderRadius != null
//                             ? BorderRadius.all(
//                                 Radius.circular(datesBorderRadius))
//                             : null,
//                         color: datesBackgroundColor,
//                       ),
//                       child: Center(
//                         child: Text(
//                           // key: widgetKey,
//                           pageViewElementDate.day.toString(),
//                           style: datesTextStyle != null
//                               ? datesTextStyle.copyWith(
//                                   color: datesTextColor,
//                                 )
//                               : TextStyle(color: datesTextColor),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const Expanded(
//                 child: SizedBox(),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class CalendarGeneralExpandedDate extends StatelessWidget {
  const CalendarGeneralExpandedDate(
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
        final DateWidgetOnTapDefiningProperties
            dateWidgetOnTapDefiningProperties =
            ref.watch(dateSuitableDatesOnTapProvider.select((value) => value));

        final Function()? dateSuitableDatesOnTap = getSuitableDatesOnTap(
          readCalendarPropertiesStateProviderValue:
              dateWidgetOnTapDefiningProperties
                  .readCalendarPropertiesStateProviderValue,
          dateSelectionMode:
              dateWidgetOnTapDefiningProperties.dateSelectionMode,
          pageViewElementDate: pageViewElementDate,
        );

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
        bool hide = datesProperties.hide ?? false;
        bool disable = datesProperties.disable ?? false;

        return !hide
            ? InkResponse(
                containedInkWell: true,
                highlightShape: BoxShape.rectangle,
                customBorder: datesBorderRadius != null
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(datesBorderRadius)),
                      )
                    : null,
                splashFactory: InkRipple.splashFactory,
                onTap: disable ? null : dateSuitableDatesOnTap,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    //Replace here with Ink after this fix https://github.com/flutter/flutter/issues/73315
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
              )
            : const SizedBox();
      },
    );
  }
}

// class CalendarGeneralExpandedDate extends StatelessWidget {
//   const CalendarGeneralExpandedDate(
//       {Key? key,
//       required this.pageViewElementDate,
//       required this.pageViewMonthDate})
//       : super(key: key);
//
//   final DateTime pageViewElementDate;
//   final DateTime pageViewMonthDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (BuildContext context, WidgetRef ref, Widget? child) {
//         final DatesProperties dateSuitablePropertiesProviderValue = ref.watch(
//             dateSuitablePropertiesProvider(IndividualDateElementProperties(
//                     pageViewElementDate: pageViewElementDate,
//                     pageViewMonthDate: pageViewMonthDate))
//                 .select((value) => value));
//
//         DatesProperties datesProperties = dateSuitablePropertiesProviderValue;
//
//         Color? datesBackgroundColor =
//             datesProperties.decorationProperties?.datesBackgroundColor;
//         Color? datesTextColor =
//             datesProperties.decorationProperties?.datesTextColor;
//         TextStyle? datesTextStyle =
//             datesProperties.decorationProperties?.datesTextStyle;
//         Color? datesBorderColor =
//             datesProperties.decorationProperties?.datesBorderColor;
//         double? datesBorderRadius =
//             datesProperties.decorationProperties?.datesBorderRadius;
//
//         return OutlinedButton(
//           // clipBehavior: Clip.antiAlias,
//           style: OutlinedButton.styleFrom(
//             padding: EdgeInsets.zero,
//             foregroundColor: Theme.of(context).colorScheme.onSurface,
//             // backgroundColor: Theme.of(context).colorScheme.primary,
//             // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             side: BorderSide.none,
//             // side: BorderSide(width: 1, color: Theme.of(context).dividerColor),
//             shape: datesBorderRadius != null
//                 ? RoundedRectangleBorder(
//                     borderRadius:
//                         BorderRadius.all(Radius.circular(datesBorderRadius)),
//                   )
//                 : null,
//           ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
//           onPressed: pageViewElementDate.month == pageViewMonthDate.month
//               ? () {
//                   // widget.onSelectedDate.call(widget.date);
//                 }
//               : null,
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Ink(
//               decoration: BoxDecoration(
//                 border: datesBorderColor != null
//                     ? Border.all(color: datesBorderColor, width: 1)
//                     : null,
//                 borderRadius: datesBorderRadius != null
//                     ? BorderRadius.all(Radius.circular(datesBorderRadius))
//                     : null,
//                 color: datesBackgroundColor,
//               ),
//               child: Center(
//                 child: Text(
//                   pageViewElementDate.day.toString(),
//                   style: datesTextStyle != null
//                       ? datesTextStyle.copyWith(
//                           color: datesTextColor,
//                         )
//                       : TextStyle(color: datesTextColor),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
