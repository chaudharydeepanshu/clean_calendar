import 'package:clean_calendar/state/gesture_detector_state_provider.dart';
import 'package:clean_calendar/state/providers.dart';
import 'package:clean_calendar/ui/grid_view_element.dart';
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
                pageViewMonthDate: pageViewMonthDate,
              );
            },
          ),
        );
      },
    );
  }
}

class NoSelectionGridViewBuilder extends StatelessWidget {
  const NoSelectionGridViewBuilder(
      {Key? key,
      required this.pageViewMonthDate,
      required this.pageViewElementsDates})
      : super(key: key);

  final List<DateTime> pageViewElementsDates;
  final DateTime pageViewMonthDate;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 7,
          mainAxisExtent: 40,
        ),
        itemCount: 42,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CalendarDateWidget(
            pageViewElementDate: pageViewElementsDates[index],
            pageViewMonthDate: pageViewMonthDate,
          );
        },
      ),
    );
  }
}
