import 'package:clean_calendar/src/models/dates_decoration.dart';
import 'package:clean_calendar/src/models/dates_properties.dart';
import 'package:clean_calendar/src/models/months_model.dart';
import 'package:clean_calendar/src/models/weekdays_decoration.dart';
import 'package:clean_calendar/src/models/weekdays_model.dart';
import 'package:clean_calendar/src/models/weekdays_properties.dart';
import 'package:flutter/material.dart';

/// - WeekDay, Provides different weekdays.
enum WeekDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

/// - DatePickerCalendarView, Provides different types of calendar views like monthly or weekly.
enum DatePickerCalendarView {
  /// - DatePickerCalendarView.monthView, Shows calendar as month view.
  monthView,

  /// - DatePickerCalendarView.weekView, Shows calendar as week view.
  weekView,

  /// - DateRangePickerSelection.multiple, Allows multiple date selection,
  /// selecting a new date will not remove the selection for previous dates,
  /// allows to select as many dates as possible.
  // multiple,

  /// - DateRangePickerSelection.range, Allows to select a single range of
  /// dates.
  // range,

  /// - DateRangePickerSelection.multiRange, Allows to select a multiple ranges
  /// of dates.
  // multiRange,
}

/// - DatePickerSelectionMode, Provides different modes for date selection.
enum DatePickerSelectionMode {
  /// - DateRangePickerSelectionMode.single, Allows to select a single date,
  /// selecting a new date will remove the selection for previous date and
  /// updates selection to the new selected date.
  disable,

  /// - DateRangePickerSelectionMode.single, Allows to select a single date,
  /// selecting a new date will remove the selection for previous date and
  /// updates selection to the new selected date.
  singleOrMultiple,

  /// - DateRangePickerSelection.multiple, Allows multiple date selection,
  /// selecting a new date will not remove the selection for previous dates,
  /// allows to select as many dates as possible.
  // multiple,

  /// - DateRangePickerSelection.range, Allows to select a single range of
  /// dates.
  // range,

  /// - DateRangePickerSelection.multiRange, Allows to select a multiple ranges
  /// of dates.
  // multiRange,
}

class CalendarProperties {
  /// Weekdays properties.
  final WeekdaysProperties weekdaysProperties;

  /// Streak dates properties.
  final DatesProperties streakDatesProperties;

  /// Current date properties.
  final DatesProperties currentDateProperties;

  /// General or regular dates properties.
  final DatesProperties generalDatesProperties;

  /// Leading and trailing dates properties.
  final DatesProperties leadingTrailingDatesProperties;

  /// Selected dates properties.
  final DatesProperties selectedDatesProperties;

  /// Dates between selected range of dates properties.
  final DatesProperties selectedRangeBetweenDatesProperties;

  /// Enable dense view for dates.
  final bool enableDenseViewForDates;

  /// Enable dense splash for dates.
  final bool enableDenseSplashForDates;

  /// Start date of calendar.
  final DateTime startDateOfCalendar;

  /// End date of calendar.
  final DateTime endDateOfCalendar;

  /// Date selection mode.
  final DatePickerSelectionMode dateSelectionMode;

  /// Disable past dates (dates before calendar current date).
  final bool disablePastDates;

  /// Calendar initial view.
  final DateTime initialViewMonthDateTime;

  /// Calendar current date.
  final DateTime currentDateOfCalendar;

  /// List of streak dates.
  final List<DateTime> datesForStreaks;

  /// List of selected dates.
  final List<DateTime> selectedDates;

  /// Selected dates callback.
  final ValueChanged<List<DateTime>>? onSelectedDates;

  /// Calendar current view callback.
  final ValueChanged<DateTime>? onCalendarViewDate;

  /// Calendar view type.
  final DatePickerCalendarView datePickerCalendarView;

  /// Calendar start weekday.
  final WeekDay startWeekday;

  /// Calendar weekdays symbols.
  final Weekdays weekdaysSymbol;

  /// Calendar months symbols.
  final Months monthsSymbol;

  /// App context (For setting defaults based on app theme).
  final BuildContext context;

