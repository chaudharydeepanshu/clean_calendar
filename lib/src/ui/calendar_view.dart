import 'package:clean_calendar/clean_calendar.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/state/providers.dart';
import 'package:clean_calendar/src/utils/get_suitable_calendar_view_grid_view_builder_widget.dart';
import 'package:clean_calendar/src/utils/get_suitable_grid_view_builder_widget.dart';
import 'package:clean_calendar/src/utils/get_suitable_page_view_builder_widget.dart';
import 'package:clean_calendar/src/utils.dart';
import 'package:clean_calendar/src/utils/get_weekdays_decoration_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/get_weekdays_list.dart';

class Calendar extends ConsumerStatefulWidget {
  const Calendar({
    Key? key,
    this.datePickerCalendarView,
    this.weekdaysProperties,
    this.streakDatesProperties,
    this.currentDateProperties,
    this.generalDatesProperties,
    this.leadingTrailingDatesProperties,
    this.selectedDatesProperties,
    this.selectedRangeBetweenDatesProperties,
    this.enableDenseViewForDates,
    this.enableDenseSplashForDates,
    this.startDateOfCalendar,
    this.endDateOfCalendar,
    this.dateSelectionMode,
    this.disablePastDates,
    this.initialViewMonthDateTime,
    this.currentDateOfCalendar,
    this.datesForStreaks,
    this.selectedDates,
    this.onSelectedDates,
    this.onCalendarViewDate,
    this.startWeekday,
    this.weekdaysSymbol,
    this.monthsSymbol,
    required this.context,
  }) : super(key: key);

  final DatePickerCalendarView? datePickerCalendarView;

  final WeekdaysProperties? weekdaysProperties;

  final DatesProperties? streakDatesProperties;
  final DatesProperties? currentDateProperties;
  final DatesProperties? generalDatesProperties;
  final DatesProperties? leadingTrailingDatesProperties;
  final DatesProperties? selectedDatesProperties;
  final DatesProperties? selectedRangeBetweenDatesProperties;

  final bool? enableDenseViewForDates;
  final bool? enableDenseSplashForDates;

  final DateTime? startDateOfCalendar;
  final DateTime? endDateOfCalendar;

  final DatePickerSelectionMode? dateSelectionMode;

  final bool? disablePastDates;

  final DateTime? initialViewMonthDateTime;
  final DateTime? currentDateOfCalendar;

  final List<DateTime>? datesForStreaks;

  final List<DateTime>? selectedDates;

  final ValueChanged<List<DateTime>>? onSelectedDates;
  final ValueChanged<DateTime>? onCalendarViewDate;

  final WeekDay? startWeekday;

  final Weekdays? weekdaysSymbol;

  final Months? monthsSymbol;

  final BuildContext context;

  @override
  ConsumerState<Calendar> createState() => _CalendarState();
}

