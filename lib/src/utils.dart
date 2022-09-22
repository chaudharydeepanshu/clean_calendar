DateTime getLastDayOfAMonth({required DateTime currentDateTime}) {
  // Getting the 15th-day date of the month for the date provided
  DateTime fifteenthDayOfMonth =
      DateTime(currentDateTime.year, currentDateTime.month, 15);

  // Converting the 15th-day date to UTC
  // So that all things like DST don't affect subtraction and addition on date
  DateTime twentiethDayOfMonthInUTC = fifteenthDayOfMonth.toUtc();

  // Getting a random date of next month by adding 20 days to twentiethDayOfMonthInUTC
  // Adding number 20 to any month 15th-day will definitely give a next month date
  DateTime nextMonthRandomDateInUTC =
      twentiethDayOfMonthInUTC.add(const Duration(days: 20));

  DateTime nextMonthRandomDateZeroDayInUTC = DateTime.utc(
      nextMonthRandomDateInUTC.year, nextMonthRandomDateInUTC.month, 0);

  // Now getting the 0th day date of the next month
  // This will give us the current month last date
  DateTime nextMonthRandomDateZeroDayInLocal = DateTime(
      nextMonthRandomDateInUTC.year, nextMonthRandomDateInUTC.month, 0);

  DateTime lastDayOfAMonth;
  if (currentDateTime.isUtc) {
    lastDayOfAMonth = nextMonthRandomDateZeroDayInUTC;
  } else {
    lastDayOfAMonth = nextMonthRandomDateZeroDayInLocal;
  }

  return lastDayOfAMonth;
}

List<DateTime> getDaysInBetweenIncludingStartEndDate(
    {required DateTime startDateTime, required DateTime endDateTime}) {
  // Converting dates provided to UTC
  // So that all things like DST don't affect subtraction and addition on dates
  DateTime startDateInUTC =
      DateTime.utc(startDateTime.year, startDateTime.month, startDateTime.day);
  DateTime endDateInUTC =
      DateTime.utc(endDateTime.year, endDateTime.month, endDateTime.day);

  // Created a list to hold all dates
  List<DateTime> daysInFormat = [];

  // Starting a loop with the initial value as the Start Date
  // With an increment of 1 day on each loop
  // With condition current value of loop is smaller than or same as end date
  for (DateTime i = startDateInUTC;
      i.isBefore(endDateInUTC) || i.isAtSameMomentAs(endDateInUTC);
      i = i.add(const Duration(days: 1))) {
    // Converting back UTC date to Local date before inserting in list
    // You can keep in UTC format depending on your case

    if (startDateTime.isUtc) {
      daysInFormat.add(i);
    } else {
      daysInFormat.add(DateTime(i.year, i.month, i.day));
    }
  }
  return daysInFormat;
}

List<DateTime> getDatesForACalendarMonthAsUTC(
    {required DateTime dateTime, required int startWeekday}) {
  List<DateTime> calendarMonthDaysAsUTC = [];

  DateTime currentDateTime = DateTime.utc(dateTime.year, dateTime.month, 1);

  DateTime firstDayOfMonthAsUTC =
      DateTime.utc(currentDateTime.year, currentDateTime.month, 1);
  DateTime lastDayOfMonthAsUTC =
      DateTime.utc(currentDateTime.year, currentDateTime.month + 1, 0);

  List<DateTime> datesFirstToLastDayOfMonthAsUTC =
      getDaysInBetweenIncludingStartEndDate(
          startDateTime: firstDayOfMonthAsUTC,
          endDateTime: lastDayOfMonthAsUTC);

  calendarMonthDaysAsUTC = List.from(datesFirstToLastDayOfMonthAsUTC);

  int firstDayOfMonthWeekDay = firstDayOfMonthAsUTC.weekday;

  int diffBetweenWeekdays = firstDayOfMonthWeekDay - startWeekday;

  int daysLeftBeforeMonthStartDate = diffBetweenWeekdays > 0
      ? diffBetweenWeekdays
      : diffBetweenWeekdays < 0
          ? 7 + diffBetweenWeekdays
          : 0;

  for (int i = 1;
      i <= daysLeftBeforeMonthStartDate &&
          firstDayOfMonthWeekDay != startWeekday;
      i++) {
    calendarMonthDaysAsUTC.insert(
        0, firstDayOfMonthAsUTC.subtract(Duration(days: i)));
  }

  int daysLeftAfterMonthEndDate = 42 - calendarMonthDaysAsUTC.length;

  for (int i = 1; i <= daysLeftAfterMonthEndDate; i++) {
    calendarMonthDaysAsUTC.add(lastDayOfMonthAsUTC.add(Duration(days: i)));
  }

  return calendarMonthDaysAsUTC;
}