  CalendarProperties({
    WeekdaysProperties? weekdaysProperties,
    DatesProperties? streakDatesProperties,
    DatesProperties? currentDateProperties,
    DatesProperties? generalDatesProperties,
    DatesProperties? leadingTrailingDatesProperties,
    DatesProperties? selectedDatesProperties,
    DatesProperties? selectedRangeBetweenDatesProperties,
    bool? enableDenseViewForDates,
    bool? enableDenseSplashForDates,
    DateTime? startDateOfCalendar,
    DateTime? endDateOfCalendar,
    DatePickerSelectionMode? dateSelectionMode,
    bool? disablePastDates,
    DateTime? initialViewMonthDateTime,
    DateTime? currentDateOfCalendar,
    List<DateTime>? datesForStreaks,
    List<DateTime>? selectedDates,
    this.onSelectedDates,
    this.onCalendarViewDate,
    DatePickerCalendarView? datePickerCalendarView,
    WeekDay? startWeekday,
    Weekdays? weekdaysSymbol,
    Months? monthsSymbol,
    required this.context,
  })  :

        /// Setting weekdays properties.
        weekdaysProperties = WeekdaysProperties(
          generalWeekdaysDecoration: WeekdaysDecoration(
            weekdayTextColor: weekdaysProperties
                    ?.generalWeekdaysDecoration?.weekdayTextColor ??
                Theme.of(context).colorScheme.onSurface,
            weekdayTextStyle: weekdaysProperties
                    ?.generalWeekdaysDecoration?.weekdayTextStyle ??
                const TextStyle(),
          ),
          sundayDecoration: WeekdaysDecoration(
            weekdayTextColor:
                weekdaysProperties?.sundayDecoration?.weekdayTextColor ??
                    Theme.of(context).colorScheme.onSurface,
            weekdayTextStyle:
                weekdaysProperties?.sundayDecoration?.weekdayTextStyle ??
                    const TextStyle(),
          ),
          mondayDecoration: WeekdaysDecoration(
            weekdayTextColor:
                weekdaysProperties?.mondayDecoration?.weekdayTextColor ??
                    Theme.of(context).colorScheme.onSurface,
            weekdayTextStyle:
                weekdaysProperties?.mondayDecoration?.weekdayTextStyle ??
                    const TextStyle(),
          ),
          tuesdayDecoration: WeekdaysDecoration(
            weekdayTextColor:
                weekdaysProperties?.tuesdayDecoration?.weekdayTextColor ??
                    Theme.of(context).colorScheme.onSurface,
            weekdayTextStyle:
                weekdaysProperties?.tuesdayDecoration?.weekdayTextStyle ??
                    const TextStyle(),
          ),
          wednesdayDecoration: WeekdaysDecoration(
            weekdayTextColor:
                weekdaysProperties?.wednesdayDecoration?.weekdayTextColor ??
                    Theme.of(context).colorScheme.onSurface,
            weekdayTextStyle:
                weekdaysProperties?.wednesdayDecoration?.weekdayTextStyle ??
                    const TextStyle(),
          ),
          thursdayDecoration: WeekdaysDecoration(
            weekdayTextColor:
                weekdaysProperties?.thursdayDecoration?.weekdayTextColor ??
                    Theme.of(context).colorScheme.onSurface,
            weekdayTextStyle:
                weekdaysProperties?.thursdayDecoration?.weekdayTextStyle ??
                    const TextStyle(),
          ),
          fridayDecoration: WeekdaysDecoration(
            weekdayTextColor:
                weekdaysProperties?.fridayDecoration?.weekdayTextColor ??
                    Theme.of(context).colorScheme.onSurface,
            weekdayTextStyle:
                weekdaysProperties?.fridayDecoration?.weekdayTextStyle ??
                    const TextStyle(),
          ),
          saturdayDecoration: WeekdaysDecoration(
            weekdayTextColor:
                weekdaysProperties?.saturdayDecoration?.weekdayTextColor ??
                    Theme.of(context).colorScheme.onSurface,
            weekdayTextStyle:
                weekdaysProperties?.saturdayDecoration?.weekdayTextStyle ??
                    const TextStyle(),
          ),
        ),

