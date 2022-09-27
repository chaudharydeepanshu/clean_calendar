import 'package:clean_calendar/clean_calendar.dart';
import 'package:clean_calendar/src/utils.dart';
import 'package:clean_calendar/src/utils/get_end_weekday_from_start_weekday.dat.dart';
import 'package:flutter/material.dart';

List<String> listOfMonthsSymbol = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

/// - WeekDay, Provides different weekdays.
enum WeekDay {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

/// - DatePickerSelectionMode, Provides different modes for date selection.
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
  single,

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

class DatesDecoration {
  /// - datesBackgroundColor, changes the dates background color.
  final Color? datesBackgroundColor;

  /// - datesTextColor, changes the dates text color.
  final Color? datesTextColor;

  /// - datesTextStyle, changes the dates text style.
  final TextStyle? datesTextStyle;

  /// - datesBorderColor, changes the dates border color.
  final Color? datesBorderColor;

  /// - datesBorderRadius, changes the dates border radius.
  final double? datesBorderRadius;

  DatesDecoration({
    this.datesBackgroundColor,
    this.datesTextColor,
    this.datesTextStyle,
    this.datesBorderColor,
    this.datesBorderRadius,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatesDecoration &&
          runtimeType == other.runtimeType &&
          datesBackgroundColor == other.datesBackgroundColor &&
          datesTextColor == other.datesTextColor &&
          datesTextStyle == other.datesTextStyle &&
          datesBorderColor == other.datesBorderColor &&
          datesBorderRadius == other.datesBorderRadius;

  @override
  int get hashCode =>
      datesBackgroundColor.hashCode ^
      datesTextColor.hashCode ^
      datesTextStyle.hashCode ^
      datesBorderColor.hashCode ^
      datesBorderRadius.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'DatesDecoration{datesBackgroundColor: $datesBackgroundColor, datesTextColor: $datesTextColor, datesTextStyle: $datesTextStyle, datesBorderColor: $datesBorderColor, datesBorderRadius: $datesBorderRadius}';
  }
}

class DatesProperties {
  /// - datesDecoration, changes the dates decoration.
  final DatesDecoration? datesDecoration;

  /// - disable, disable dates.
  final bool? disable;

  /// - hide, hide dates.
  final bool? hide;

  DatesProperties({
    this.datesDecoration,
    this.disable,
    this.hide,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatesProperties &&
          runtimeType == other.runtimeType &&
          datesDecoration == other.datesDecoration &&
          disable == other.disable &&
          hide == other.hide;

  @override
  int get hashCode =>
      datesDecoration.hashCode ^ disable.hashCode ^ hide.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'DatesProperties{decorationProperties: $datesDecoration, disable: $disable}';
  }
}

class WeekdaysDecoration {
  /// - weekdayTextColor, changes the weekday text color.
  final Color? weekdayTextColor;

  /// - weekdayTextStyle, changes the weekday text style.
  final TextStyle? weekdayTextStyle;

  WeekdaysDecoration({
    this.weekdayTextColor,
    this.weekdayTextStyle,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekdaysDecoration &&
          runtimeType == other.runtimeType &&
          weekdayTextColor == other.weekdayTextColor &&
          weekdayTextStyle == other.weekdayTextStyle;

  @override
  int get hashCode => weekdayTextColor.hashCode ^ weekdayTextStyle.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'WeekdaysDecoration{weekdayTextColor: $weekdayTextColor, weekdayTextStyle: $weekdayTextStyle}';
  }
}

class WeekdaysProperties {
  /// - generalWeekdaysDecoration, changes the decoration of all weekdays except for which user has provided specific weekday decoration.
  final WeekdaysDecoration? generalWeekdaysDecoration;

  /// - firstWeekdayDecoration, changes the decoration of only first weekday.
  final WeekdaysDecoration? sundayDecoration;

  /// - secondWeekdayDecoration, changes the decoration of only second weekday.
  final WeekdaysDecoration? mondayDecoration;

  /// - thirdWeekdayDecoration, changes the decoration of only third weekday.
  final WeekdaysDecoration? tuesdayDecoration;

  /// - forthWeekdayDecoration, changes the decoration of only forth weekday.
  final WeekdaysDecoration? wednesdayDecoration;

  /// - fifthWeekdayDecoration, changes the decoration of only fifth weekday.
  final WeekdaysDecoration? thursdayDecoration;

