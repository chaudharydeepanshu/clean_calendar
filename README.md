<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

**Note: Clean calendar is very new rigtnow but don't be afraid of the new as it will be maintained mannerly for a very long long time. It is in active development stage.**

## Description

A new Flutter calendar package that allows you to create a clean, beautiful and customisable calendar. Currently it supports a customisable month view and option to show custom streaks for dates. This is only the beginning as it is under active development to include various common features such as events, date selection and many more.

## Features

- Create custom streaks of dates.

<img src="https://user-images.githubusercontent.com/85361211/183488609-8569b762-dda7-4ae4-929b-73d14ab62ac8.png" width="400" />

- Custom month view calendar.

| Dark mode Gif  | Light mode Gif |
| --- | --- |
| <img src="https://user-images.githubusercontent.com/85361211/183489719-fda17b3e-c2de-4368-b293-73e453b60fcd.gif" width="400" /> | <img src="https://user-images.githubusercontent.com/85361211/183489928-14a32db4-7d41-4b38-bf3b-7b0a6e0037aa.gif" width="400" /> |



## Getting started

- Add dependency in pubspec.yaml:

```yaml
clean_calendar: 
```

- Import the package into your project:

```dart
import 'package:clean_calendar/clean_calendar.dart';
```

## Usage

```dart
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Calendar"),
      ),
      body: CleanCalendar(
        enableDenseViewForDates: true, // <- Set false to allow button boundary to expand.
        enableDenseSplashForDates: false, // <- Set true to minimise tap target.
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
    );
  }
}
```

## Additional information

Support for these are planned:

- Complete documentaion.

- Date selection: Single selection, multiple selection, range selection, multi range selection.

- Option to calendar for view selection by year, month and day.

- Support for events display for dates.

- Dry mode which will remove or replace heavy animations and widgets to optimise performance for low end devices.
