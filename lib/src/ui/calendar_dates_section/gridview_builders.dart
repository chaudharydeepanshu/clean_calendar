import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:clean_calendar/src/ui/calendar_dates_section/gridview_elements.dart';
import 'package:clean_calendar/src/utils.dart';
import 'package:clean_calendar/src/utils/get_end_weekday_from_start_weekday.dat.dart';
import 'package:flutter/material.dart';

class CalendarGridViewBuilder extends StatelessWidget {
  const CalendarGridViewBuilder(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState,
      required this.pageViewDate})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    if (calendarProperties.datePickerCalendarView ==
        DatePickerCalendarView.monthView) {
      return CalendarMonthViewGridViewBuilder(
        calendarProperties: calendarProperties,
        pageControllerState: pageControllerState,
        pageViewDate: pageViewDate,
      );
    }
    if (calendarProperties.datePickerCalendarView ==
        DatePickerCalendarView.weekView) {
      return CalendarWeekViewGridViewBuilder(
        calendarProperties: calendarProperties,
        pageControllerState: pageControllerState,
        pageViewDate: pageViewDate,
      );
    }
    // if (dateSelectionMode == DatePickerSelectionMode.range) {
    //   return DateRangeSelectionGridViewBuilder(
    //     pageViewMonthDate: pageViewMonthDate,
    //     pageViewElementsDates: pageViewElementsDates,
    //   );
    // }
    else {
      return const SizedBox();
    }
  }
}

class CalendarMonthViewGridViewBuilder extends StatelessWidget {
  const CalendarMonthViewGridViewBuilder(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState,
      required this.pageViewDate})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    final List<DateTime> pageViewElementsDates = getDatesForACalendarMonthAsUTC(
        dateTime: pageViewDate,
        startWeekday: getIntFromWeekday(calendarProperties.startWeekday));

    if (calendarProperties.dateSelectionMode ==
        DatePickerSelectionMode.disable) {
      return NoSelectionMonthViewGridViewBuilder(
        calendarProperties: calendarProperties,
        pageControllerState: pageControllerState,
        pageViewElementsDates: pageViewElementsDates,
        pageViewDate: pageViewDate,
      );
    }
    if (calendarProperties.dateSelectionMode ==
        DatePickerSelectionMode.singleOrMultiple) {
      return DateSingleMultipleSelectionMonthViewGridViewBuilder(
        calendarProperties: calendarProperties,
        pageControllerState: pageControllerState,
        pageViewElementsDates: pageViewElementsDates,
        pageViewDate: pageViewDate,
      );
    }
    // if (dateSelectionMode == DatePickerSelectionMode.range) {
    //   return DateRangeSelectionGridViewBuilder(
    //     pageViewMonthDate: pageViewMonthDate,
    //     pageViewElementsDates: pageViewElementsDates,
    //   );
    // }
    else {
      return const SizedBox();
    }
  }
}

class CalendarWeekViewGridViewBuilder extends StatelessWidget {
  const CalendarWeekViewGridViewBuilder(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState,
      required this.pageViewDate})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    final List<DateTime> pageViewElementsDates = getDatesForACalendarWeekAsUTC(
        dateTime: pageViewDate,
        startWeekday: getIntFromWeekday(calendarProperties.startWeekday));

    if (calendarProperties.dateSelectionMode ==
        DatePickerSelectionMode.disable) {
      return NoSelectionWeekViewGridViewBuilder(
        calendarProperties: calendarProperties,
        pageControllerState: pageControllerState,
        pageViewElementsDates: pageViewElementsDates,
        pageViewDate: pageViewDate,
      );
    }
    if (calendarProperties.dateSelectionMode ==
        DatePickerSelectionMode.singleOrMultiple) {
      return DateSingleMultipleSelectionWeekViewGridViewBuilder(
        calendarProperties: calendarProperties,
        pageControllerState: pageControllerState,
        pageViewElementsDates: pageViewElementsDates,
        pageViewDate: pageViewDate,
      );
    }
    // if (dateSelectionMode == DatePickerSelectionMode.range) {
    //   return DateRangeSelectionGridViewBuilder(
    //     pageViewMonthDate: pageViewMonthDate,
    //     pageViewElementsDates: pageViewElementsDates,
    //   );
    // }
    else {
      return const SizedBox();
    }
  }
}

