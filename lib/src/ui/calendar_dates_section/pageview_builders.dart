import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:clean_calendar/src/ui/calendar_dates_section/gridview_builders.dart';
import 'package:flutter/material.dart';

class ScrollablePageViewBuilder extends StatelessWidget {
  const ScrollablePageViewBuilder(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;

  @override
  Widget build(BuildContext context) {
    if (calendarProperties.datePickerCalendarView ==
        DatePickerCalendarView.monthView) {
      return MonthViewScrollablePageViewBuilder(
        calendarProperties: calendarProperties,
        pageControllerState: pageControllerState,
      );
    }
    if (calendarProperties.datePickerCalendarView ==
        DatePickerCalendarView.weekView) {
      return WeekViewScrollablePageViewBuilder(
        calendarProperties: calendarProperties,
        pageControllerState: pageControllerState,
      );
    }
    // if (dateSelectionMode == DatePickerSelectionMode.range) {
    //   return const NonScrollablePageViewBuilder();
    // }
    else {
      return const SizedBox();
    }
  }
}

class MonthViewScrollablePageViewBuilder extends StatelessWidget {
  const MonthViewScrollablePageViewBuilder(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40 * 6,
      child: PageView.custom(
        controller: pageControllerState.pageController,
        childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return KeepAlive(
                data: CalendarGridViewBuilder(
                  calendarProperties: calendarProperties,
                  pageControllerState: pageControllerState,
                  pageViewDate: calendarProperties.initialViewMonthDateTime
                      .copyWith(
                          month: calendarProperties
                                  .initialViewMonthDateTime.month +
                              pageControllerState
                                      .listOfIntegersFromStartToAndEndDateWithInitialAs0[
                                  index],
                          day: 1),
                ),
                key: ValueKey<int>(pageControllerState
                    .listOfIntegersFromStartToAndEndDateWithInitialAs0[index]),
              );
            },
            childCount: pageControllerState
                .listOfIntegersFromStartToAndEndDateWithInitialAs0.length,
            findChildIndexCallback: (Key key) {
              final ValueKey<int> valueKey = key as ValueKey<int>;
              final int data = valueKey.value;
              return pageControllerState
                  .listOfIntegersFromStartToAndEndDateWithInitialAs0
                  .indexOf(data);
            }),
      ),
    );
  }
}

class WeekViewScrollablePageViewBuilder extends StatelessWidget {
  const WeekViewScrollablePageViewBuilder(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: PageView.custom(
        controller: pageControllerState.pageController,
        childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return KeepAlive(
                data: CalendarGridViewBuilder(
                  calendarProperties: calendarProperties,
                  pageControllerState: pageControllerState,
                  pageViewDate: calendarProperties.initialViewMonthDateTime
                      .copyWith(
                          day: calendarProperties.initialViewMonthDateTime.day +
                              pageControllerState
                                          .listOfIntegersFromStartToAndEndDateWithInitialAs0[
                                      index] *
                                  7),
                ),
                key: ValueKey<int>(pageControllerState
                    .listOfIntegersFromStartToAndEndDateWithInitialAs0[index]),
              );
            },
            childCount: pageControllerState
                .listOfIntegersFromStartToAndEndDateWithInitialAs0.length,
            findChildIndexCallback: (Key key) {
              final ValueKey<int> valueKey = key as ValueKey<int>;
              final int data = valueKey.value;
              return pageControllerState
                  .listOfIntegersFromStartToAndEndDateWithInitialAs0
                  .indexOf(data);
            }),
      ),
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
