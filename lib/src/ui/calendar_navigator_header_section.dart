import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:flutter/material.dart';

class CalendarNavigatorHeaderSection extends StatelessWidget {
  const CalendarNavigatorHeaderSection(
      {Key? key,
      required this.calendarProperties,
      required this.pageControllerState})
      : super(key: key);

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageControllerState,
      builder: (BuildContext context, Widget? child) {
        final DateTime pageViewDateTime = pageControllerState.pageViewDateTime;
        final List<String> monthsSymbolsList = [];
        calendarProperties.monthsSymbol.toMap().forEach((key, value) {
          monthsSymbolsList.add(value);
        });

        bool shouldShowResetButton = calendarProperties
                    .datePickerCalendarView ==
                DatePickerCalendarView.weekView
            ? DateUtils.dateOnly(calendarProperties.initialViewMonthDateTime) !=
                DateUtils.dateOnly(pageViewDateTime)
            : DateUtils.dateOnly(calendarProperties.initialViewMonthDateTime
                    .copyWith(day: 1)) !=
                DateUtils.dateOnly(pageViewDateTime.copyWith(day: 1));

        Icon navigatorResetButtonIcon = calendarProperties.headerProperties
                .navigatorDecoration?.navigatorResetButtonIcon ??
            const Icon(
              Icons.calendar_today,
            );

        Icon navigateLeftButtonIcon = calendarProperties
                .headerProperties.navigatorDecoration?.navigateLeftButtonIcon ??
            const Icon(
              Icons.arrow_back_ios,
              size: 12,
            );

        Icon navigateRightButtonIcon = calendarProperties.headerProperties
                .navigatorDecoration?.navigateRightButtonIcon ??
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            );

        Color? monthYearTextColor = calendarProperties
            .headerProperties.monthYearDecoration?.monthYearTextColor;

        TextStyle? monthYearTextStyle = calendarProperties
                .headerProperties.monthYearDecoration?.monthYearTextStyle ??
            Theme.of(context).textTheme.titleSmall;

        return Container(
          margin: const EdgeInsets.only(left: 24, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "${monthsSymbolsList[pageViewDateTime.month - 1]} ${pageViewDateTime.year}",
                  overflow: TextOverflow.ellipsis,
                  style: monthYearTextColor != null
                      ? monthYearTextStyle?.copyWith(color: monthYearTextColor)
                      : monthYearTextStyle,
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    shouldShowResetButton
                        ? Expanded(
                            child: IconButton(
                              onPressed: () {
                                pageControllerState.pageController
                                    .animateToPage(
                                        pageControllerState.initialIndex,
                                        duration: kTabScrollDuration,
                                        curve: Curves.ease);
                              },
                              padding: EdgeInsets.zero,
                              icon: navigatorResetButtonIcon,
                            ),
                          )
                        : const Expanded(child: SizedBox()),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          pageControllerState.pageController.previousPage(
                              duration: kTabScrollDuration, curve: Curves.ease);
                        },
                        padding: EdgeInsets.zero,
                        icon: navigateLeftButtonIcon,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          pageControllerState.pageController.nextPage(
                              duration: kTabScrollDuration, curve: Curves.ease);
                        },
                        padding: EdgeInsets.zero,
                        icon: navigateRightButtonIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