class _CalendarState extends ConsumerState<Calendar> {
  @override
  void initState() {
    final CalendarPropertiesState readCalendarPropertiesStateProviderValue =
        ref.read(calendarPropertiesStateProvider);
    readCalendarPropertiesStateProviderValue.initializeProperties(
      datePickerCalendarView: widget.datePickerCalendarView,
      weekdaysProperties: widget.weekdaysProperties,
      streakDatesProperties: widget.streakDatesProperties,
      currentDateProperties: widget.currentDateProperties,
      generalDatesProperties: widget.generalDatesProperties,
      leadingTrailingDatesProperties: widget.leadingTrailingDatesProperties,
      selectedDatesProperties: widget.selectedDatesProperties,
      selectedRangeBetweenDatesProperties:
          widget.selectedRangeBetweenDatesProperties,
      enableDenseViewForDates: widget.enableDenseViewForDates,
      enableDenseSplashForDates: widget.enableDenseSplashForDates,
      startDateOfCalendar: widget.startDateOfCalendar,
      endDateOfCalendar: widget.endDateOfCalendar,
      dateSelectionMode: widget.dateSelectionMode,
      disablePastDates: widget.disablePastDates,
      initialViewMonthDateTime: widget.initialViewMonthDateTime,
      currentDateOfCalendar: widget.currentDateOfCalendar,
      datesForStreaks: widget.datesForStreaks,
      selectedDates: widget.selectedDates,
      onSelectedDates: widget.onSelectedDates,
      onCalendarViewDate: widget.onCalendarViewDate,
      startWeekday: widget.startWeekday,
      weekdaysSymbol: widget.weekdaysSymbol,
      monthsSymbol: widget.monthsSymbol,
      context: widget.context,
    );
    // final PageControllerState readPageControllerStateProviderValue =
    //     ref.read(pageControllerStateProvider);
    // readPageControllerStateProviderValue.initializePageViewVars();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Calendar oldWidget) {
    if (oldWidget != widget) {
      final CalendarPropertiesState readCalendarPropertiesStateProviderValue =
          ref.read(calendarPropertiesStateProvider);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        readCalendarPropertiesStateProviderValue.updateProperties(
          datePickerCalendarView: widget.datePickerCalendarView,
          weekdaysProperties: widget.weekdaysProperties,
          streakDatesProperties: widget.streakDatesProperties,
          currentDateProperties: widget.currentDateProperties,
          generalDatesProperties: widget.generalDatesProperties,
          leadingTrailingDatesProperties: widget.leadingTrailingDatesProperties,
          selectedDatesProperties: widget.selectedDatesProperties,
          selectedRangeBetweenDatesProperties:
              widget.selectedRangeBetweenDatesProperties,
          enableDenseViewForDates: widget.enableDenseViewForDates,
          enableDenseSplashForDates: widget.enableDenseSplashForDates,
          startDateOfCalendar: widget.startDateOfCalendar,
          endDateOfCalendar: widget.endDateOfCalendar,
          dateSelectionMode: widget.dateSelectionMode,
          disablePastDates: widget.disablePastDates,
          initialViewMonthDateTime: widget.initialViewMonthDateTime,
          currentDateOfCalendar: widget.currentDateOfCalendar,
          datesForStreaks: widget.datesForStreaks,
          selectedDates: widget.selectedDates,
          onSelectedDates: widget.onSelectedDates,
          onCalendarViewDate: widget.onCalendarViewDate,
          startWeekday: widget.startWeekday,
          weekdaysSymbol: widget.weekdaysSymbol,
          monthsSymbol: widget.monthsSymbol,
          context: widget.context,
        );

        // final PageControllerState readPageControllerStateProviderValue =
        //     ref.read(pageControllerStateProvider);
        // readPageControllerStateProviderValue.updatePageViewVars();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return const CalendarView();
  }
}

class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CalendarControlSection(),
        CalendarHeaderSection(),
        CalendarDatesPageView(),
      ],
    );
  }
}

class CalendarDatesPageView extends StatelessWidget {
  const CalendarDatesPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatePickerSelectionMode dateSelectionMode = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.dateSelectionMode));

        return GetSuitablePageViewBuilderWidget(
            dateSelectionMode: dateSelectionMode);
      },
    );
  }
}

class CalendarDatesSection extends ConsumerStatefulWidget {
  const CalendarDatesSection({Key? key, required this.pageViewDate})
      : super(key: key);

  final DateTime pageViewDate;

  @override
  ConsumerState<CalendarDatesSection> createState() =>
      _CalendarDatesSectionState();
}

class _CalendarDatesSectionState extends ConsumerState<CalendarDatesSection> {
  late List<DateTime> pageViewElementsDates;
  late DateTime pageViewDate;

  @override
  void initState() {
    pageViewDate = widget.pageViewDate;

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CalendarDatesSection oldWidget) {
    if (oldWidget.pageViewDate != widget.pageViewDate) {
      setState(() {
        pageViewDate = widget.pageViewDate;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatePickerCalendarView datePickerCalendarView = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.datePickerCalendarView));

        final int startWeekDay = ref.watch(calendarPropertiesStateProvider
            .select((value) => value.startWeekday));
        return GetSuitableCalendarViewGridViewBuilderWidget(
          pageViewDate: pageViewDate,
          datePickerCalendarView: datePickerCalendarView,
          startWeekday: startWeekDay,
        );
      },
    );
  }
}

class WeekViewCalendarDatesSection extends StatelessWidget {
  const WeekViewCalendarDatesSection(
      {Key? key, required this.pageViewDate, required this.startWeekday})
      : super(key: key);

  final DateTime pageViewDate;
  final int startWeekday;

  @override
  Widget build(BuildContext context) {
    final List<DateTime> pageViewElementsDates = getDatesForACalendarWeekAsUTC(
        dateTime: pageViewDate, startWeekday: startWeekday);

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatePickerSelectionMode dateSelectionMode = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.dateSelectionMode));
        return GetSuitableWeekViewGridViewBuilderWidget(
            pageViewDate: pageViewDate,
            pageViewElementsDates: pageViewElementsDates,
            dateSelectionMode: dateSelectionMode);
      },
    );
  }
}

class MonthViewCalendarDatesSection extends StatelessWidget {
  const MonthViewCalendarDatesSection(
      {Key? key, required this.pageViewDate, required this.startWeekday})
      : super(key: key);