  /// - sixthWeekdayDecoration, changes the decoration of only sixth weekday.
  final WeekdaysDecoration? fridayDecoration;

  /// - seventhWeekdayDecoration, changes the decoration of only seventh weekday.
  final WeekdaysDecoration? saturdayDecoration;

  WeekdaysProperties({
    this.generalWeekdaysDecoration,
    this.sundayDecoration,
    this.mondayDecoration,
    this.tuesdayDecoration,
    this.wednesdayDecoration,
    this.thursdayDecoration,
    this.fridayDecoration,
    this.saturdayDecoration,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekdaysProperties &&
          runtimeType == other.runtimeType &&
          generalWeekdaysDecoration == other.generalWeekdaysDecoration &&
          sundayDecoration == other.sundayDecoration &&
          mondayDecoration == other.mondayDecoration &&
          tuesdayDecoration == other.tuesdayDecoration &&
          wednesdayDecoration == other.wednesdayDecoration &&
          thursdayDecoration == other.thursdayDecoration &&
          fridayDecoration == other.fridayDecoration &&
          saturdayDecoration == other.saturdayDecoration;

  @override
  int get hashCode =>
      generalWeekdaysDecoration.hashCode ^
      sundayDecoration.hashCode ^
      mondayDecoration.hashCode ^
      tuesdayDecoration.hashCode ^
      wednesdayDecoration.hashCode ^
      thursdayDecoration.hashCode ^
      fridayDecoration.hashCode ^
      saturdayDecoration.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'WeekdaysProperties{generalWeekdaysDecoration: $generalWeekdaysDecoration, sundayDecoration: $sundayDecoration, mondayDecoration: $mondayDecoration, tuesdayDecoration: $tuesdayDecoration, wednesdayDecoration: $wednesdayDecoration, thursdayDecoration: $thursdayDecoration, fridayDecoration: $fridayDecoration, saturdayDecoration: $saturdayDecoration}';
  }
}

class CalendarPropertiesState extends ChangeNotifier {
  late WeekdaysProperties _weekdaysProperties;
  WeekdaysProperties get weekdaysProperties => _weekdaysProperties;

  late DatesProperties _streakDatesProperties;
  DatesProperties get streakDatesProperties => _streakDatesProperties;

  late DatesProperties _currentDateProperties;
  DatesProperties get currentDateProperties => _currentDateProperties;

  late DatesProperties _generalDatesProperties;
  DatesProperties get generalDatesProperties => _generalDatesProperties;

  late DatesProperties _leadingTrailingDatesProperties;
  DatesProperties get leadingTrailingDatesProperties =>
      _leadingTrailingDatesProperties;

  late DatesProperties _selectedDatesProperties;
  DatesProperties get selectedDatesProperties => _selectedDatesProperties;

  late DatesProperties _selectedRangeBetweenDatesProperties;
  DatesProperties get selectedRangeBetweenDatesProperties =>
      _selectedRangeBetweenDatesProperties;

  late bool _enableDenseViewForDates;
  bool get enableDenseViewForDates => _enableDenseViewForDates;

  late bool _enableDenseSplashForDates;
  bool get enableDenseSplashForDates => _enableDenseSplashForDates;

  late DateTime? _startDateOfCalendar;
  DateTime get startDateOfCalendar =>
      _startDateOfCalendar ?? DateTime.utc(0000, 1, 1);

  late DateTime? _endDateOfCalendar;
  DateTime get endDateOfCalendar =>
      _endDateOfCalendar ?? DateTime.utc(9999, 1, 1);

  late DatePickerSelectionMode _dateSelectionMode;
  DatePickerSelectionMode get dateSelectionMode => _dateSelectionMode;

  late bool _disablePastDates;
  bool get disablePastDates => _disablePastDates;

  late DateTime _initialViewMonthDateTime;
  DateTime get initialViewMonthDateTime => _initialViewMonthDateTime;

  late DateTime _currentDateOfCalendar;
  DateTime get currentDateOfCalendar => _currentDateOfCalendar;

  late List<DateTime> _datesForStreaks;
  List<DateTime> get datesForStreaks => _datesForStreaks;

  late List<DateTime> _selectedDates;
  List<DateTime> get selectedDates => _selectedDates;

  late ValueChanged<List<DateTime>> _onSelectedDates;
  ValueChanged<List<DateTime>> get onSelectedDates => _onSelectedDates;

