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

class CalendarProperties {
  final WeekdaysProperties? weekdaysProperties;

  final DatesProperties? streakDatesProperties;

  final DatesProperties? currentDateProperties;

  final DatesProperties? generalDatesProperties;

  final DatesProperties? leadingTrailingDatesProperties;

  final DatesProperties? selectedDatesProperties;

  final DatesProperties? selectedRangeBetweenDatesProperties;

  final bool enableDenseViewForDates;

  final bool enableDenseSplashForDates;

  final DateTime startDateOfCalendar;

  final DateTime endDateOfCalendar;

  final DatePickerSelectionMode dateSelectionMode;

  final bool disablePastDates;

  final DateTime? initialViewMonthDateTime;

  final DateTime currentDateOfCalendar;

  final List<DateTime>? datesForStreaks;

  final List<DateTime>? selectedDates;

  final ValueChanged<List<DateTime>>? onSelectedDates;

  final ValueChanged<DateTime>? onCalendarViewDate;

  final DatePickerCalendarView datePickerCalendarView;

  final WeekDay startWeekday;

  final WeekDay endWeekday;

  final Weekdays weekdaysSymbol;

  final Months monthsSymbol;

  final BuildContext context;

  CalendarProperties({
    required this.weekdaysProperties,
    required this.streakDatesProperties,
    required this.currentDateProperties,
    required this.generalDatesProperties,
    required this.leadingTrailingDatesProperties,
    required this.selectedDatesProperties,
    this.selectedRangeBetweenDatesProperties,
    bool? enableDenseViewForDates,
    bool? enableDenseSplashForDates,
    DateTime? startDateOfCalendar,
    DateTime? endDateOfCalendar,
    DatePickerSelectionMode? dateSelectionMode,
    bool? disablePastDates,
    this.initialViewMonthDateTime,
    DateTime? currentDateOfCalendar,
    this.datesForStreaks,
    this.selectedDates,
    this.onSelectedDates,
    this.onCalendarViewDate,
    DatePickerCalendarView? datePickerCalendarView,
    WeekDay? startWeekday,
    Weekdays? weekdaysSymbol,
    Months? monthsSymbol,
    required this.context,
  })  : startDateOfCalendar = startDateOfCalendar ?? DateTime.utc(0000, 1, 1),
        endDateOfCalendar = endDateOfCalendar ?? DateTime.utc(9999, 1, 1),
        startWeekday = startWeekday ?? WeekDay.sunday,
        endWeekday = getWeekdayFromInt(getEndWeekdayFromStartWeekday(
            startWeekday: (startWeekday ?? WeekDay.sunday).index)),
        enableDenseViewForDates = enableDenseViewForDates ?? false,
        enableDenseSplashForDates = enableDenseSplashForDates ?? false,
        dateSelectionMode =
            dateSelectionMode ?? DatePickerSelectionMode.disable,
        disablePastDates = disablePastDates ?? false,
        currentDateOfCalendar =
            currentDateOfCalendar ?? DateUtils.dateOnly(DateTime.now()),
        datePickerCalendarView =
            datePickerCalendarView ?? DatePickerCalendarView.monthView,
        weekdaysSymbol = weekdaysSymbol ??
            const Weekdays(
                sunday: "Su",
                monday: "Mo",
                tuesday: "Tu",
                wednesday: "We",
                thursday: "Th",
                friday: "Fr",
                saturday: "Sa"),
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

  late DateTime _startDateOfCalendar;
  DateTime get startDateOfCalendar => _startDateOfCalendar;

  late DateTime _endDateOfCalendar;
  DateTime get endDateOfCalendar => _endDateOfCalendar;

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

