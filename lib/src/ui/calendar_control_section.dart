import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:flutter/material.dart';

class CalendarControlSection extends StatelessWidget {
  const CalendarControlSection(
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
        return Container(
          margin: const EdgeInsets.only(left: 24, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "${monthsSymbolsList[pageViewDateTime.month - 1]} ${pageViewDateTime.year}",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    DateUtils.dateOnly(calendarProperties
                                .initialViewMonthDateTime
                                .copyWith(day: 1)) !=
                            DateUtils.dateOnly(
                                pageViewDateTime.copyWith(day: 1))
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
                          pageControllerState.pageController.previousPage(
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
                          pageControllerState.pageController.nextPage(
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