  late ValueChanged<DateTime> _onCalendarViewDate;
  ValueChanged<DateTime> get onCalendarViewDate => _onCalendarViewDate;

  late DatePickerCalendarView _datePickerCalendarView;
  DatePickerCalendarView get datePickerCalendarView => _datePickerCalendarView;

  late int? _startWeekday;
  int get startWeekday => _startWeekday ?? 7;

  late final int _endWeekday =
      getEndWeekdayFromStartWeekday(startWeekday: startWeekday);
  int get endWeekday => _endWeekday;

  late Weekdays? _weekdaysSymbol;
  Weekdays get weekdaysSymbol =>
      _weekdaysSymbol ??
      const Weekdays(
          sunday: "Su",
          monday: "Mo",
          tuesday: "Tu",
          wednesday: "We",
          thursday: "Th",
          friday: "Fr",
          saturday: "Sa");

  late Months? _monthsSymbol;
  Months get monthsSymbol =>
      _monthsSymbol ??
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

  initializeProperties({
    required DatePickerCalendarView? datePickerCalendarView,
    required WeekdaysProperties? weekdaysProperties,
    required DatesProperties? streakDatesProperties,
    required DatesProperties? currentDateProperties,
    required DatesProperties? generalDatesProperties,
    required DatesProperties? leadingTrailingDatesProperties,
    required DatesProperties? selectedDatesProperties,
    required DatesProperties? selectedRangeBetweenDatesProperties,
    required bool? enableDenseViewForDates,
    required bool? enableDenseSplashForDates,
    required DateTime? startDateOfCalendar,
    required DateTime? endDateOfCalendar,
    required DatePickerSelectionMode? dateSelectionMode,
    required bool? disablePastDates,
    required DateTime? initialViewMonthDateTime,
    required DateTime? currentDateOfCalendar,
    required List<DateTime>? datesForStreaks,
    required List<DateTime>? selectedDates,
    required ValueChanged<List<DateTime>>? onSelectedDates,
    required ValueChanged<DateTime>? onCalendarViewDate,
    required WeekDay? startWeekday,
    required Weekdays? weekdaysSymbol,
    required Months? monthsSymbol,
    required BuildContext context,
  }) {
    final ThemeData theme = Theme.of(context);

    _datePickerCalendarView =
        datePickerCalendarView ?? DatePickerCalendarView.monthView;

    _weekdaysProperties = WeekdaysProperties(
      generalWeekdaysDecoration: WeekdaysDecoration(
        weekdayTextColor:
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
                theme.colorScheme.onSurface,
        weekdayTextStyle:
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
                const TextStyle(),
      ),
      sundayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.sundayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.sundayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      mondayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.mondayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.mondayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      tuesdayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.tuesdayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.tuesdayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      wednesdayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.wednesdayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.wednesdayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      thursdayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.thursdayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.thursdayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      fridayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.fridayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.fridayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      saturdayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.saturdayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.saturdayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
    );

    _streakDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor:
              streakDatesProperties?.datesDecoration?.datesBackgroundColor ??
                  theme.colorScheme.surfaceVariant,
          datesTextColor:
              streakDatesProperties?.datesDecoration?.datesTextColor ??
                  theme.colorScheme.onSurfaceVariant,
          datesTextStyle:
              streakDatesProperties?.datesDecoration?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              streakDatesProperties?.datesDecoration?.datesBorderColor ??
                  theme.colorScheme.onSurface,
          datesBorderRadius:
              streakDatesProperties?.datesDecoration?.datesBorderRadius ?? 12),
      disable: streakDatesProperties?.disable ?? false,
      hide: streakDatesProperties?.hide ?? false,
    );

    _currentDateProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor:
              currentDateProperties?.datesDecoration?.datesBackgroundColor,
          datesTextColor:
              currentDateProperties?.datesDecoration?.datesTextColor,
          datesTextStyle:
              currentDateProperties?.datesDecoration?.datesTextStyle,
          datesBorderColor:
              currentDateProperties?.datesDecoration?.datesBorderColor ??
                  theme.colorScheme.primary,
          datesBorderRadius:
              currentDateProperties?.datesDecoration?.datesBorderRadius ?? 12),
      disable: currentDateProperties?.disable ?? false,
      hide: currentDateProperties?.hide ?? false,
    );

