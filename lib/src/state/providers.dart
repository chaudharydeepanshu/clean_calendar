import 'package:clean_calendar/src/state/gesture_detector_state_provider.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/ui/grid_view_element.dart';
import 'package:clean_calendar/src/utils.dart';
import 'package:clean_calendar/src/utils/get_suitable_dates_on_tap.dart';
import 'package:clean_calendar/src/utils/get_suitable_dates_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calendarPropertiesStateProvider =
    ChangeNotifierProvider.autoDispose((ref) => CalendarPropertiesState());

final pageControllerStateProvider = ChangeNotifierProvider.autoDispose((ref) {
  return PageControllerState(ref: ref)..initializePageViewVars();
});

final gestureDetectorStateProviderProvider =
    ChangeNotifierProvider.autoDispose((ref) {
  final CalendarPropertiesState readCalendarPropertiesStateProviderValue =
      ref.watch(calendarPropertiesStateProvider);

  return GestureDetectorStateProvider(
      readCalendarPropertiesStateProviderValue:
          readCalendarPropertiesStateProviderValue);
});

class IndividualDateElementProperties {
  DateTime pageViewElementDate;
  DateTime pageViewMonthDate;

  IndividualDateElementProperties(
      {required this.pageViewElementDate, required this.pageViewMonthDate});
}

final dateSuitableDatesOnTapProvider = StateProvider.autoDispose
    .family<Function()?, IndividualDateElementProperties>(
        (ref, individualDateElementProperties) {
  final CalendarPropertiesState readCalendarPropertiesStateProviderValue =
      ref.read(calendarPropertiesStateProvider);

  List<DateTime> datesForStreaks = ref.watch(
      calendarPropertiesStateProvider.select((value) => value.datesForStreaks));

  List<DateTime> selectedDates = ref.watch(
      calendarPropertiesStateProvider.select((value) => value.selectedDates));

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

  DatesProperties selectedDatesProperties = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.selectedDatesProperties));

  DateTime currentDateOfCalendar = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.currentDateOfCalendar));

  DatePickerSelectionMode dateSelectionMode = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.dateSelectionMode));

  return getSuitableDatesOnTap(
    readCalendarPropertiesStateProviderValue:
        readCalendarPropertiesStateProviderValue,
    leadingTrailingDatesProperties: leadingTrailingDatesProperties,
    streakDatesProperties: streakDatesProperties,
    generalDatesProperties: generalDatesProperties,
    currentDateProperties: currentDateProperties,
    selectedDatesProperties: selectedDatesProperties,
    currentDateOfCalendar: currentDateOfCalendar,
    datesForStreaks: datesForStreaks,
    selectedDates: selectedDates,
    dateSelectionMode: dateSelectionMode,
    pageViewElementDate: individualDateElementProperties.pageViewElementDate,
    pageViewMonthDate: individualDateElementProperties.pageViewMonthDate,
  );
});

final dateSuitablePropertiesProvider = StateProvider.autoDispose
    .family<DatesProperties, IndividualDateElementProperties>(
        (ref, individualDateElementProperties) {
  List<DateTime> datesForStreaks = ref.watch(
      calendarPropertiesStateProvider.select((value) => value.datesForStreaks));

  List<DateTime> selectedDates = ref.watch(
      calendarPropertiesStateProvider.select((value) => value.selectedDates));

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

  DatesProperties selectedDatesProperties = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.selectedDatesProperties));

  DateTime currentDateOfCalendar = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.currentDateOfCalendar));

  return getSuitableDatesProperties(
    pageViewElementDate: individualDateElementProperties.pageViewElementDate,
    pageViewMonthDate: individualDateElementProperties.pageViewMonthDate,
    currentDateOfCalendar: currentDateOfCalendar,
    datesForStreaks: datesForStreaks,
    selectedDates: selectedDates,
    leadingTrailingDatesProperties: leadingTrailingDatesProperties,
    streakDatesProperties: streakDatesProperties,
    generalDatesProperties: generalDatesProperties,
    currentDateProperties: currentDateProperties,
    selectedDatesProperties: selectedDatesProperties,
  );
});

final dateSuitableWidgetProvider = StateProvider.autoDispose
    .family<Widget, IndividualDateElementProperties>(
        (ref, individualDateElementProperties) {
  bool enableDenseViewForDates = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.enableDenseViewForDates));
  bool enableDenseSplashForDates = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.enableDenseSplashForDates));
  List<DateTime> datesForStreaks = ref.watch(
      calendarPropertiesStateProvider.select((value) => value.datesForStreaks));

  CalendarPropertiesState watchCalendarPropertiesStateProviderValue =
      ref.watch(calendarPropertiesStateProvider);

  return getSuitableCalendarDateWidget(
      enableDenseViewForDates: enableDenseViewForDates,
      enableDenseSplashForDates: enableDenseSplashForDates,
      pageViewElementDate: individualDateElementProperties.pageViewElementDate,
      pageViewMonthDate: individualDateElementProperties.pageViewMonthDate,
      datesForStreaks: datesForStreaks,
      watchCalendarPropertiesStateProviderValue:
          watchCalendarPropertiesStateProviderValue);
});

final isPageViewInitialViewProvider = StateProvider.autoDispose<bool>((ref) {
  final DateTime pageViewDateTime = ref.watch(
      pageControllerStateProvider.select((value) => value.pageViewDateTime));

  final DateTime initialViewMonthDateTime = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.initialViewMonthDateTime));

  final DatePickerCalendarView datePickerCalendarView = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.datePickerCalendarView));

  if (datePickerCalendarView == DatePickerCalendarView.monthView) {
    return DateTime(pageViewDateTime.year, pageViewDateTime.month)
        .isAtSameMomentAs(DateTime(
            initialViewMonthDateTime.year, initialViewMonthDateTime.month));
  }
  if (datePickerCalendarView == DatePickerCalendarView.weekView) {
    DateTime firstDayOfWeekAsUTC =
        getFirstDayOfWeek(currentDateTime: initialViewMonthDateTime);
    DateTime lastDayOfWeekAsUTC =
        getLastDayOfWeek(currentDateTime: initialViewMonthDateTime);

    if ((pageViewDateTime.isAfter(firstDayOfWeekAsUTC) &&
            pageViewDateTime.isBefore(lastDayOfWeekAsUTC)) ||
        pageViewDateTime.isAtSameMomentAs(firstDayOfWeekAsUTC) ||
        pageViewDateTime.isAtSameMomentAs(lastDayOfWeekAsUTC)) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
});