        /// Setting streakDatesProperties properties.
        streakDatesProperties = DatesProperties(
          datesDecoration: DatesDecoration(
              datesBackgroundColor: streakDatesProperties
                      ?.datesDecoration?.datesBackgroundColor ??
                  Theme.of(context).colorScheme.surfaceVariant,
              datesTextColor:
                  streakDatesProperties?.datesDecoration?.datesTextColor ??
                      Theme.of(context).colorScheme.onSurfaceVariant,
              datesTextStyle:
                  streakDatesProperties?.datesDecoration?.datesTextStyle ??
                      const TextStyle(),
              datesBorderColor:
                  streakDatesProperties?.datesDecoration?.datesBorderColor ??
                      Theme.of(context).colorScheme.onSurface,
              datesBorderRadius:
                  streakDatesProperties?.datesDecoration?.datesBorderRadius ??
                      12),
          disable: streakDatesProperties?.disable ?? false,
          hide: streakDatesProperties?.hide ?? false,
        ),

        /// Setting currentDateProperties properties.
        currentDateProperties = DatesProperties(
          datesDecoration: DatesDecoration(
              datesBackgroundColor:
                  currentDateProperties?.datesDecoration?.datesBackgroundColor,
              datesTextColor:
                  currentDateProperties?.datesDecoration?.datesTextColor,
              datesTextStyle:
                  currentDateProperties?.datesDecoration?.datesTextStyle,
              datesBorderColor:
                  currentDateProperties?.datesDecoration?.datesBorderColor ??
                      Theme.of(context).colorScheme.primary,
              datesBorderRadius:
                  currentDateProperties?.datesDecoration?.datesBorderRadius ??
                      12),
          disable: currentDateProperties?.disable ?? false,
          hide: currentDateProperties?.hide ?? false,
        ),

        /// Setting generalDatesProperties properties.
        generalDatesProperties = DatesProperties(
          datesDecoration: DatesDecoration(
              datesBackgroundColor: generalDatesProperties
                      ?.datesDecoration?.datesBackgroundColor ??
                  Colors.transparent,
              datesTextColor:
                  generalDatesProperties?.datesDecoration?.datesTextColor ??
                      Theme.of(context).colorScheme.onSurface,
              datesTextStyle:
                  generalDatesProperties?.datesDecoration?.datesTextStyle ??
                      const TextStyle(),
              datesBorderColor:
                  generalDatesProperties?.datesDecoration?.datesBorderColor ??
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              datesBorderRadius:
                  generalDatesProperties?.datesDecoration?.datesBorderRadius ??
                      12),
          disable: generalDatesProperties?.disable ?? false,
          hide: generalDatesProperties?.hide ?? false,
        ),

        /// Setting leadingTrailingDatesProperties properties.
        leadingTrailingDatesProperties = DatesProperties(
          datesDecoration: DatesDecoration(
              datesBackgroundColor: leadingTrailingDatesProperties
                      ?.datesDecoration?.datesBackgroundColor ??
                  Theme.of(context).colorScheme.surface,
              datesTextColor: leadingTrailingDatesProperties
                      ?.datesDecoration?.datesTextColor ??
                  Theme.of(context).disabledColor,
              datesTextStyle: leadingTrailingDatesProperties
                      ?.datesDecoration?.datesTextStyle ??
                  const TextStyle(),
              datesBorderColor: leadingTrailingDatesProperties
                      ?.datesDecoration?.datesBorderColor ??
                  Theme.of(context).dividerColor,
              datesBorderRadius: leadingTrailingDatesProperties
                      ?.datesDecoration?.datesBorderRadius ??
                  12),
          disable: leadingTrailingDatesProperties?.disable ?? true,
          hide: leadingTrailingDatesProperties?.hide ?? false,
        ),

        /// Setting selectedDatesProperties properties.
        selectedDatesProperties = DatesProperties(
          datesDecoration: DatesDecoration(
              datesBackgroundColor: selectedDatesProperties
                      ?.datesDecoration?.datesBackgroundColor ??
                  Theme.of(context).colorScheme.primary,
              datesTextColor:
                  selectedDatesProperties?.datesDecoration?.datesTextColor ??
                      Theme.of(context).colorScheme.onPrimary,
              datesTextStyle:
                  selectedDatesProperties?.datesDecoration?.datesTextStyle ??
                      const TextStyle(),
              datesBorderColor:
                  selectedDatesProperties?.datesDecoration?.datesBorderColor ??
                      Theme.of(context).colorScheme.primary,
              datesBorderRadius:
                  selectedDatesProperties?.datesDecoration?.datesBorderRadius ??
                      12),
          disable: selectedDatesProperties?.disable ?? false,
          hide: selectedDatesProperties?.hide ?? false,
        ),