    _generalDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor:
              generalDatesProperties?.datesDecoration?.datesBackgroundColor ??
                  Colors.transparent,
          datesTextColor:
              generalDatesProperties?.datesDecoration?.datesTextColor ??
                  theme.colorScheme.onSurface,
          datesTextStyle:
              generalDatesProperties?.datesDecoration?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              generalDatesProperties?.datesDecoration?.datesBorderColor ??
                  theme.colorScheme.onSurface.withOpacity(0.5),
          datesBorderRadius:
              generalDatesProperties?.datesDecoration?.datesBorderRadius ?? 12),
      disable: generalDatesProperties?.disable ?? false,
      hide: generalDatesProperties?.hide ?? false,
    );

    _leadingTrailingDatesProperties =
        _datePickerCalendarView == DatePickerCalendarView.monthView
            ? DatesProperties(
                datesDecoration: DatesDecoration(
                    datesBackgroundColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBackgroundColor ??
                        theme.colorScheme.surface,
                    datesTextColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesTextColor ??
                        theme.disabledColor,
                    datesTextStyle: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesTextStyle ??
                        const TextStyle(),
                    datesBorderColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBorderColor ??
                        theme.dividerColor,
                    datesBorderRadius: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBorderRadius ??
                        12),
                disable: leadingTrailingDatesProperties?.disable ?? false,
                hide: leadingTrailingDatesProperties?.hide ?? false,
              )
            : DatesProperties(
                datesDecoration: DatesDecoration(
                    datesBackgroundColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBackgroundColor ??
                        Colors.transparent,
                    datesTextColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesTextColor ??
                        theme.colorScheme.onSurface,
                    datesTextStyle: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesTextStyle ??
                        const TextStyle(),
                    datesBorderColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBorderColor ??
                        theme.colorScheme.onSurface.withOpacity(0.5),
                    datesBorderRadius: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBorderRadius ??
                        12),
                disable: leadingTrailingDatesProperties?.disable ?? false,
                hide: leadingTrailingDatesProperties?.hide ?? false,
              );