// List<DateTime> getDatesForACalendarMonthAsUTC({required DateTime dateTime}) {
//   List<DateTime> calendarMonthDaysAsUTC = [];
//
//   DateTime currentDateTime = DateTime.utc(dateTime.year, dateTime.month, 1);
//
//   DateTime firstDayOfMonthAsUTC =
//       DateTime.utc(currentDateTime.year, currentDateTime.month, 1);
//   DateTime lastDayOfMonthAsUTC =
//       DateTime.utc(currentDateTime.year, currentDateTime.month + 1, 0);
//
//   List<DateTime> datesFirstToLastDayOfMonthAsUTC =
//       getDaysInBetweenIncludingStartEndDate(
//           startDateTime: firstDayOfMonthAsUTC,
//           endDateTime: lastDayOfMonthAsUTC);
//
//   calendarMonthDaysAsUTC = List.from(datesFirstToLastDayOfMonthAsUTC);
//
//   int firstDayOfMonthWeekDay = firstDayOfMonthAsUTC.weekday;
//
//   for (int i = 1;
//       i <= firstDayOfMonthWeekDay && firstDayOfMonthWeekDay != 7;
//       i++) {
//     calendarMonthDaysAsUTC.insert(
//         0, firstDayOfMonthAsUTC.subtract(Duration(days: i)));
//   }
//
//   int daysLeftAfterMonthEndDate = 42 - calendarMonthDaysAsUTC.length;
//
//   for (int i = 1; i <= daysLeftAfterMonthEndDate; i++) {
//     calendarMonthDaysAsUTC.add(lastDayOfMonthAsUTC.add(Duration(days: i)));
//   }
//
//   return calendarMonthDaysAsUTC;
// }

List<DateTime> getDatesForACalendarWeekAsUTC(
    {required DateTime dateTime, required int startWeekday}) {
  List<DateTime> calendarWeekDaysAsUTC = [];

  DateTime currentDateTime =
      DateTime.utc(dateTime.year, dateTime.month, dateTime.day);

  int currentDateTimeWeekday = currentDateTime.weekday;

  int diffBetweenWeekdays = currentDateTimeWeekday - startWeekday;

  int daysBeforeCurrentDateTime = diffBetweenWeekdays > 0
      ? diffBetweenWeekdays
      : diffBetweenWeekdays < 0
          ? 7 + diffBetweenWeekdays
          : 0;

  DateTime firstDayOfWeekAsUTC =
      currentDateTime.subtract(Duration(days: daysBeforeCurrentDateTime));

  DateTime lastDayOfWeekAsUTC = currentDateTime.add(const Duration(days: 7));

  calendarWeekDaysAsUTC = getDaysInBetweenIncludingStartEndDate(
      startDateTime: firstDayOfWeekAsUTC, endDateTime: lastDayOfWeekAsUTC);

  return calendarWeekDaysAsUTC;
}

// List<DateTime> getDatesForACalendarWeekAsUTC({required DateTime dateTime}) {
//   List<DateTime> calendarWeekDaysAsUTC = [];
//
//   DateTime currentDateTime =
//       DateTime.utc(dateTime.year, dateTime.month, dateTime.day);
//
//   DateTime firstDayOfWeekAsUTC =
//       getFirstDayOfWeek(currentDateTime: currentDateTime);
//   DateTime lastDayOfWeekAsUTC =
//       getLastDayOfWeek(currentDateTime: currentDateTime);
//
//   calendarWeekDaysAsUTC = getDaysInBetweenIncludingStartEndDate(
//       startDateTime: firstDayOfWeekAsUTC, endDateTime: lastDayOfWeekAsUTC);
//
//   return calendarWeekDaysAsUTC;
// }

int calculateMonthsFromYear0000(DateTime dateTime) {
  /// Each year has 12 months and total years from 0000 are dateTime.year.
  /// Now to calculate months multiply 12 with total years and add the months of the dateTime on top of that.
  return dateTime.year * 12 + dateTime.month;
}

int getMonthsCountBetweenDatesIncludingEndMonth(
    {required DateTime startDate, required DateTime endDate}) {
  DateTime newStartDateTime = DateTime.utc(startDate.year, startDate.month, 1);

  DateTime newEndDateTime = DateTime.utc(endDate.year, endDate.month, 1);

  int differenceInMonthsIncludingStartAndEnd =
      calculateMonthsFromYear0000(newEndDateTime) -
          calculateMonthsFromYear0000(newStartDateTime) +
          1;

  return differenceInMonthsIncludingStartAndEnd;
}

