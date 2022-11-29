import 'package:clean_calendar/clean_calendar.dart';
import 'package:clean_calendar/src/utils/get_end_weekday_from_start_weekday.dat.dart';

List<String> getWeekdaysSymbolsListBasedOnStartingWeekday(
    {required WeekDay startWeekday, required Weekdays weekdaysSymbol}) {
  List<String> weekdaysSymbolList = [];
  weekdaysSymbol.toMap().forEach((key, value) => weekdaysSymbolList.add(value));

  List<String> updatedWeekdaysSymbolList = [];

  int startWeekDayIndex = getIntFromWeekday(startWeekday) - 1;
  if (startWeekDayIndex != 0) {
    List<String> startWeekdayBeforeWeekdaysSymbolList =
        weekdaysSymbolList.getRange(0, startWeekDayIndex).toList();

    weekdaysSymbolList.removeRange(0, startWeekDayIndex);

    weekdaysSymbolList.addAll(startWeekdayBeforeWeekdaysSymbolList);
  }
  updatedWeekdaysSymbolList = weekdaysSymbolList;

  return updatedWeekdaysSymbolList;
}

List<WeekdaysDecoration> getWeekdaysDecorationListBasedOnStartingWeekday(
    {required WeekDay startWeekday,
    required WeekdaysProperties weekdaysProperties}) {
  List<WeekdaysDecoration> weekdaysPropertiesList = [];
  weekdaysProperties
      .toMap()
      .forEach((key, value) => weekdaysPropertiesList.add(value));
  // Removing generalWeekdaysDecoration as not required.
  weekdaysPropertiesList.removeAt(0);

  List<WeekdaysDecoration> updatedWeekdaysPropertiesList = [];

  int startWeekDayIndex = getIntFromWeekday(startWeekday) - 1;
  if (startWeekDayIndex != 0) {
    List<WeekdaysDecoration> startWeekdayBeforeWeekdaysSymbolList =
        weekdaysPropertiesList.getRange(0, startWeekDayIndex).toList();

    weekdaysPropertiesList.removeRange(0, startWeekDayIndex);

    weekdaysPropertiesList.addAll(startWeekdayBeforeWeekdaysSymbolList);
  }

  updatedWeekdaysPropertiesList = weekdaysPropertiesList;

  return updatedWeekdaysPropertiesList;
}
