import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/state/providers.dart';
import 'package:clean_calendar/src/ui/calendar_view.dart';
import 'package:clean_calendar/src/utils/get_suitable_calendar_view_page_view_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NonScrollablePageViewBuilder extends StatelessWidget {
  const NonScrollablePageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatePickerCalendarView datePickerCalendarView = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.datePickerCalendarView));

        return getSuitableCalendarViewNonScrollablePageViewBuilderWidget(
            datePickerCalendarView: datePickerCalendarView);
      },
    );
  }
}

class MonthViewNonScrollablePageViewBuilder extends StatelessWidget {
  const MonthViewNonScrollablePageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final PageControllerState readPageControllerStateProviderValue =
            ref.read(pageControllerStateProvider);
        final PageController pageController =
            readPageControllerStateProviderValue.pageController;

        final List<int> listOfIntegersFromStartToAndEndDateWithInitialAs0 =
            ref.watch(pageControllerStateProvider.select((value) =>
                value.listOfIntegersFromStartToAndEndDateWithInitialAs0));

        final DateTime initialViewMonthDateTime = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.initialViewMonthDateTime));

        return SizedBox(
          height: 40 * 6,
          child: PageView.custom(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return KeepAlive(
                    data: CalendarDatesSection(
                      pageViewDate: DateTime.utc(
                          initialViewMonthDateTime.year,
                          initialViewMonthDateTime.month +
                              listOfIntegersFromStartToAndEndDateWithInitialAs0[
                                  index],
                          1),
                    ),
                    key: ValueKey<int>(
                        listOfIntegersFromStartToAndEndDateWithInitialAs0[
                            index]),
                  );
                },
                childCount:
                    listOfIntegersFromStartToAndEndDateWithInitialAs0.length,
                findChildIndexCallback: (Key key) {
                  final ValueKey<int> valueKey = key as ValueKey<int>;
                  final int data = valueKey.value;
                  return listOfIntegersFromStartToAndEndDateWithInitialAs0
                      .indexOf(data);
                }),
          ),
        );
      },
    );
  }
}

class WeekViewNonScrollablePageViewBuilder extends StatelessWidget {
  const WeekViewNonScrollablePageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final PageControllerState readPageControllerStateProviderValue =
            ref.read(pageControllerStateProvider);
        final PageController pageController =
            readPageControllerStateProviderValue.pageController;

        final List<int> listOfIntegersFromStartToAndEndDateWithInitialAs0 =
            ref.watch(pageControllerStateProvider.select((value) =>
                value.listOfIntegersFromStartToAndEndDateWithInitialAs0));

        final DateTime initialViewMonthDateTime = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.initialViewMonthDateTime));

        return SizedBox(
          height: 40,
          child: PageView.custom(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return KeepAlive(
                    data: CalendarDatesSection(
                      pageViewDate: DateTime.utc(
                          initialViewMonthDateTime.year,
                          initialViewMonthDateTime.month,
                          initialViewMonthDateTime.day +
                              (listOfIntegersFromStartToAndEndDateWithInitialAs0[
                                      index] *
                                  7)),
                    ),
                    key: ValueKey<int>(
                        listOfIntegersFromStartToAndEndDateWithInitialAs0[
                            index]),
                  );
                },
                childCount:
                    listOfIntegersFromStartToAndEndDateWithInitialAs0.length,
                findChildIndexCallback: (Key key) {
                  final ValueKey<int> valueKey = key as ValueKey<int>;
                  final int data = valueKey.value;
                  return listOfIntegersFromStartToAndEndDateWithInitialAs0
                      .indexOf(data);
                }),
          ),
        );
      },
    );
  }
}

class ScrollablePageViewBuilder extends StatelessWidget {
  const ScrollablePageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatePickerCalendarView datePickerCalendarView = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.datePickerCalendarView));

        return getSuitableCalendarViewScrollablePageViewBuilderWidget(
            datePickerCalendarView: datePickerCalendarView);
      },
    );
  }
}

class MonthViewScrollablePageViewBuilder extends StatelessWidget {
  const MonthViewScrollablePageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final PageControllerState readPageControllerStateProviderValue =
            ref.read(pageControllerStateProvider);
        final PageController pageController =
            readPageControllerStateProviderValue.pageController;

        /// Don't watch pageController as that would reset KeepAlive and watching it is unnecessary

        final List<int> listOfIntegersFromStartToAndEndDateWithInitialAs0 =
            ref.watch(pageControllerStateProvider.select((value) =>
                value.listOfIntegersFromStartToAndEndDateWithInitialAs0));

        final DateTime initialViewMonthDateTime = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.initialViewMonthDateTime));
        return SizedBox(
          height: 40 * 6,
          child: PageView.custom(
            controller: pageController,
            childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return KeepAlive(
                    data: CalendarDatesSection(
                      pageViewDate: DateTime.utc(
                          initialViewMonthDateTime.year,
                          initialViewMonthDateTime.month +
                              listOfIntegersFromStartToAndEndDateWithInitialAs0[
                                  index],
                          1),
                    ),
                    key: ValueKey<int>(
                        listOfIntegersFromStartToAndEndDateWithInitialAs0[
                            index]),
                  );
                },
                childCount:
                    listOfIntegersFromStartToAndEndDateWithInitialAs0.length,
                findChildIndexCallback: (Key key) {
                  final ValueKey<int> valueKey = key as ValueKey<int>;
                  final int data = valueKey.value;
                  return listOfIntegersFromStartToAndEndDateWithInitialAs0
                      .indexOf(data);
                }),
          ),
        );
      },
    );
  }
}

class WeekViewScrollablePageViewBuilder extends StatelessWidget {
  const WeekViewScrollablePageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final PageControllerState readPageControllerStateProviderValue =
            ref.read(pageControllerStateProvider);
        final PageController pageController =
            readPageControllerStateProviderValue.pageController;

        /// Don't watch pageController as that would reset KeepAlive and watching it is unnecessary

        final List<int> listOfIntegersFromStartToAndEndDateWithInitialAs0 =
            ref.watch(pageControllerStateProvider.select((value) =>
                value.listOfIntegersFromStartToAndEndDateWithInitialAs0));

        final DateTime initialViewMonthDateTime = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.initialViewMonthDateTime));
        return SizedBox(
          height: 40,
          child: PageView.custom(
            controller: pageController,
            childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return KeepAlive(
                    data: CalendarDatesSection(
                      pageViewDate: DateTime.utc(
                          initialViewMonthDateTime.year,
                          initialViewMonthDateTime.month,
                          initialViewMonthDateTime.day +
                              (listOfIntegersFromStartToAndEndDateWithInitialAs0[
                                      index] *
                                  7)),
                    ),
                    key: ValueKey<int>(
                        listOfIntegersFromStartToAndEndDateWithInitialAs0[
                            index]),
                  );
                },
                childCount:
                    listOfIntegersFromStartToAndEndDateWithInitialAs0.length,
                findChildIndexCallback: (Key key) {
                  final ValueKey<int> valueKey = key as ValueKey<int>;
                  final int data = valueKey.value;
                  return listOfIntegersFromStartToAndEndDateWithInitialAs0
                      .indexOf(data);
                }),
          ),
        );
      },
    );
  }
}

class KeepAlive extends StatefulWidget {
  const KeepAlive({Key? key, required this.data}) : super(key: key);

  final Widget data;

  @override
  State<KeepAlive> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.data;
  }
}