    _selectedDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor:
              selectedDatesProperties?.datesDecoration?.datesBackgroundColor ??
                  theme.colorScheme.primary,
          datesTextColor:
              selectedDatesProperties?.datesDecoration?.datesTextColor ??
                  theme.colorScheme.onPrimary,
          datesTextStyle:
              selectedDatesProperties?.datesDecoration?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              selectedDatesProperties?.datesDecoration?.datesBorderColor ??
                  theme.colorScheme.primary,
          datesBorderRadius:
              selectedDatesProperties?.datesDecoration?.datesBorderRadius ??
                  12),
      disable: selectedDatesProperties?.disable ?? false,
      hide: selectedDatesProperties?.hide ?? false,
    );

    _selectedRangeBetweenDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: selectedRangeBetweenDatesProperties
                  ?.datesDecoration?.datesBackgroundColor ??
              theme.colorScheme.surfaceVariant,
          datesTextColor: selectedRangeBetweenDatesProperties
                  ?.datesDecoration?.datesTextColor ??
              theme.colorScheme.onSurfaceVariant,
          datesTextStyle: selectedRangeBetweenDatesProperties
                  ?.datesDecoration?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: selectedRangeBetweenDatesProperties
                  ?.datesDecoration?.datesBorderColor ??
              Colors.transparent,
          datesBorderRadius: selectedRangeBetweenDatesProperties
                  ?.datesDecoration?.datesBorderRadius ??
              12),
      disable: selectedDatesProperties?.disable ?? false,
      hide: selectedDatesProperties?.hide ?? false,
    );

    _enableDenseViewForDates = enableDenseViewForDates ?? false;
    _enableDenseSplashForDates = enableDenseSplashForDates ?? false;
    _startDateOfCalendar = startDateOfCalendar ?? DateTime.utc(0000, 1, 1);
    _endDateOfCalendar = endDateOfCalendar ?? DateTime.utc(9999, 1, 1);
    _dateSelectionMode = dateSelectionMode ?? DatePickerSelectionMode.disable;
    _disablePastDates = disablePastDates ?? false;
    _initialViewMonthDateTime = initialViewMonthDateTime != null
        ? (_startDateOfCalendar!.isBefore(initialViewMonthDateTime)
            ? initialViewMonthDateTime
            : _startDateOfCalendar!)
        : currentDateOfCalendar != null
            ? (_startDateOfCalendar!.isBefore(DateTime.utc(
                    currentDateOfCalendar.year,
                    currentDateOfCalendar.month,
                    currentDateOfCalendar.day))
                ? DateTime.utc(currentDateOfCalendar.year,
                    currentDateOfCalendar.month, currentDateOfCalendar.day)
                : _startDateOfCalendar!)
            : _startDateOfCalendar!.isBefore(DateTime.now())
                ? DateTime.utc(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day)
                : _startDateOfCalendar!;
    _currentDateOfCalendar =
        currentDateOfCalendar ?? DateUtils.dateOnly(DateTime.now());
    _datesForStreaks = datesForStreaks != null
        ? List.generate(
            datesForStreaks.length,
            (index) => DateTime.utc(datesForStreaks[index].year,
                datesForStreaks[index].month, datesForStreaks[index].day))
        : [];
    _selectedDates = selectedDates != null
        ? List.generate(
            selectedDates.length,
            (index) => DateTime.utc(selectedDates[index].year,
                selectedDates[index].month, selectedDates[index].day))
        : [];

    _onSelectedDates = onSelectedDates ??
        (List<DateTime> selectedDates) {
          // print(selectedDates);
        };

    _onCalendarViewDate = onCalendarViewDate ??
        (DateTime calendarViewDate) {
          // print(calendarViewDate);
        };

    if (startWeekday == WeekDay.monday) {
      _startWeekday = 1;
    } else if (startWeekday == WeekDay.tuesday) {
      _startWeekday = 2;
    } else if (startWeekday == WeekDay.wednesday) {
      _startWeekday = 3;
    } else if (startWeekday == WeekDay.thursday) {
      _startWeekday = 4;
    } else if (startWeekday == WeekDay.friday) {
      _startWeekday = 5;
    } else if (startWeekday == WeekDay.saturday) {
      _startWeekday = 6;
    } else {
      _startWeekday = 7;
    }

    _weekdaysSymbol = weekdaysSymbol ??
        const Weekdays(
            sunday: "Su",
            monday: "Mo",
            tuesday: "Tu",
            wednesday: "We",
            thursday: "Th",
            friday: "Fr",
            saturday: "Sa");

    _monthsSymbol = monthsSymbol ??
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
  }

  updateProperties({
    required DatePickerCalendarView? datePickerCalendarView,
    required WeekdaysProperties? weekdaysProperties,
    required DatesProperties? streakDatesProperties,
    required DatesProperties? currentDateProperties,
    required DatesProperties? generalDatesProperties,
    required DatesProperties? leadingTrailingDatesProperties,
    required DatesProperties? selectedDatesProperties,
    required DatesProperties? selectedRangeBetweenDatesProperties,
    required bool? enableDenseViewForDates,
    required bool? enableDenseSplashForDates,
    required DateTime? startDateOfCalendar,
    required DateTime? endDateOfCalendar,
    required DatePickerSelectionMode? dateSelectionMode,
    required bool? disablePastDates,
    required DateTime? initialViewMonthDateTime,
    required DateTime? currentDateOfCalendar,
    required List<DateTime>? datesForStreaks,
    required List<DateTime>? selectedDates,
    required ValueChanged<List<DateTime>>? onSelectedDates,
    required ValueChanged<DateTime>? onCalendarViewDate,
    required WeekDay? startWeekday,
    required Weekdays? weekdaysSymbol,
    required Months? monthsSymbol,
    required BuildContext context,
  }) {
    final ThemeData theme = Theme.of(context);

    _datePickerCalendarView =
        datePickerCalendarView ?? DatePickerCalendarView.monthView;

    _weekdaysProperties = WeekdaysProperties(
      generalWeekdaysDecoration: WeekdaysDecoration(
        weekdayTextColor:
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
                theme.colorScheme.onSurface,
        weekdayTextStyle:
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
                const TextStyle(),
      ),
      sundayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.sundayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.sundayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      mondayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.mondayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.mondayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      tuesdayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.tuesdayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.tuesdayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      wednesdayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.wednesdayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.wednesdayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      thursdayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.thursdayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.thursdayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      fridayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.fridayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.fridayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      saturdayDecoration: WeekdaysDecoration(
        weekdayTextColor: weekdaysProperties
                ?.saturdayDecoration?.weekdayTextColor ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: weekdaysProperties
                ?.saturdayDecoration?.weekdayTextStyle ??
            weekdaysProperties?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
    );

    _streakDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor:
              streakDatesProperties?.datesDecoration?.datesBackgroundColor ??
                  theme.colorScheme.surfaceVariant,
          datesTextColor:
              streakDatesProperties?.datesDecoration?.datesTextColor ??
                  theme.colorScheme.onSurfaceVariant,
          datesTextStyle:
              streakDatesProperties?.datesDecoration?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              streakDatesProperties?.datesDecoration?.datesBorderColor ??
                  theme.colorScheme.onSurface,
          datesBorderRadius:
              streakDatesProperties?.datesDecoration?.datesBorderRadius ?? 12),
      disable: streakDatesProperties?.disable ?? false,
      hide: streakDatesProperties?.hide ?? false,
    );

    _currentDateProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor:
              currentDateProperties?.datesDecoration?.datesBackgroundColor,
          datesTextColor:
              currentDateProperties?.datesDecoration?.datesTextColor,
          datesTextStyle:
              currentDateProperties?.datesDecoration?.datesTextStyle,
          datesBorderColor:
              currentDateProperties?.datesDecoration?.datesBorderColor ??
                  theme.colorScheme.primary,
          datesBorderRadius:
              currentDateProperties?.datesDecoration?.datesBorderRadius ?? 12),
      disable: currentDateProperties?.disable ?? false,
      hide: currentDateProperties?.hide ?? false,
    );

    _generalDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor:
              generalDatesProperties?.datesDecoration?.datesBackgroundColor ??
                  Colors.transparent,
          datesTextColor:
              generalDatesProperties?.datesDecoration?.datesTextColor ??
                  theme.colorScheme.onSurface,
          datesTextStyle:
              generalDatesProperties?.datesDecoration?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              generalDatesProperties?.datesDecoration?.datesBorderColor ??
                  theme.colorScheme.onSurface.withOpacity(0.5),
          datesBorderRadius:
              generalDatesProperties?.datesDecoration?.datesBorderRadius ?? 12),
      disable: generalDatesProperties?.disable ?? false,
      hide: generalDatesProperties?.hide ?? false,
    );

    _leadingTrailingDatesProperties =
        _datePickerCalendarView == DatePickerCalendarView.monthView
            ? DatesProperties(
                datesDecoration: DatesDecoration(
                    datesBackgroundColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBackgroundColor ??
                        theme.colorScheme.surface,
                    datesTextColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesTextColor ??
                        theme.disabledColor,
                    datesTextStyle: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesTextStyle ??
                        const TextStyle(),
                    datesBorderColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBorderColor ??
                        theme.dividerColor,
                    datesBorderRadius: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBorderRadius ??
                        12),
                disable: leadingTrailingDatesProperties?.disable ?? false,
                hide: leadingTrailingDatesProperties?.hide ?? false,
              )
            : DatesProperties(
                datesDecoration: DatesDecoration(
                    datesBackgroundColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBackgroundColor ??
                        Colors.transparent,
                    datesTextColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesTextColor ??
                        theme.colorScheme.onSurface,
                    datesTextStyle: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesTextStyle ??
                        const TextStyle(),
                    datesBorderColor: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBorderColor ??
                        theme.colorScheme.onSurface.withOpacity(0.5),
                    datesBorderRadius: leadingTrailingDatesProperties
                            ?.datesDecoration?.datesBorderRadius ??
                        12),
                disable: leadingTrailingDatesProperties?.disable ?? false,
                hide: leadingTrailingDatesProperties?.hide ?? false,
              );

    _selectedDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor:
              selectedDatesProperties?.datesDecoration?.datesBackgroundColor ??
                  theme.colorScheme.primary,
          datesTextColor:
              selectedDatesProperties?.datesDecoration?.datesTextColor ??
                  theme.colorScheme.onPrimary,
          datesTextStyle:
              selectedDatesProperties?.datesDecoration?.datesTextStyle ??
                  const TextStyle(),
          datesBorderColor:
              selectedDatesProperties?.datesDecoration?.datesBorderColor ??
                  theme.colorScheme.primary,
          datesBorderRadius:
              selectedDatesProperties?.datesDecoration?.datesBorderRadius ??
                  12),
      disable: selectedDatesProperties?.disable ?? false,
      hide: selectedDatesProperties?.hide ?? false,
    );

    _selectedRangeBetweenDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: selectedRangeBetweenDatesProperties
                  ?.datesDecoration?.datesBackgroundColor ??
              theme.colorScheme.surfaceVariant,
          datesTextColor: selectedRangeBetweenDatesProperties
                  ?.datesDecoration?.datesTextColor ??
              theme.colorScheme.onSurfaceVariant,
          datesTextStyle: selectedRangeBetweenDatesProperties
                  ?.datesDecoration?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: selectedRangeBetweenDatesProperties
                  ?.datesDecoration?.datesBorderColor ??
              Colors.transparent,
          datesBorderRadius: selectedRangeBetweenDatesProperties
                  ?.datesDecoration?.datesBorderRadius ??
              12),
      disable: selectedDatesProperties?.disable ?? false,
      hide: selectedDatesProperties?.hide ?? false,
    );

    _enableDenseViewForDates = enableDenseViewForDates ?? false;
    _enableDenseSplashForDates = enableDenseSplashForDates ?? false;
    _startDateOfCalendar = startDateOfCalendar ?? DateTime.utc(0000, 1, 1);
    _endDateOfCalendar = endDateOfCalendar ?? DateTime.utc(9999, 1, 1);
    _dateSelectionMode = dateSelectionMode ?? DatePickerSelectionMode.disable;
    _disablePastDates = disablePastDates ?? false;
    _initialViewMonthDateTime = initialViewMonthDateTime != null
        ? (_startDateOfCalendar!.isBefore(initialViewMonthDateTime)
            ? initialViewMonthDateTime
            : _startDateOfCalendar!)
        : currentDateOfCalendar != null
            ? (_startDateOfCalendar!.isBefore(DateTime.utc(
                    currentDateOfCalendar.year,
                    currentDateOfCalendar.month,
                    currentDateOfCalendar.day))
                ? DateTime.utc(currentDateOfCalendar.year,
                    currentDateOfCalendar.month, currentDateOfCalendar.day)
                : _startDateOfCalendar!)
            : _startDateOfCalendar!.isBefore(DateTime.now())
                ? DateTime.utc(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day)
                : _startDateOfCalendar!;
    _currentDateOfCalendar =
        currentDateOfCalendar ?? DateUtils.dateOnly(DateTime.now());
    _datesForStreaks = datesForStreaks != null
        ? List.generate(
            datesForStreaks.length,
            (index) => DateTime.utc(datesForStreaks[index].year,
                datesForStreaks[index].month, datesForStreaks[index].day))
        : [];
    _selectedDates = selectedDates != null
        ? List.generate(
            selectedDates.length,
            (index) => DateTime.utc(selectedDates[index].year,
                selectedDates[index].month, selectedDates[index].day))
        : [];

    _onSelectedDates = onSelectedDates ??
        (List<DateTime> selectedDates) {
          // print(selectedDates);
        };

    _onCalendarViewDate = onCalendarViewDate ??
        (DateTime calendarViewDate) {
          // print(calendarViewDate);
        };

    if (startWeekday == WeekDay.monday) {
      _startWeekday = 1;
    } else if (startWeekday == WeekDay.tuesday) {
      _startWeekday = 2;
    } else if (startWeekday == WeekDay.wednesday) {
      _startWeekday = 3;
    } else if (startWeekday == WeekDay.thursday) {
      _startWeekday = 4;
    } else if (startWeekday == WeekDay.friday) {
      _startWeekday = 5;
    } else if (startWeekday == WeekDay.saturday) {
      _startWeekday = 6;
    } else {
      _startWeekday = 7;
    }

    _weekdaysSymbol = weekdaysSymbol ??
        const Weekdays(
            sunday: "Su",
            monday: "Mo",
            tuesday: "Tu",
            wednesday: "We",
            thursday: "Th",
            friday: "Fr",
            saturday: "Sa");

    _monthsSymbol = monthsSymbol ??
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

    notifyListeners();
  }

  updateSelectedDates({required List<DateTime> selectedDates}) {
    _selectedDates = selectedDates;
    _onSelectedDates.call(_selectedDates);
    notifyListeners();
  }

  updateCalendarViewDate({required DateTime calendarViewDate}) {
    if (_datePickerCalendarView == DatePickerCalendarView.monthView) {
      _onCalendarViewDate
          .call(DateTime.utc(calendarViewDate.year, calendarViewDate.month, 1));
    } else {
      _onCalendarViewDate
          .call(getFirstDayOfWeek(currentDateTime: calendarViewDate));
    }
  }
}