        /// Setting selectedRangeBetweenDatesProperties properties.
        selectedRangeBetweenDatesProperties = DatesProperties(
          datesDecoration: DatesDecoration(
              datesBackgroundColor: selectedRangeBetweenDatesProperties
                      ?.datesDecoration?.datesBackgroundColor ??
                  Theme.of(context).colorScheme.surfaceVariant,
              datesTextColor: selectedRangeBetweenDatesProperties
                      ?.datesDecoration?.datesTextColor ??
                  Theme.of(context).colorScheme.onSurfaceVariant,
              datesTextStyle: selectedRangeBetweenDatesProperties
                      ?.datesDecoration?.datesTextStyle ??
                  const TextStyle(),
              datesBorderColor: selectedRangeBetweenDatesProperties
                      ?.datesDecoration?.datesBorderColor ??
                  Colors.transparent,
              datesBorderRadius: selectedRangeBetweenDatesProperties
                      ?.datesDecoration?.datesBorderRadius ??
                  12),
          disable: selectedRangeBetweenDatesProperties?.disable ?? false,
          hide: selectedRangeBetweenDatesProperties?.hide ?? false,
        ),

        /// Setting enableDenseViewForDates value.
        enableDenseViewForDates = enableDenseViewForDates ?? false,

        /// Setting enableDenseSplashForDates value.
        enableDenseSplashForDates = enableDenseSplashForDates ?? false,

        /// Setting startDateOfCalendar value.
        startDateOfCalendar = startDateOfCalendar != null
            ? DateTime.utc(startDateOfCalendar.year, startDateOfCalendar.month,
                startDateOfCalendar.day)
            : DateTime.utc(0000, 1, 1),

        /// Setting endDateOfCalendar value.
        endDateOfCalendar = endDateOfCalendar != null
            ? DateTime.utc(endDateOfCalendar.year, endDateOfCalendar.month,
                endDateOfCalendar.day)
            : DateTime.utc(9999, 1, 1),

        /// Setting dateSelectionMode value.
        dateSelectionMode =
            dateSelectionMode ?? DatePickerSelectionMode.disable,

        /// Setting disablePastDates value.
        disablePastDates = disablePastDates ?? false,

        /// Setting initialViewMonthDateTime value.
        initialViewMonthDateTime = initialViewMonthDateTime != null
            ? DateTime.utc(initialViewMonthDateTime.year,
                initialViewMonthDateTime.month, initialViewMonthDateTime.day)
            : DateTime.utc(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),

        /// Setting currentDateOfCalendar value.
        currentDateOfCalendar = currentDateOfCalendar != null
            ? DateTime.utc(currentDateOfCalendar.year,
                currentDateOfCalendar.month, currentDateOfCalendar.day)
            : DateTime.utc(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),

        /// Setting datesForStreaks value.
        datesForStreaks = datesForStreaks
                ?.map((e) => DateTime.utc(e.year, e.month, e.day))
                .toList() ??
            [],

        /// Setting selectedDates value.
        selectedDates = selectedDates
                ?.map((e) => DateTime.utc(e.year, e.month, e.day))
                .toList() ??
            [],

        /// Setting datePickerCalendarView value.
        datePickerCalendarView =
            datePickerCalendarView ?? DatePickerCalendarView.monthView,

        /// Setting startWeekday value.
        startWeekday = startWeekday ?? WeekDay.sunday,

        /// Setting weekdaysSymbol symbols.
        weekdaysSymbol = weekdaysSymbol ??
            const Weekdays(
              monday: "Mo",
              tuesday: "Tu",
              wednesday: "We",
              thursday: "Th",
              friday: "Fr",
              saturday: "Sa",
              sunday: "Su",
            ),