int getMonthsCountBetweenDatesExcludingEndMonth(
    {required DateTime startDate, required DateTime endDate}) {
  DateTime newStartDateTime = DateTime.utc(startDate.year, startDate.month, 1);

  DateTime newEndDateTime = DateTime.utc(endDate.year, endDate.month, 1);

  int differenceInMonthsIncludingStartAndEnd =
      calculateMonthsFromYear0000(newEndDateTime) -
          calculateMonthsFromYear0000(newStartDateTime);

  return differenceInMonthsIncludingStartAndEnd;
}

DateTime getFirstDayOfWeek({required DateTime currentDateTime}) {
  // Converting date provided to UTC
  // So that all things like DST don't affect subtraction and addition on date
  DateTime dateTimeInUTC = DateTime.utc(
      currentDateTime.year, currentDateTime.month, currentDateTime.day);

  // Getting weekday for the date
  // For reference Sunday weekday is 7 and Friday weekday is 5
  int currentWeekDayInUTC = dateTimeInUTC.weekday;

  // Getting Date for nearest Sunday from the provided date
  // By going back a number of weekdays from the current date to reach Sunday
  DateTime firstDayOfWeekInUTC;
  // If current date is not Sunday subtract days to reach Sunday
  if (currentWeekDayInUTC != DateTime.sunday) {
    firstDayOfWeekInUTC =
        dateTimeInUTC.subtract(Duration(days: currentWeekDayInUTC));
  }
  // If current date is Sunday use it as the first day of week
  else {
    firstDayOfWeekInUTC = dateTimeInUTC;
  }

  // Converting back the date for Sunday from UTC type to Local
  // You can also use UTC type depending on your use case
  DateTime firstDayOfWeekInLocal = DateTime(firstDayOfWeekInUTC.year,
      firstDayOfWeekInUTC.month, firstDayOfWeekInUTC.day);

  if (currentDateTime.isUtc) {
    return firstDayOfWeekInUTC;
  } else {
    return firstDayOfWeekInLocal;
  }
}

DateTime getLastDayOfWeek({required DateTime currentDateTime}) {
  // Converting date provided to UTC
  // So that all things like DST don't affect subtraction and addition on date
  DateTime dateTimeInUTC = DateTime.utc(
      currentDateTime.year, currentDateTime.month, currentDateTime.day);

  // Getting weekday for the date
  // For reference Sunday weekday is 0 and Friday weekday is 5
  int currentWeekDayInUTC = dateTimeInUTC.weekday;

  // Getting Date for nearest Saturday from the provided date
  // By going forward a number of weekdays from the current date to reach Saturday
  DateTime lastDayOfWeekInUTC;
  // If current date is not Sunday add days enough to reach Saturday
  if (currentWeekDayInUTC != DateTime.sunday) {
    lastDayOfWeekInUTC = dateTimeInUTC
        .add(Duration(days: DateTime.saturday - currentWeekDayInUTC));
  }
  // If current date is Sunday add days UpTo saturday
  else {
    lastDayOfWeekInUTC =
        dateTimeInUTC.add(const Duration(days: DateTime.saturday));
  }

  // Converting back the date for Sunday from UTC type to Local
  // You can also use UTC type depending on your use case
  DateTime lastDayOfWeekInLocal = DateTime(lastDayOfWeekInUTC.year,
      lastDayOfWeekInUTC.month, lastDayOfWeekInUTC.day);

  if (currentDateTime.isUtc) {
    return lastDayOfWeekInUTC;
  } else {
    return lastDayOfWeekInLocal;
  }
}

int getWeeks({required DateTime start, required DateTime end}) {
  start = getFirstDayOfWeek(currentDateTime: start);
  end = getFirstDayOfWeek(currentDateTime: end);
  int days = differenceInCalendarDays(start: start, end: end);
  int noOfWeeks;
  if (days < 7) {
    noOfWeeks = 1;
  } else {
    noOfWeeks = (days / 7).floor() + 1; // Adding 1 to be inclusive}
  }
  return noOfWeeks;
}

int differenceInCalendarDays({required DateTime end, required DateTime start}) {
  // Normalize [DateTime] objects to UTC and to discard time information.
  end = DateTime.utc(end.year, end.month, end.day);
  start = DateTime.utc(start.year, start.month, start.day);

  return end.difference(start).inDays;
}
