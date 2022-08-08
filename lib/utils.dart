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

List<DateTime> getDatesForACalendarMonthAsUTC({required DateTime dateTime}) {
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

  for (int i = 1;
      i <= firstDayOfMonthWeekDay && firstDayOfMonthWeekDay != 7;
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