        /// Setting monthsSymbol symbols.
        monthsSymbol = monthsSymbol ??
            const Months(
                january: "January",
                february: "February",
                march: "March",
                april: "April",
                may: "May",
                june: "June",
                july: "July",
                august: "August",
                september: "September",
                october: "October",
                november: "November",
                december: "December");

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarProperties &&
          runtimeType == other.runtimeType &&
          weekdaysProperties == other.weekdaysProperties &&
          streakDatesProperties == other.streakDatesProperties &&
          currentDateProperties == other.currentDateProperties &&
          generalDatesProperties == other.generalDatesProperties &&
          leadingTrailingDatesProperties ==
              other.leadingTrailingDatesProperties &&
          selectedDatesProperties == other.selectedDatesProperties &&
          selectedRangeBetweenDatesProperties ==
              other.selectedRangeBetweenDatesProperties &&
          enableDenseViewForDates == other.enableDenseViewForDates &&
          enableDenseSplashForDates == other.enableDenseSplashForDates &&
          startDateOfCalendar == other.startDateOfCalendar &&
          endDateOfCalendar == other.endDateOfCalendar &&
          dateSelectionMode == other.dateSelectionMode &&
          disablePastDates == other.disablePastDates &&
          initialViewMonthDateTime == other.initialViewMonthDateTime &&
          currentDateOfCalendar == other.currentDateOfCalendar &&
          datesForStreaks == other.datesForStreaks &&
          selectedDates == other.selectedDates &&
          onSelectedDates == other.onSelectedDates &&
          onCalendarViewDate == other.onCalendarViewDate &&
          datePickerCalendarView == other.datePickerCalendarView &&
          startWeekday == other.startWeekday &&
          weekdaysSymbol == other.weekdaysSymbol &&
          monthsSymbol == other.monthsSymbol &&
          context == other.context;

  @override
  int get hashCode =>
      weekdaysProperties.hashCode ^
      streakDatesProperties.hashCode ^
      currentDateProperties.hashCode ^
      generalDatesProperties.hashCode ^
      leadingTrailingDatesProperties.hashCode ^
      selectedDatesProperties.hashCode ^
      selectedRangeBetweenDatesProperties.hashCode ^
      enableDenseViewForDates.hashCode ^
      enableDenseSplashForDates.hashCode ^
      startDateOfCalendar.hashCode ^
      endDateOfCalendar.hashCode ^
      dateSelectionMode.hashCode ^
      disablePastDates.hashCode ^
      initialViewMonthDateTime.hashCode ^
      currentDateOfCalendar.hashCode ^
      datesForStreaks.hashCode ^
      selectedDates.hashCode ^
      onSelectedDates.hashCode ^
      onCalendarViewDate.hashCode ^
      datePickerCalendarView.hashCode ^
      startWeekday.hashCode ^
      weekdaysSymbol.hashCode ^
      monthsSymbol.hashCode ^
      context.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'CalendarProperties{weekdaysProperties: $weekdaysProperties, streakDatesProperties: $streakDatesProperties, currentDateProperties: $currentDateProperties, generalDatesProperties: $generalDatesProperties, leadingTrailingDatesProperties: $leadingTrailingDatesProperties, selectedDatesProperties: $selectedDatesProperties, selectedRangeBetweenDatesProperties: $selectedRangeBetweenDatesProperties, enableDenseViewForDates: $enableDenseViewForDates, enableDenseSplashForDates: $enableDenseSplashForDates, startDateOfCalendar: $startDateOfCalendar, endDateOfCalendar: $endDateOfCalendar, dateSelectionMode: $dateSelectionMode, disablePastDates: $disablePastDates, initialViewMonthDateTime: $initialViewMonthDateTime, currentDateOfCalendar: $currentDateOfCalendar, datesForStreaks: $datesForStreaks,  selectedDates: $selectedDates, onSelectedDates: $onSelectedDates, onCalendarViewDate: $onCalendarViewDate, datePickerCalendarView: $datePickerCalendarView, startWeekday: $startWeekday, weekdaysSymbol: $weekdaysSymbol, monthsSymbol: $monthsSymbol, context: $context}';
  }
}
