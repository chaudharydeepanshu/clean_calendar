import 'package:clean_calendar/src/models/weekdays_model.dart';

List<String> getWeekdaysListBasedOnStartWeekday(
    {required int startWeekday, required Weekdays weekdaysSymbol}) {
  List<String> listOfWeekDaysSymbol = [
    weekdaysSymbol.monday,
    weekdaysSymbol.tuesday,
    weekdaysSymbol.wednesday,
    weekdaysSymbol.thursday,
    weekdaysSymbol.friday,
    weekdaysSymbol.saturday,
    weekdaysSymbol.sunday,
  ];

  List<String> newListOfWeekDaysSymbol = [];
  for (int i = 0; i < 7; i++) {
    if (!(startWeekday - 1 + i > 6)) {
      newListOfWeekDaysSymbol.add(listOfWeekDaysSymbol[startWeekday - 1 + i]);
    }
  }
  for (int i = 0; newListOfWeekDaysSymbol.length < 7; i++) {
    newListOfWeekDaysSymbol.add(listOfWeekDaysSymbol[i]);
  }
  return newListOfWeekDaysSymbol;
}