  final DateTime pageViewDate;
  final int startWeekday;

  @override
  Widget build(BuildContext context) {
    final List<DateTime> pageViewElementsDates = getDatesForACalendarMonthAsUTC(
        dateTime: pageViewDate, startWeekday: startWeekday);

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final DatePickerSelectionMode dateSelectionMode = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.dateSelectionMode));
        return GetSuitableMonthViewGridViewBuilderWidget(
            pageViewMonthDate: pageViewDate,
            pageViewElementsDates: pageViewElementsDates,
            dateSelectionMode: dateSelectionMode);
      },
    );
  }
}

class CalendarHeaderSection extends StatelessWidget {
  const CalendarHeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final int startWeekday = ref.watch(calendarPropertiesStateProvider
            .select((value) => value.startWeekday));

        final Weekdays weekdaysSymbol = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.weekdaysSymbol));

        List<String> weekdaysSymbolListBasedOnStartWeekday =
            getWeekdaysListBasedOnStartWeekday(
                startWeekday: startWeekday, weekdaysSymbol: weekdaysSymbol);

        final WeekdaysProperties weekdaysProperties = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.weekdaysProperties));

        List<WeekdaysDecoration?> weekdaysDecorationListBasedOnStartWeekday =
            getWeekdaysDecorationListBasedOnStartWeekday(
                startWeekday: startWeekday,
                weekdaysProperties: weekdaysProperties);

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 7,
            mainAxisExtent: 40,
          ),
          itemCount: weekdaysSymbolListBasedOnStartWeekday.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => CalendarWeekdaySymbol(
            symbol: weekdaysSymbolListBasedOnStartWeekday[index],
            weekdayDecoration: weekdaysDecorationListBasedOnStartWeekday[index],
          ),
        );
      },
    );
  }
}

class CalendarWeekdaySymbol extends StatelessWidget {
  const CalendarWeekdaySymbol(
      {Key? key, required this.symbol, required this.weekdayDecoration})
      : super(key: key);

  final String symbol;

  final WeekdaysDecoration? weekdayDecoration;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        symbol.toString(),
        style: weekdayDecoration?.weekdayTextStyle
                ?.copyWith(color: weekdayDecoration?.weekdayTextColor) ??
            const TextStyle()
                .copyWith(color: weekdayDecoration?.weekdayTextColor),
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class CalendarControlSection extends StatelessWidget {
  const CalendarControlSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final DateTime pageViewDateTime = ref.watch(
                    pageControllerStateProvider
                        .select((value) => value.pageViewDateTime));
                final Months monthsSymbol = ref.watch(
                    calendarPropertiesStateProvider
                        .select((value) => value.monthsSymbol));

                List<String> listOfMonthsSymbol = [
                  monthsSymbol.january,
                  monthsSymbol.february,
                  monthsSymbol.march,
                  monthsSymbol.april,
                  monthsSymbol.may,
                  monthsSymbol.june,
                  monthsSymbol.july,
                  monthsSymbol.august,
                  monthsSymbol.september,
                  monthsSymbol.october,
                  monthsSymbol.november,
                  monthsSymbol.december,
                ];

                return Text(
                  "${listOfMonthsSymbol[pageViewDateTime.month - 1]} ${pageViewDateTime.year}",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,
                );
              },
            ),
          ),
          Flexible(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final PageControllerState readPageControllerStateProviderValue =
                    ref.watch(pageControllerStateProvider);
                final PageController pageController =
                    readPageControllerStateProviderValue.pageController;

                final bool isPageViewInitialView = ref.watch(
                    isPageViewInitialViewProvider.select((value) => value));

                return Row(
                  children: [
                    !isPageViewInitialView
                        ? Expanded(
                            child: IconButton(
                              onPressed: () {
                                final PageControllerState
                                    readPageControllerStateProviderValue =
                                    ref.read(pageControllerStateProvider);
                                pageController.animateToPage(
                                    readPageControllerStateProviderValue
                                        .initialIndex,
                                    duration: kTabScrollDuration,
                                    curve: Curves.ease);
                              },
                              padding: EdgeInsets.zero,
                              // iconSize: 12,
                              icon: const Icon(
                                Icons.calendar_today,
                              ),
                            ),
                          )
                        : const Expanded(child: SizedBox()),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          pageController.previousPage(
                              duration: kTabScrollDuration, curve: Curves.ease);
                        },
                        padding: EdgeInsets.zero,
                        iconSize: 12,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          pageController.nextPage(
                              duration: kTabScrollDuration, curve: Curves.ease);
                        },
                        padding: EdgeInsets.zero,
                        iconSize: 12,
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
