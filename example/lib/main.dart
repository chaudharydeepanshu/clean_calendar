import 'package:clean_calendar/clean_calendar.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:example/Theme/app_theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calendar App',
          theme: AppThemeData.lightThemeData(lightDynamic),
          darkTheme: AppThemeData.darkThemeData(darkDynamic),
          themeMode: ThemeMode.system,
          home: const Home(),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                DateTime(2022, 9, 5),
                DateTime(2022, 9, 6),
                DateTime(2022, 9, 7),
                DateTime(2022, 9, 9),
                DateTime(2022, 9, 10),
                DateTime(2022, 9, 11),
                DateTime(2022, 9, 13),
                DateTime(2022, 9, 20),
                DateTime(2022, 9, 21),
                DateTime(2022, 9, 23),
                DateTime(2022, 9, 24),
                DateTime(2022, 9, 25),
              ],
              dateSelectionMode: DatePickerSelectionMode.single,
              startWeekday: WeekDay.wednesday,
            ),
            const SizedBox(
              height: 20,
            ),
            CleanCalendar(
              datePickerCalendarView: DatePickerCalendarView.weekView,
              enableDenseViewForDates: true,
              enableDenseSplashForDates: true,
              datesForStreaks: [
                DateTime(2022, 8, 5),
                DateTime(2022, 8, 6),
                DateTime(2022, 8, 7),
                DateTime(2022, 8, 9),
                DateTime(2022, 8, 10),
                DateTime(2022, 8, 11),
                DateTime(2022, 8, 13),
                DateTime(2022, 8, 20),
                DateTime(2022, 8, 21),
                DateTime(2022, 8, 23),
                DateTime(2022, 8, 24),
              ],
              dateSelectionMode: DatePickerSelectionMode.single,
              onCalendarViewDate: (DateTime calendarViewDate) {
                // print(calendarViewDate);
              },
            ),
            CleanCalendar(
              datePickerCalendarView: DatePickerCalendarView.weekView,
              enableDenseViewForDates: true,
              enableDenseSplashForDates: true,
              datesForStreaks: [
                DateTime(2022, 8, 5),
                DateTime(2022, 8, 6),
                DateTime(2022, 8, 7),
                DateTime(2022, 8, 9),
                DateTime(2022, 8, 10),
                DateTime(2022, 8, 11),
                DateTime(2022, 8, 13),
                DateTime(2022, 8, 20),
                DateTime(2022, 8, 21),
                DateTime(2022, 8, 23),
                DateTime(2022, 8, 24),
              ],
              dateSelectionMode: DatePickerSelectionMode.single,
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