  void initializeProperties({
    required CalendarProperties calendarProperties,
  }) {
    final ThemeData theme = Theme.of(calendarProperties.context);

    _datePickerCalendarView = calendarProperties.datePickerCalendarView;

    _weekdaysProperties = WeekdaysProperties(
      generalWeekdaysDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties.weekdaysProperties
                ?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties.weekdaysProperties
                ?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      sundayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
                .weekdaysProperties?.sundayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
                .weekdaysProperties?.sundayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      mondayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
                .weekdaysProperties?.mondayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
                .weekdaysProperties?.mondayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      tuesdayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
                .weekdaysProperties?.tuesdayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
                .weekdaysProperties?.tuesdayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      wednesdayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
                .weekdaysProperties?.wednesdayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
                .weekdaysProperties?.wednesdayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      thursdayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
                .weekdaysProperties?.thursdayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
                .weekdaysProperties?.thursdayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      fridayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
                .weekdaysProperties?.fridayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
                .weekdaysProperties?.fridayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      saturdayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
                .weekdaysProperties?.saturdayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
                .weekdaysProperties?.saturdayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
    );

    _streakDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: calendarProperties.streakDatesProperties
                  ?.datesDecoration?.datesBackgroundColor ??
              theme.colorScheme.surfaceVariant,
          datesTextColor: calendarProperties
                  .streakDatesProperties?.datesDecoration?.datesTextColor ??
              theme.colorScheme.onSurfaceVariant,
          datesTextStyle: calendarProperties
                  .streakDatesProperties?.datesDecoration?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: calendarProperties
                  .streakDatesProperties?.datesDecoration?.datesBorderColor ??
              theme.colorScheme.onSurface,
          datesBorderRadius: calendarProperties
                  .streakDatesProperties?.datesDecoration?.datesBorderRadius ??
              12),
      disable: calendarProperties.streakDatesProperties?.disable ?? false,
      hide: calendarProperties.streakDatesProperties?.hide ?? false,
    );

    _currentDateProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: calendarProperties
              .currentDateProperties?.datesDecoration?.datesBackgroundColor,
          datesTextColor: calendarProperties
              .currentDateProperties?.datesDecoration?.datesTextColor,
          datesTextStyle: calendarProperties
              .currentDateProperties?.datesDecoration?.datesTextStyle,
          datesBorderColor: calendarProperties
                  .currentDateProperties?.datesDecoration?.datesBorderColor ??
              theme.colorScheme.primary,
          datesBorderRadius: calendarProperties
                  .currentDateProperties?.datesDecoration?.datesBorderRadius ??
              12),
      disable: calendarProperties.currentDateProperties?.disable ?? false,
      hide: calendarProperties.currentDateProperties?.hide ?? false,
    );

    _generalDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: calendarProperties.generalDatesProperties
                  ?.datesDecoration?.datesBackgroundColor ??
              Colors.transparent,
          datesTextColor: calendarProperties
                  .generalDatesProperties?.datesDecoration?.datesTextColor ??
              theme.colorScheme.onSurface,
          datesTextStyle: calendarProperties
                  .generalDatesProperties?.datesDecoration?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: calendarProperties
                  .generalDatesProperties?.datesDecoration?.datesBorderColor ??
              theme.colorScheme.onSurface.withOpacity(0.5),
          datesBorderRadius: calendarProperties
                  .generalDatesProperties?.datesDecoration?.datesBorderRadius ??
              12),
      disable: calendarProperties.generalDatesProperties?.disable ?? false,
      hide: calendarProperties.generalDatesProperties?.hide ?? false,
    );

    _leadingTrailingDatesProperties = _datePickerCalendarView ==
            DatePickerCalendarView.monthView
        ? DatesProperties(
            datesDecoration: DatesDecoration(
                datesBackgroundColor: calendarProperties
                        .leadingTrailingDatesProperties
                        ?.datesDecoration
                        ?.datesBackgroundColor ??
                    theme.colorScheme.surface,
                datesTextColor: calendarProperties
                        .leadingTrailingDatesProperties
                        ?.datesDecoration
                        ?.datesTextColor ??
                    theme.disabledColor,
                datesTextStyle: calendarProperties
                        .leadingTrailingDatesProperties
                        ?.datesDecoration
                        ?.datesTextStyle ??
                    const TextStyle(),
                datesBorderColor: calendarProperties
                        .leadingTrailingDatesProperties
                        ?.datesDecoration
                        ?.datesBorderColor ??
                    theme.dividerColor,
                datesBorderRadius: calendarProperties
                        .leadingTrailingDatesProperties
                        ?.datesDecoration
                        ?.datesBorderRadius ??
                    12),
            disable:
                calendarProperties.leadingTrailingDatesProperties?.disable ??
                    false,
            hide: calendarProperties.leadingTrailingDatesProperties?.hide ??
                false,
          )
        : DatesProperties(
            datesDecoration: DatesDecoration(
                datesBackgroundColor: calendarProperties
                        .leadingTrailingDatesProperties
                        ?.datesDecoration
                        ?.datesBackgroundColor ??
                    Colors.transparent,
                datesTextColor: calendarProperties
                        .leadingTrailingDatesProperties
                        ?.datesDecoration
                        ?.datesTextColor ??
                    theme.colorScheme.onSurface,
                datesTextStyle: calendarProperties
                        .leadingTrailingDatesProperties
                        ?.datesDecoration
                        ?.datesTextStyle ??
                    const TextStyle(),
                datesBorderColor: calendarProperties
                        .leadingTrailingDatesProperties
                        ?.datesDecoration
                        ?.datesBorderColor ??
                    theme.colorScheme.onSurface.withOpacity(0.5),
                datesBorderRadius: calendarProperties
                        .leadingTrailingDatesProperties
                        ?.datesDecoration
                        ?.datesBorderRadius ??
                    12),
            disable:
                calendarProperties.leadingTrailingDatesProperties?.disable ??
                    false,
            hide: calendarProperties.leadingTrailingDatesProperties?.hide ??
                false,
          );

    _selectedDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: calendarProperties.selectedDatesProperties
                  ?.datesDecoration?.datesBackgroundColor ??
              theme.colorScheme.primary,
          datesTextColor: calendarProperties
                  .selectedDatesProperties?.datesDecoration?.datesTextColor ??
              theme.colorScheme.onPrimary,
          datesTextStyle: calendarProperties
                  .selectedDatesProperties?.datesDecoration?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: calendarProperties
                  .selectedDatesProperties?.datesDecoration?.datesBorderColor ??
              theme.colorScheme.primary,
          datesBorderRadius: calendarProperties.selectedDatesProperties
                  ?.datesDecoration?.datesBorderRadius ??
              12),
      disable: calendarProperties.selectedDatesProperties?.disable ?? false,
      hide: calendarProperties.selectedDatesProperties?.hide ?? false,
    );

    // _selectedRangeBetweenDatesProperties = DatesProperties(
    //   datesDecoration: DatesDecoration(
    //       datesBackgroundColor: calendarProperties
    //               .selectedRangeBetweenDatesProperties
    //               ?.datesDecoration
    //               ?.datesBackgroundColor ??
    //           theme.colorScheme.surfaceVariant,
    //       datesTextColor: calendarProperties.selectedRangeBetweenDatesProperties
    //               .datesDecoration?.datesTextColor ??
    //           theme.colorScheme.onSurfaceVariant,
    //       datesTextStyle: calendarProperties.selectedRangeBetweenDatesProperties
    //               .datesDecoration?.datesTextStyle ??
    //           const TextStyle(),
    //       datesBorderColor: calendarProperties
    //               .selectedRangeBetweenDatesProperties
    //               .datesDecoration
    //               ?.datesBorderColor ??
    //           Colors.transparent,
    //       datesBorderRadius: calendarProperties
    //               .selectedRangeBetweenDatesProperties
    //               .datesDecoration
    //               ?.datesBorderRadius ??
    //           12),
    //   disable: calendarProperties.selectedDatesProperties.disable ?? false,
    //   hide: calendarProperties.selectedDatesProperties.hide ?? false,
    // );

    _enableDenseViewForDates = calendarProperties.enableDenseViewForDates;
    _enableDenseSplashForDates = calendarProperties.enableDenseSplashForDates;
    _startDateOfCalendar = calendarProperties.startDateOfCalendar;
    _endDateOfCalendar = calendarProperties.endDateOfCalendar;
    _dateSelectionMode = calendarProperties.dateSelectionMode;
    _disablePastDates = calendarProperties.disablePastDates;
    _currentDateOfCalendar = calendarProperties.currentDateOfCalendar;
    _initialViewMonthDateTime =
        calendarProperties.initialViewMonthDateTime != null
            ? (_startDateOfCalendar
                    .isBefore(calendarProperties.initialViewMonthDateTime!)
                ? calendarProperties.initialViewMonthDateTime!
                : _startDateOfCalendar)
            : _startDateOfCalendar.isBefore(DateTime.utc(
                    _currentDateOfCalendar.year,
                    _currentDateOfCalendar.month,
                    _currentDateOfCalendar.day))
                ? DateTime.utc(_currentDateOfCalendar.year,
                    _currentDateOfCalendar.month, _currentDateOfCalendar.day)
                : calendarProperties.startDateOfCalendar;

    _datesForStreaks = calendarProperties.datesForStreaks != null
        ? List.generate(
            calendarProperties.datesForStreaks!.length,
            (index) => DateTime.utc(
                calendarProperties.datesForStreaks![index].year,
                calendarProperties.datesForStreaks![index].month,
                calendarProperties.datesForStreaks![index].day))
        : [];
    _selectedDates = calendarProperties.selectedDates != null
        ? List.generate(
            calendarProperties.selectedDates!.length,
            (index) => DateTime.utc(
                calendarProperties.selectedDates![index].year,
                calendarProperties.selectedDates![index].month,
                calendarProperties.selectedDates![index].day))
        : [];

    _onSelectedDates = calendarProperties.onSelectedDates ??
        (List<DateTime> selectedDates) {
          // print(selectedDates);
        };

    _onCalendarViewDate = calendarProperties.onCalendarViewDate ??
        (DateTime calendarViewDate) {
          // print(calendarViewDate);
        };

    _startWeekday = getIntFromWeekday(calendarProperties.startWeekday);

    _weekdaysSymbol = calendarProperties.weekdaysSymbol;

    _monthsSymbol = calendarProperties.monthsSymbol;
  }

  void updateProperties({
    required CalendarProperties calendarProperties,
  }) {
    final ThemeData theme = Theme.of(calendarProperties.context);

    _datePickerCalendarView = calendarProperties.datePickerCalendarView;

    _weekdaysProperties = WeekdaysProperties(
      generalWeekdaysDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties.weekdaysProperties
            ?.generalWeekdaysDecoration?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties.weekdaysProperties
            ?.generalWeekdaysDecoration?.weekdayTextStyle ??
            const TextStyle(),
      ),
      sundayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
            .weekdaysProperties?.sundayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
            .weekdaysProperties?.sundayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      mondayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
            .weekdaysProperties?.mondayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
            .weekdaysProperties?.mondayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      tuesdayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
            .weekdaysProperties?.tuesdayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
            .weekdaysProperties?.tuesdayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      wednesdayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
            .weekdaysProperties?.wednesdayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
            .weekdaysProperties?.wednesdayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      thursdayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
            .weekdaysProperties?.thursdayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
            .weekdaysProperties?.thursdayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      fridayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
            .weekdaysProperties?.fridayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
            .weekdaysProperties?.fridayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
      saturdayDecoration: WeekdaysDecoration(
        weekdayTextColor: calendarProperties
            .weekdaysProperties?.saturdayDecoration?.weekdayTextColor ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextColor ??
            theme.colorScheme.onSurface,
        weekdayTextStyle: calendarProperties
            .weekdaysProperties?.saturdayDecoration?.weekdayTextStyle ??
            calendarProperties.weekdaysProperties?.generalWeekdaysDecoration
                ?.weekdayTextStyle ??
            const TextStyle(),
      ),
    );

    _streakDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: calendarProperties.streakDatesProperties
              ?.datesDecoration?.datesBackgroundColor ??
              theme.colorScheme.surfaceVariant,
          datesTextColor: calendarProperties
              .streakDatesProperties?.datesDecoration?.datesTextColor ??
              theme.colorScheme.onSurfaceVariant,
          datesTextStyle: calendarProperties
              .streakDatesProperties?.datesDecoration?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: calendarProperties
              .streakDatesProperties?.datesDecoration?.datesBorderColor ??
              theme.colorScheme.onSurface,
          datesBorderRadius: calendarProperties
              .streakDatesProperties?.datesDecoration?.datesBorderRadius ??
              12),
      disable: calendarProperties.streakDatesProperties?.disable ?? false,
      hide: calendarProperties.streakDatesProperties?.hide ?? false,
    );

    _currentDateProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: calendarProperties
              .currentDateProperties?.datesDecoration?.datesBackgroundColor,
          datesTextColor: calendarProperties
              .currentDateProperties?.datesDecoration?.datesTextColor,
          datesTextStyle: calendarProperties
              .currentDateProperties?.datesDecoration?.datesTextStyle,
          datesBorderColor: calendarProperties
              .currentDateProperties?.datesDecoration?.datesBorderColor ??
              theme.colorScheme.primary,
          datesBorderRadius: calendarProperties
              .currentDateProperties?.datesDecoration?.datesBorderRadius ??
              12),
      disable: calendarProperties.currentDateProperties?.disable ?? false,
      hide: calendarProperties.currentDateProperties?.hide ?? false,
    );

    _generalDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: calendarProperties.generalDatesProperties
              ?.datesDecoration?.datesBackgroundColor ??
              Colors.transparent,
          datesTextColor: calendarProperties
              .generalDatesProperties?.datesDecoration?.datesTextColor ??
              theme.colorScheme.onSurface,
          datesTextStyle: calendarProperties
              .generalDatesProperties?.datesDecoration?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: calendarProperties
              .generalDatesProperties?.datesDecoration?.datesBorderColor ??
              theme.colorScheme.onSurface.withOpacity(0.5),
          datesBorderRadius: calendarProperties
              .generalDatesProperties?.datesDecoration?.datesBorderRadius ??
              12),
      disable: calendarProperties.generalDatesProperties?.disable ?? false,
      hide: calendarProperties.generalDatesProperties?.hide ?? false,
    );

    _leadingTrailingDatesProperties = _datePickerCalendarView ==
        DatePickerCalendarView.monthView
        ? DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: calendarProperties
              .leadingTrailingDatesProperties
              ?.datesDecoration
              ?.datesBackgroundColor ??
              theme.colorScheme.surface,
          datesTextColor: calendarProperties
              .leadingTrailingDatesProperties
              ?.datesDecoration
              ?.datesTextColor ??
              theme.disabledColor,
          datesTextStyle: calendarProperties
              .leadingTrailingDatesProperties
              ?.datesDecoration
              ?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: calendarProperties
              .leadingTrailingDatesProperties
              ?.datesDecoration
              ?.datesBorderColor ??
              theme.dividerColor,
          datesBorderRadius: calendarProperties
              .leadingTrailingDatesProperties
              ?.datesDecoration
              ?.datesBorderRadius ??
              12),
      disable:
      calendarProperties.leadingTrailingDatesProperties?.disable ??
          false,
      hide: calendarProperties.leadingTrailingDatesProperties?.hide ??
          false,
    )
        : DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: calendarProperties
              .leadingTrailingDatesProperties
              ?.datesDecoration
              ?.datesBackgroundColor ??
              Colors.transparent,
          datesTextColor: calendarProperties
              .leadingTrailingDatesProperties
              ?.datesDecoration
              ?.datesTextColor ??
              theme.colorScheme.onSurface,
          datesTextStyle: calendarProperties
              .leadingTrailingDatesProperties
              ?.datesDecoration
              ?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: calendarProperties
              .leadingTrailingDatesProperties
              ?.datesDecoration
              ?.datesBorderColor ??
              theme.colorScheme.onSurface.withOpacity(0.5),
          datesBorderRadius: calendarProperties
              .leadingTrailingDatesProperties
              ?.datesDecoration
              ?.datesBorderRadius ??
              12),
      disable:
      calendarProperties.leadingTrailingDatesProperties?.disable ??
          false,
      hide: calendarProperties.leadingTrailingDatesProperties?.hide ??
          false,
    );

    _selectedDatesProperties = DatesProperties(
      datesDecoration: DatesDecoration(
          datesBackgroundColor: calendarProperties.selectedDatesProperties
              ?.datesDecoration?.datesBackgroundColor ??
              theme.colorScheme.primary,
          datesTextColor: calendarProperties
              .selectedDatesProperties?.datesDecoration?.datesTextColor ??
              theme.colorScheme.onPrimary,
          datesTextStyle: calendarProperties
              .selectedDatesProperties?.datesDecoration?.datesTextStyle ??
              const TextStyle(),
          datesBorderColor: calendarProperties
              .selectedDatesProperties?.datesDecoration?.datesBorderColor ??
              theme.colorScheme.primary,
          datesBorderRadius: calendarProperties.selectedDatesProperties
              ?.datesDecoration?.datesBorderRadius ??
              12),
      disable: calendarProperties.selectedDatesProperties?.disable ?? false,
      hide: calendarProperties.selectedDatesProperties?.hide ?? false,
    );

    // _selectedRangeBetweenDatesProperties = DatesProperties(
    //   datesDecoration: DatesDecoration(
    //       datesBackgroundColor: calendarProperties
    //               .selectedRangeBetweenDatesProperties
    //               ?.datesDecoration
    //               ?.datesBackgroundColor ??
    //           theme.colorScheme.surfaceVariant,
    //       datesTextColor: calendarProperties.selectedRangeBetweenDatesProperties
    //               .datesDecoration?.datesTextColor ??
    //           theme.colorScheme.onSurfaceVariant,
    //       datesTextStyle: calendarProperties.selectedRangeBetweenDatesProperties
    //               .datesDecoration?.datesTextStyle ??
    //           const TextStyle(),
    //       datesBorderColor: calendarProperties
    //               .selectedRangeBetweenDatesProperties
    //               .datesDecoration
    //               ?.datesBorderColor ??
    //           Colors.transparent,
    //       datesBorderRadius: calendarProperties
    //               .selectedRangeBetweenDatesProperties
    //               .datesDecoration
    //               ?.datesBorderRadius ??
    //           12),
    //   disable: calendarProperties.selectedDatesProperties.disable ?? false,
    //   hide: calendarProperties.selectedDatesProperties.hide ?? false,
    // );

    _enableDenseViewForDates = calendarProperties.enableDenseViewForDates;
    _enableDenseSplashForDates = calendarProperties.enableDenseSplashForDates;
    _startDateOfCalendar = calendarProperties.startDateOfCalendar;
    _endDateOfCalendar = calendarProperties.endDateOfCalendar;
    _dateSelectionMode = calendarProperties.dateSelectionMode;
    _disablePastDates = calendarProperties.disablePastDates;
    _currentDateOfCalendar = calendarProperties.currentDateOfCalendar;
    _initialViewMonthDateTime =
    calendarProperties.initialViewMonthDateTime != null
        ? (_startDateOfCalendar
        .isBefore(calendarProperties.initialViewMonthDateTime!)
        ? calendarProperties.initialViewMonthDateTime!
        : _startDateOfCalendar)
        : _startDateOfCalendar.isBefore(DateTime.utc(
        _currentDateOfCalendar.year,
        _currentDateOfCalendar.month,
        _currentDateOfCalendar.day))
        ? DateTime.utc(_currentDateOfCalendar.year,
        _currentDateOfCalendar.month, _currentDateOfCalendar.day)
        : calendarProperties.startDateOfCalendar;

    _datesForStreaks = calendarProperties.datesForStreaks != null
        ? List.generate(
        calendarProperties.datesForStreaks!.length,
            (index) => DateTime.utc(
            calendarProperties.datesForStreaks![index].year,
            calendarProperties.datesForStreaks![index].month,
            calendarProperties.datesForStreaks![index].day))
        : [];
    _selectedDates = calendarProperties.selectedDates != null
        ? List.generate(
        calendarProperties.selectedDates!.length,
            (index) => DateTime.utc(
            calendarProperties.selectedDates![index].year,
            calendarProperties.selectedDates![index].month,
            calendarProperties.selectedDates![index].day))
        : [];

    _onSelectedDates = calendarProperties.onSelectedDates ??
            (List<DateTime> selectedDates) {
          // print(selectedDates);
        };

    _onCalendarViewDate = calendarProperties.onCalendarViewDate ??
            (DateTime calendarViewDate) {
          // print(calendarViewDate);
        };

    _startWeekday = getIntFromWeekday(calendarProperties.startWeekday);

    _weekdaysSymbol = calendarProperties.weekdaysSymbol;

    _monthsSymbol = calendarProperties.monthsSymbol;

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
