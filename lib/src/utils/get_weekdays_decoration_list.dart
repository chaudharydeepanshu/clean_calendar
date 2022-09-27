import 'package:clean_calendar/clean_calendar.dart';

List<WeekdaysDecoration?> getWeekdaysDecorationListBasedOnStartWeekday(
    {required int startWeekday,
    required WeekdaysProperties weekdaysProperties}) {
  List<WeekdaysDecoration?> listOfWeekDaysDecoration = [
    weekdaysProperties.mondayDecoration,
    weekdaysProperties.tuesdayDecoration,
    weekdaysProperties.wednesdayDecoration,
    weekdaysProperties.thursdayDecoration,
    weekdaysProperties.fridayDecoration,
    weekdaysProperties.saturdayDecoration,
    weekdaysProperties.sundayDecoration,
  ];

  List<WeekdaysDecoration?> newListOfWeekDaysDecoration = [];
  for (int i = 0; i < 7; i++) {
    if (!(startWeekday - 1 + i > 6)) {
      newListOfWeekDaysDecoration
          .add(listOfWeekDaysDecoration[startWeekday - 1 + i]);
    }
  }
  for (int i = 0; newListOfWeekDaysDecoration.length < 7; i++) {
    newListOfWeekDaysDecoration.add(listOfWeekDaysDecoration[i]);
  }
  return newListOfWeekDaysDecoration;
}
