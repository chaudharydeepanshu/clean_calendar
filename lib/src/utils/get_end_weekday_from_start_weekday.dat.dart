import 'package:clean_calendar/src/models/calendar_properties.dart';

int getEndWeekdayFromStartWeekday({required int startWeekday}) {
  final int endWeekday;
  int temp = startWeekday;
  for (int i = 2; i <= 7; i++) {
    temp = temp + 1;
    if (temp == 7 && i != 7) {
      temp = 0;
    }
  }
  endWeekday = temp;
  return endWeekday;
}

WeekDay getWeekdayFromInt(int weekDayInt) {
  if (weekDayInt == 1) {
    return WeekDay.monday;
  } else if (weekDayInt == 2) {
    return WeekDay.tuesday;
  } else if (weekDayInt == 3) {
    return WeekDay.wednesday;
  } else if (weekDayInt == 4) {
    return WeekDay.thursday;
  } else if (weekDayInt == 5) {
    return WeekDay.friday;
  } else if (weekDayInt == 6) {
    return WeekDay.saturday;
  } else {
    return WeekDay.sunday;
  }
}

int getIntFromWeekday(WeekDay weekday) {
  if (weekday == WeekDay.monday) {
    return 1;
  } else if (weekday == WeekDay.tuesday) {
    return 2;
  } else if (weekday == WeekDay.wednesday) {
    return 3;
  } else if (weekday == WeekDay.thursday) {
    return 4;
  } else if (weekday == WeekDay.friday) {
    return 5;
  } else if (weekday == WeekDay.saturday) {
    return 6;
  } else {
    return 7;
  }
}
