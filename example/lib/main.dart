import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DateTime> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Calendar"),
      ),
      body: Center(
        child: ListView(
          children: [
            CleanCalendar(
              enableDenseViewForDates: true,
              enableDenseSplashForDates: true,
              datesForStreaks: [
                DateTime(2022, 11, 5),
                DateTime(2022, 11, 6),
                DateTime(2022, 11, 7),
                DateTime(2022, 11, 9),
                DateTime(2022, 11, 10),
                DateTime(2022, 11, 11),
                DateTime(2022, 11, 13),
                DateTime(2022, 11, 20),
                DateTime(2022, 11, 21),
                DateTime(2022, 11, 23),
                DateTime(2022, 11, 24),
                DateTime(2022, 11, 25),
              ],
              dateSelectionMode: DatePickerSelectionMode.singleOrMultiple,
              startWeekday: WeekDay.wednesday,
              selectedDates: selectedDates,
              onCalendarViewDate: (DateTime calendarViewDate) {
                // print(calendarViewDate);
              },
              onSelectedDates: (List<DateTime> value) {
                setState(() {
                  if (selectedDates.contains(value.first)) {
                    selectedDates.remove(value.first);
                  } else {
                    selectedDates.add(value.first);
                  }
                });
                // print(selectedDates);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CleanCalendar(
              datePickerCalendarView: DatePickerCalendarView.weekView,
              enableDenseViewForDates: true,
              enableDenseSplashForDates: true,
              datesForStreaks: [
                DateTime(2022, 11, 5),
                DateTime(2022, 11, 6),
                DateTime(2022, 11, 7),
                DateTime(2022, 11, 9),
                DateTime(2022, 11, 10),
                DateTime(2022, 11, 11),
                DateTime(2022, 11, 13),
                DateTime(2022, 11, 20),
                DateTime(2022, 11, 21),
                DateTime(2022, 11, 23),
                DateTime(2022, 11, 24),
              ],
              dateSelectionMode: DatePickerSelectionMode.singleOrMultiple,
              onCalendarViewDate: (DateTime calendarViewDate) {
                // print(calendarViewDate);
              },
              selectedDates: selectedDates,
              onSelectedDates: (List<DateTime> value) {
                setState(() {
                  if (selectedDates.contains(value.first)) {
                    selectedDates.remove(value.first);
                  } else {
                    selectedDates.add(value.first);
                  }
                });
                // print(selectedDates);
              },
            ),
            CleanCalendar(
              datePickerCalendarView: DatePickerCalendarView.weekView,
              enableDenseViewForDates: true,
              enableDenseSplashForDates: true,
              datesForStreaks: [
                DateTime(2022, 11, 5),
                DateTime(2022, 11, 6),
                DateTime(2022, 11, 7),
                DateTime(2022, 11, 9),
                DateTime(2022, 11, 10),
                DateTime(2022, 11, 11),
                DateTime(2022, 11, 13),
                DateTime(2022, 11, 20),
                DateTime(2022, 11, 21),
                DateTime(2022, 11, 23),
                DateTime(2022, 11, 24),
              ],
              dateSelectionMode: DatePickerSelectionMode.disable,
              onCalendarViewDate: (DateTime calendarViewDate) {
                // print(calendarViewDate);
              },
              startWeekday: WeekDay.monday,
              weekdaysSymbol: const Weekdays(
                sunday: "s",
                monday: "m",
                tuesday: "t",
                wednesday: "w",
                thursday: "t",
                friday: "f",
                saturday: "s",
              ),
              monthsSymbol: const Months(
                  january: "Jan",
                  february: "Feb",
                  march: "Mar",
                  april: "Apr",
                  may: "May",
                  june: "Jun",
                  july: "Jul",
                  august: "Aug",
                  september: "Sep",
                  october: "Oct",
                  november: "Nov",
                  december: "Dec"),
              weekdaysProperties: WeekdaysProperties(
                generalWeekdaysDecoration:
                    WeekdaysDecoration(weekdayTextColor: Colors.red),
                sundayDecoration: WeekdaysDecoration(
                    weekdayTextColor: Colors.green,
                    weekdayTextStyle:
                        Theme.of(context).textTheme.headlineMedium),
                saturdayDecoration: WeekdaysDecoration(
                    weekdayTextColor: Colors.green,
                    weekdayTextStyle:
                        Theme.of(context).textTheme.headlineMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