// class DateRangeSelectionGridViewBuilder extends StatelessWidget {
//   const DateRangeSelectionGridViewBuilder(
//       {Key? key,
//       required this.pageViewElementsDates,
//       required this.pageViewMonthDate})
//       : super(key: key);
//
//   final List<DateTime> pageViewElementsDates;
//   final DateTime pageViewMonthDate;
//
//   @override
//   Widget build(BuildContext context) {
//     /// It is important that we create Global key locally as the latest build by PageView builder is not the current page.
//     /// So storing keys in provider based on latest build would result in saving global keys of next page in PageView leading to undesired results.
//     /// To avoid this undesired behaviour we provide this local Global key list to gesture detector functions directly.
//     /// To verify that log the date time inside PageView builder.
//     List<GlobalKey> pageViewElementsGlobalKeys = List<GlobalKey>.generate(
//         42,
//             (index) =>
//             GlobalKey(debugLabel: "${pageViewElementsDates[index]}"))
//         .toList();
//
//     final GestureDetectorStateProvider
//     readGestureDetectorStateProviderProviderValue =
//     ref.read(gestureDetectorStateProviderProvider);
//
//     return GestureDetector(
//           onPanStart: (details) {
//             readGestureDetectorStateProviderProviderValue.initialise(
//                 pageViewElementsDates: pageViewElementsDates,
//                 pageViewElementsGlobalKeys: pageViewElementsGlobalKeys);
//             readGestureDetectorStateProviderProviderValue.onPanStart(details);
//           },
//           onPanUpdate: (details) =>
//               readGestureDetectorStateProviderProviderValue
//                   .onPanUpdate(details),
//           child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               childAspectRatio: 1,
//               crossAxisCount: 7,
//               mainAxisExtent: 40,
//             ),
//             itemCount: 42,
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return CalendarDateWidget(
//                 key: pageViewElementsGlobalKeys[index],
//                 pageViewElementDate: pageViewElementsDates[index],
//                 pageViewDate: pageViewMonthDate,
//               );
//             },
//           ),
//         );
//   }
// }

class NoSelectionMonthViewGridViewBuilder extends StatelessWidget {
  const NoSelectionMonthViewGridViewBuilder(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState,
      required this.pageViewElementsDates,
      required this.pageViewDate})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;
  final List<DateTime> pageViewElementsDates;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    return
        // IgnorePointer(
        // child: GridView.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     childAspectRatio: 1,
        //     crossAxisCount: 7,
        //     mainAxisExtent: 40,
        //   ),
        //   itemCount: 42,
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemBuilder: (context, index) {
        //     return CalendarDateWidget(
        //       pageViewElementDate: pageViewElementsDates[index],
        //       pageViewMonthDate: pageViewMonthDate,
        //     );
        //   },
        // ),

        IgnorePointer(
      child: GridView.custom(
        // shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 7,
          mainAxisExtent: 40,
        ),

        childrenDelegate: SliverChildListDelegate(
          List.generate(
            42,
            (index) => CalendarDateWidget(
              calendarProperties: calendarProperties,
              pageViewElementDate: pageViewElementsDates[index],
              pageViewDate: pageViewDate,
            ),
          ),
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}

class DateSingleMultipleSelectionMonthViewGridViewBuilder
    extends StatelessWidget {
  const DateSingleMultipleSelectionMonthViewGridViewBuilder(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState,
      required this.pageViewElementsDates,
      required this.pageViewDate})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;
  final List<DateTime> pageViewElementsDates;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    /// It is important that we create Global key locally as the latest build by PageView builder is not the current page.
    /// So storing keys in provider based on latest build would result in saving global keys of next page in PageView leading to undesired results.
    /// To avoid this undesired behaviour we provide this local Global key list to gesture detector functions directly.
    /// To verify that log the date time inside PageView builder.
    List<GlobalKey> pageViewElementsGlobalKeys = List<GlobalKey>.generate(42,
            (index) => GlobalKey(debugLabel: "${pageViewElementsDates[index]}"))
        .toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 7,
        mainAxisExtent: 40,
      ),
      itemCount: 42,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CalendarDateWidget(
          key: pageViewElementsGlobalKeys[index],
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementsDates[index],
          pageViewDate: pageViewDate,
        );
      },
    );
  }
}

class NoSelectionWeekViewGridViewBuilder extends StatelessWidget {
  const NoSelectionWeekViewGridViewBuilder(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState,
      required this.pageViewElementsDates,
      required this.pageViewDate})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;
  final List<DateTime> pageViewElementsDates;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    return
        // IgnorePointer(
        // child: GridView.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     childAspectRatio: 1,
        //     crossAxisCount: 7,
        //     mainAxisExtent: 40,
        //   ),
        //   itemCount: 42,
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemBuilder: (context, index) {
        //     return CalendarDateWidget(
        //       pageViewElementDate: pageViewElementsDates[index],
        //       pageViewMonthDate: pageViewMonthDate,
        //     );
        //   },
        // ),

        IgnorePointer(
      child: GridView.custom(
        // shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 7,
          mainAxisExtent: 40,
        ),

        childrenDelegate: SliverChildListDelegate(
          List.generate(
            7,
            (index) => CalendarDateWidget(
              calendarProperties: calendarProperties,
              pageViewElementDate: pageViewElementsDates[index],
              pageViewDate: pageViewDate,
            ),
          ),
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}

class DateSingleMultipleSelectionWeekViewGridViewBuilder
    extends StatelessWidget {
  const DateSingleMultipleSelectionWeekViewGridViewBuilder(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState,
      required this.pageViewElementsDates,
      required this.pageViewDate})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;
  final List<DateTime> pageViewElementsDates;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    /// It is important that we create Global key locally as the latest build by PageView builder is not the current page.
    /// So storing keys in provider based on latest build would result in saving global keys of next page in PageView leading to undesired results.
    /// To avoid this undesired behaviour we provide this local Global key list to gesture detector functions directly.
    /// To verify that log the date time inside PageView builder.
    List<GlobalKey> pageViewElementsGlobalKeys = List<GlobalKey>.generate(7,
            (index) => GlobalKey(debugLabel: "${pageViewElementsDates[index]}"))
        .toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 7,
        mainAxisExtent: 40,
      ),
      itemCount: 7,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CalendarDateWidget(
          key: pageViewElementsGlobalKeys[index],
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementsDates[index],
          pageViewDate: pageViewDate,
        );
      },
    );
  }
}
