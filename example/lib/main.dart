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
          title: 'Course App',
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
            Container(
              margin: const EdgeInsets.all(12.0),
              child: CleanCalendar(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
