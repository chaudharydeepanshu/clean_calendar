import 'package:clean_calendar/src/state/gesture_detector_state_provider.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/ui/grid_view_element.dart';
import 'package:clean_calendar/src/utils/get_suitable_dates_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calendarPropertiesStateProvider =
    ChangeNotifierProvider((ref) => CalendarPropertiesState());

final pageControllerStateProvider = ChangeNotifierProvider((ref) {
  // We use `ref.watch` to read to another provider, and we pass it the provider
  // that we want to consume. Here: calendarPropertiesStateProvider
  final CalendarPropertiesState watchCalendarPropertiesStateProviderValue =
      ref.watch(calendarPropertiesStateProvider);

  // We can then use the result to do something based on the value of `calendarPropertiesStateProvider`.

  return PageControllerState(
      watchCalendarPropertiesStateProviderValue:
          watchCalendarPropertiesStateProviderValue);
});

final gestureDetectorStateProviderProvider =
    ChangeNotifierProvider((ref) => GestureDetectorStateProvider());

class IndividualDateElementProperties {
  DateTime pageViewElementDate;
  DateTime pageViewMonthDate;

  IndividualDateElementProperties(
      {required this.pageViewElementDate, required this.pageViewMonthDate});
}

final dateSuitablePropertiesProvider =
    StateProvider.family<DatesProperties, IndividualDateElementProperties>(
        (ref, individualDateElementProperties) {
  List<DateTime> datesForStreaks = ref.watch(
      calendarPropertiesStateProvider.select((value) => value.datesForStreaks));
  DatesProperties leadingTrailingDatesProperties = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.leadingTrailingDatesProperties));
  DatesProperties streakDatesProperties = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.streakDatesProperties));
  DatesProperties generalDatesProperties = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.generalDatesProperties));

  DatesProperties currentDateProperties = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.currentDateProperties));

  DateTime currentDateOfCalendar = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.currentDateOfCalendar));

  return getSuitableDatesProperties(
    pageViewElementDate: individualDateElementProperties.pageViewElementDate,
    pageViewMonthDate: individualDateElementProperties.pageViewMonthDate,
    currentDateOfCalendar: currentDateOfCalendar,
    datesForStreaks: datesForStreaks,
    leadingTrailingDatesProperties: leadingTrailingDatesProperties,
    streakDatesProperties: streakDatesProperties,
    generalDatesProperties: generalDatesProperties,
    currentDateProperties: currentDateProperties,
  );
});

final dateSuitableWidgetProvider =
    StateProvider.family<Widget, IndividualDateElementProperties>(
        (ref, individualDateElementProperties) {
  bool enableDenseViewForDates = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.enableDenseViewForDates));
  bool enableDenseSplashForDates = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.enableDenseSplashForDates));
  List<DateTime> datesForStreaks = ref.watch(
      calendarPropertiesStateProvider.select((value) => value.datesForStreaks));

  return getSuitableCalendarDateWidget(
      enableDenseViewForDates: enableDenseViewForDates,
      enableDenseSplashForDates: enableDenseSplashForDates,
      pageViewElementDate: individualDateElementProperties.pageViewElementDate,
      pageViewMonthDate: individualDateElementProperties.pageViewMonthDate,
      datesForStreaks: datesForStreaks);
});

final isPageViewInitialViewProvider = StateProvider<bool>((ref) {
  final DateTime pageViewDateTime = ref.watch(
      pageControllerStateProvider.select((value) => value.pageViewDateTime));

  final DateTime initialViewMonthDateTime = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.initialViewMonthDateTime));

  return pageViewDateTime.isAtSameMomentAs(initialViewMonthDateTime);
});
