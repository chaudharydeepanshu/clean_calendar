import 'package:clean_calendar/src/state/gesture_detector_state_provider.dart';
import 'package:clean_calendar/src/state/providers.dart';
import 'package:clean_calendar/src/ui/grid_view_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateRangeSelectionGridViewBuilder extends StatelessWidget {
  const DateRangeSelectionGridViewBuilder(
      {Key? key,
      required this.pageViewElementsDates,
      required this.pageViewMonthDate})
      : super(key: key);

  final List<DateTime> pageViewElementsDates;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        /// It is important that we create Global key locally as the latest build by PageView builder is not the current page.
        /// So storing keys in provider based on latest build would result in saving global keys of next page in PageView leading to undesired results.
        /// To avoid this undesired behaviour we provide this local Global key list to gesture detector functions directly.
        /// To verify that log the date time inside PageView builder.
        List<GlobalKey> pageViewElementsGlobalKeys = List<GlobalKey>.generate(
                42,
                (index) =>
                    GlobalKey(debugLabel: "${pageViewElementsDates[index]}"))
            .toList();

        final GestureDetectorStateProvider
            readGestureDetectorStateProviderProviderValue =
            ref.read(gestureDetectorStateProviderProvider);
        return GestureDetector(
          onPanStart: (details) {
            readGestureDetectorStateProviderProviderValue.initialise(
                pageViewElementsDates: pageViewElementsDates,
                pageViewElementsGlobalKeys: pageViewElementsGlobalKeys);
            readGestureDetectorStateProviderProviderValue.onPanStart(details);
          },
          onPanUpdate: (details) =>
              readGestureDetectorStateProviderProviderValue
                  .onPanUpdate(details),
          child: GridView.builder(
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
                pageViewElementDate: pageViewElementsDates[index],
                pageViewDate: pageViewMonthDate,
              );
            },
          ),
        );
      },
    );
  }
}

class NoSelectionMonthViewGridViewBuilder extends StatelessWidget {
  const NoSelectionMonthViewGridViewBuilder(
      {Key? key,
      required this.pageViewMonthDate,
      required this.pageViewElementsDates})
      : super(key: key);

  final List<DateTime> pageViewElementsDates;
  final DateTime pageViewMonthDate;

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
              pageViewElementDate: pageViewElementsDates[index],
              pageViewDate: pageViewMonthDate,
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
      required this.pageViewElementsDates,
      required this.pageViewMonthDate})
      : super(key: key);

  final List<DateTime> pageViewElementsDates;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        /// It is important that we create Global key locally as the latest build by PageView builder is not the current page.
        /// So storing keys in provider based on latest build would result in saving global keys of next page in PageView leading to undesired results.
        /// To avoid this undesired behaviour we provide this local Global key list to gesture detector functions directly.
        /// To verify that log the date time inside PageView builder.
        List<GlobalKey> pageViewElementsGlobalKeys = List<GlobalKey>.generate(
                42,
                (index) =>
                    GlobalKey(debugLabel: "${pageViewElementsDates[index]}"))
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
              pageViewElementDate: pageViewElementsDates[index],
              pageViewDate: pageViewMonthDate,
            );
          },
        );
      },
    );
  }
}

class NoSelectionWeekViewGridViewBuilder extends StatelessWidget {
  const NoSelectionWeekViewGridViewBuilder(
      {Key? key,
      required this.pageViewDate,
      required this.pageViewElementsDates})
      : super(key: key);

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
      required this.pageViewElementsDates,
      required this.pageViewDate})
      : super(key: key);

  final List<DateTime> pageViewElementsDates;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        /// It is important that we create Global key locally as the latest build by PageView builder is not the current page.
        /// So storing keys in provider based on latest build would result in saving global keys of next page in PageView leading to undesired results.
        /// To avoid this undesired behaviour we provide this local Global key list to gesture detector functions directly.
        /// To verify that log the date time inside PageView builder.
        List<GlobalKey> pageViewElementsGlobalKeys = List<GlobalKey>.generate(
                7,
                (index) =>
                    GlobalKey(debugLabel: "${pageViewElementsDates[index]}"))
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
              pageViewElementDate: pageViewElementsDates[index],
              pageViewDate: pageViewDate,
            );
          },
        );
      },
    );
  }
}
