import 'package:clean_calendar/src/models/date_widget_defining_property_class.dart';
import 'package:clean_calendar/src/models/date_widget_ontap_defining_property_class.dart';
import 'package:clean_calendar/src/state/gesture_detector_state_provider.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/utils.dart';
import 'package:clean_calendar/src/utils/get_suitable_dates_properties.dart';
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

final dateSuitableDatesOnTapProvider = StateProvider.autoDispose((ref) {
  /// Not using the same technique as dateSuitablePropertiesProvider that would lead to unwanted builds. Why?
  /// Because we can't compare a function (on tap) and that would lead to rebuild everytime the provider is rebuild and a function is returned.
  /// Also, we shouldn't use this technique in dateSuitablePropertiesProvider as there we need current properties to evaluate the final properties
  /// but this is not the case here as we need only get selectedDates property inside the on tap function
  /// so actually only the selection mode property change can cause all dates to rebuild.
  /// Also, change in properties of dateSuitablePropertiesProvider will not cause all dates to rebuild
  /// as the resulted property will only reach to that specific date which was passed in the family parameter of provider.

  final CalendarPropertiesState readCalendarPropertiesStateProviderValue =
      ref.read(calendarPropertiesStateProvider);

  DatePickerSelectionMode dateSelectionMode = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.dateSelectionMode));

  DateWidgetOnTapDefiningProperties dateWidgetOnTapDefiningProperties =
      DateWidgetOnTapDefiningProperties(
          readCalendarPropertiesStateProviderValue:
              readCalendarPropertiesStateProviderValue,
          dateSelectionMode: dateSelectionMode);

  return dateWidgetOnTapDefiningProperties;
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

  // print("tx");

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

final dateWidgetDefiningPropertyProvider = StateProvider.autoDispose((ref) {
  bool enableDenseViewForDates = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.enableDenseViewForDates));
  bool enableDenseSplashForDates = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.enableDenseSplashForDates));
  List<DateTime> datesForStreaks = ref.watch(
      calendarPropertiesStateProvider.select((value) => value.datesForStreaks));

  DateWidgetDefiningProperties dateWidgetDefiningProperties =
      DateWidgetDefiningProperties(
          enableDenseViewForDates: enableDenseViewForDates,
          enableDenseSplashForDates: enableDenseSplashForDates,
          datesForStreaks: datesForStreaks);

  return dateWidgetDefiningProperties;
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
