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

**Note: We know Clean calendar is still very new, but don't be put off by it because it will be well-maintained for a very, very long time. It is in the early stages of development. Additionally, you can contact me via email, discord, or any of the other channels provided on my Github profile if you have any questions or suggestions about this package.**

**Yes, without a doubt, giving a like will encourage me to work on this package more quickly.**

## Description

A brand-new Flutter calendar package that enables you to make a simple, lovely, and customizable calendar. It now offers a customizable month view and the choice to display unique streaks for dates. It is actively being developed to add numerous common features, like events, date selection, and many more, so this is just the beginning.

## Features

- Give a list of dates so that the calendar can display them as streaks.

<img src="https://user-images.githubusercontent.com/85361211/183488609-8569b762-dda7-4ae4-929b-73d14ab62ac8.png" width="400" />

- Calendar with custom month view.

| Dark mode Gif  | Light mode Gif |
| --- | --- |
| <img src="https://user-images.githubusercontent.com/85361211/183489719-fda17b3e-c2de-4368-b293-73e453b60fcd.gif" width="400" /> | <img src="https://user-images.githubusercontent.com/85361211/183489928-14a32db4-7d41-4b38-bf3b-7b0a6e0037aa.gif" width="400" /> |



## Getting started

- In pubspec.yaml, add this dependency:

```yaml
clean_calendar: 
```

- Add this package to your project:

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

Support is planned for these:

- Complete documentation.

- Date selection options such as single, multiple, range, and multiple range selections.

- A calendar option for choosing a view by year, month, or day.

- Support for dates to be displayed in events style.

- Dry mode, which optimizes performance for low-end devices by removing or substituting heavy animations and widgets.
