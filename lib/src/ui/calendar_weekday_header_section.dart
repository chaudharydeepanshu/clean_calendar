import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/models/weekdays_decoration.dart';
import 'package:clean_calendar/src/utils/get_weekdays_symbols_and_properties_based_on_starting_weekday.dart';
import 'package:flutter/material.dart';

class CalendarWeekdayHeaderSection extends StatelessWidget {
  const CalendarWeekdayHeaderSection(
      {Key? key, required this.calendarProperties})
      : super(key: key);

  final CalendarProperties calendarProperties;

  @override
  Widget build(BuildContext context) {
    List<String> weekdaysSymbolsList =
        getWeekdaysSymbolsListBasedOnStartingWeekday(
            startWeekday: calendarProperties.startWeekday,
            weekdaysSymbol: calendarProperties.weekdaysSymbol);
    List<WeekdaysDecoration> weekdaysDecorationsList =
        getWeekdaysDecorationListBasedOnStartingWeekday(
            startWeekday: calendarProperties.startWeekday,
            weekdaysProperties: calendarProperties.weekdaysProperties);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 7,
        mainAxisExtent: 40,
      ),
      itemCount: calendarProperties.weekdaysSymbol.toMap().length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => CalendarWeekdaySymbol(
        symbol: weekdaysSymbolsList[index],
        weekdayDecoration: weekdaysDecorationsList[index],
      ),
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
