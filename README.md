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

[![pub package](https://img.shields.io/pub/v/clean_calendar.svg)](https://pub.dev/packages/clean_calendar) [![wakatime](https://wakatime.com/badge/user/83f3b15d-49de-4c01-b8de-bbc132f11be1/project/310945fd-a5ea-459c-a522-8048d1a86a33.svg)](https://wakatime.com/badge/user/83f3b15d-49de-4c01-b8de-bbc132f11be1/project/310945fd-a5ea-459c-a522-8048d1a86a33)

## Word from creator

**Hello👋, Clean Calendar is in the early stages of development, but rest assured, it will be well-maintained for a long time. Also, if you have any questions or suggestions, contact me via GitHub issues, email, discord, or any of the ways listed on my GitHub profile.**

**Yes, giving the package a 👍(Pub) or ⭐(Github) will encourage me to work on it more.**

## Package description

Get ready to enhance your Flutter app with this fantastic calendar package! With its simple yet elegant design, you can create a fully customized calendar that suits your needs. It provides a customizable month view and the ability to highlight dates with streaks. It is just the beginning, and we will add more features.

## Features

- Display dates as streaks

<img src="https://user-images.githubusercontent.com/85361211/183488609-8569b762-dda7-4ae4-929b-73d14ab62ac8.png" width="400" />

- Monthly calendar

| Dark mode  | Light mode |
| --- | --- |
| <img src="https://user-images.githubusercontent.com/85361211/183489719-fda17b3e-c2de-4368-b293-73e453b60fcd.gif" width="400" /> | <img src="https://user-images.githubusercontent.com/85361211/183489928-14a32db4-7d41-4b38-bf3b-7b0a6e0037aa.gif" width="400" /> |

- Weekly calendar

| Dark mode  | Light mode |
| --- | --- |
| <img src="https://user-images.githubusercontent.com/85361211/186000727-3c9f773b-5483-453c-bd61-2c0b16d1a6f2.gif" width="400" /> | <img src="https://user-images.githubusercontent.com/85361211/186000735-83d1fd93-05be-48af-8b52-0a0c949a4cdc.gif" width="400" /> |

## Getting started

- In pubspec.yaml, add this dependency:

```yaml
clean_calendar: 
```

- Add this package to your project:

```dart
import 'package:clean_calendar/clean_calendar.dart';
```

## Basic Usage

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

## Customisations

- Customise date boundary behaviour and tap behaviour

| <pre>CleanCalendar(                           <br />)</pre> | <pre>CleanCalendar(<br>  // To allow date boundary to shrink.<br>  enableDenseViewForDates: true,<br><br>  // To allow date tap splash to shrink.<br>  enableDenseSplashForDates: true,<br>)</pre> |
|:---|:---|
| <img src="https://user-images.githubusercontent.com/85361211/185585701-00c9b42e-ca15-4884-a151-c795a0e06662.gif" width="470" /> | <img src="https://user-images.githubusercontent.com/85361211/185585710-69037f2c-773f-492a-a9ef-869f5926cf14.gif" width="470" /> |

Note: This dense mode could lead to overflow if the available width to calendar is smaller than 280px so it is advised to disable them in smaller space than 280px.

- Disable and hide different types of dates

| <pre>CleanCalendar(                                      <br />)</pre> | <pre>CleanCalendar(<br />  leadingTrailingDatesProperties: DatesProperties(<br /><br />   // To disable taps on leading and trailing dates.<br />   disable: true,<br /><br />   // To hide leading and trailing dates.<br />   hide: true,<br />  ),<br />)</pre> |
|:---|:---|
| <img src="https://user-images.githubusercontent.com/85361211/185587354-f7b0d42f-9dd0-41a4-a049-1219e4da42e8.png" width="400" /> | <img src="https://user-images.githubusercontent.com/85361211/185587363-475073da-5bf5-4f26-8f69-606370ae23a8.png" width="400" /> |

Also, Available for other types of dates : -

| Selected Dates | Visible Month Dates | Current Date | Streak Dates |
|:---|:---|:---|:---|
| <pre>CleanCalendar(<br />  selectedDatesProperties: DatesProperties(<br /><br />   // To disable taps on selected dates.<br />   disable: true,<br /><br />   // To hide selected dates.<br />   hide: true,<br />  ),<br />)</pre> | <pre>CleanCalendar(<br />  generalDatesProperties: DatesProperties(<br /><br />   // To disable taps on leading and trailing dates.<br />   disable: true,<br /><br />   // To hide leading and trailing dates.<br />   hide: true,<br />  ),<br />)</pre> | <pre>CleanCalendar(<br />  currentDateProperties: DatesProperties(<br /><br />   // To disable taps on current date.<br />   disable: true,<br /><br />   // To hide current date.<br />   hide: true,<br />  ),<br />)</pre> | <pre>CleanCalendar(<br />  streakDatesProperties: DatesProperties(<br /><br />   // To disable taps on streak dates.<br />   disable: true,<br /><br />   // To hide streak dates.<br />   hide: true,<br />  ),<br />)</pre> |

- Customise dates look by changing its properties

| <pre>CleanCalendar(                                         <br />);</pre> | <pre>CleanCalendar(<br />  datesForStreaks: [<br />    DateTime(2022, 8, 5),<br />    DateTime(2022, 8, 6),<br />    ...<br />  ],<br />  currentDateProperties: DatesProperties(<br />    datesDecoration: DatesDecoration(<br />      datesBorderRadius: 1000,<br />      datesBackgroundColor: Colors.lightGreen.shade100,<br />      datesBorderColor: Colors.green,<br />      datesTextColor: Colors.black,<br />    ),<br />  ),<br />  generalDatesProperties: DatesProperties(<br />    datesDecoration: DatesDecoration(<br />      datesBorderRadius: 1000,<br />      datesBackgroundColor: Colors.lightGreen.shade100,<br />      datesBorderColor: Colors.blue.shade100,<br />      datesTextColor: Colors.black,<br />    ),<br />  ),<br />  streakDatesProperties: DatesProperties(<br />    datesDecoration: DatesDecoration(<br />      datesBorderRadius: 1000,<br />      datesBackgroundColor: Colors.green,<br />      datesBorderColor: Colors.blue,<br />      datesTextColor: Colors.white,<br />    ),<br />  ),<br />  leadingTrailingDatesProperties: DatesProperties(<br />    datesDecoration: DatesDecoration(<br />      datesBorderRadius: 1000,<br />    ),<br />  ),<br />)</pre> | <pre>CleanCalendar(<br />  enableDenseViewForDates: true,<br />  datesForStreaks: [<br />    DateTime(2022, 8, 5),<br />    DateTime(2022, 8, 6),<br />    ...<br />  ],<br />  currentDateProperties: DatesProperties(<br />    datesDecoration: DatesDecoration(<br />      datesBorderRadius: 1000,<br />      datesBackgroundColor: Colors.lightGreen.shade100,<br />      datesBorderColor: Colors.green,<br />      datesTextColor: Colors.black,<br />    ),<br />  ),<br />  generalDatesProperties: DatesProperties(<br />    datesDecoration: DatesDecoration(<br />      datesBorderRadius: 1000,<br />      datesBackgroundColor: Colors.lightGreen.shade100,<br />      datesBorderColor: Colors.blue.shade100,<br />      datesTextColor: Colors.black,<br />    ),<br />  ),<br />  streakDatesProperties: DatesProperties(<br />    datesDecoration: DatesDecoration(<br />      datesBorderRadius: 1000,<br />      datesBackgroundColor: Colors.green,<br />      datesBorderColor: Colors.blue,<br />      datesTextColor: Colors.white,<br />    ),<br />  ),<br />  leadingTrailingDatesProperties: DatesProperties(<br />    datesDecoration: DatesDecoration(<br />      datesBorderRadius: 1000,<br />    ),<br />  ),<br />)</pre> |
|:---|:---|:---|
| <img src="https://user-images.githubusercontent.com/85361211/185591984-0165f037-8a18-4547-be63-b60bff7de382.png" width="400" /> | <img src="https://user-images.githubusercontent.com/85361211/185591992-2f5c81ab-7db7-4fbd-b85d-9b10a4ca6c01.png" width="400" /> | <img src="https://user-images.githubusercontent.com/85361211/185591997-1fc13884-9741-47c9-af4c-264c70d96e66.png" width="400" /> |

- Customise weekdays header by changing its properties

| <pre>CleanCalendar(<br />  weekdaysProperties: WeekdaysProperties(<br />    generalWeekdaysDecoration:<br />        WeekdaysDecoration(weekdayTextColor: Colors.red),<br />    sundayDecoration: WeekdaysDecoration(<br />        weekdayTextColor: Colors.green,<br />        weekdayTextStyle:<br />            Theme.of(context).textTheme.headlineMedium),<br />    saturdayDecoration: WeekdaysDecoration(<br />        weekdayTextColor: Colors.green,<br />        weekdayTextStyle:<br />            Theme.of(context).textTheme.headlineMedium),<br />  ),<br />)</pre> |
|:---|
| <img src="https://user-images.githubusercontent.com/85361211/192656691-d492a13d-5f45-4bbc-ba33-28f7039b2c9f.jpeg" width="400" />  |

- Customise navigator header by changing its properties

| <pre>CleanCalendar(<br />  headerProperties: HeaderProperties(<br />    monthYearDecoration: MonthYearDecoration(<br />      monthYearTextColor: Colors.amber,<br />      monthYearTextStyle: Theme.of(context).textTheme.labelMedium,<br />    ),<br />    navigatorDecoration: NavigatorDecoration(<br />      navigatorResetButtonIcon: const Icon(<br />        Icons.restart_alt,<br />        color: Colors.amber,<br />      ),<br />      navigateLeftButtonIcon: const Icon(<br />        Icons.arrow_circle_left,<br />        color: Colors.amber,<br />      ),<br />      navigateRightButtonIcon: const Icon(<br />        Icons.arrow_circle_right,<br />        color: Colors.amber,<br />      ),<br />    ),<br />  ),<br />)</pre> |
|:---|
| <img src="https://user-images.githubusercontent.com/85361211/214251692-d8cfb076-a185-4d9d-9b6b-81700023dd78.jpeg" width="400" />  |

## Date Selection

- Multiple date selection with customization

| <pre>CleanCalendar(<br />  enableDenseViewForDates: true,<br />  enableDenseSplashForDates: true,<br />  datesForStreaks: [<br />    DateTime(2022, 8, 5),<br />    DateTime(2022, 8, 6),<br />    ...<br />  ],<br /><br />  // Enabling selecting single or multiple dates. Defaults to disable selection.<br />  dateSelectionMode: DatePickerSelectionMode.singleOrMultiple,<br /><br />  // Listening to selected dates.<br />  onSelectedDates: (List&lt;DateTime&gt; value) {<br />    // If selected date picked again then removing it from selected dates.<br />    if (selectedDates.contains(value.first)) {<br />      selectedDates.remove(value.first);<br />    } else {<br />      // If unselected date picked then adding it to selected dates.<br />      selectedDates.add(value.first);<br />    }<br />    // setState to update the calendar with new selected dates.<br />    setState(() {});<br />  },<br /><br />  // Providing calendar the dates to select in ui.<br />  selectedDates: selectedDates,<br /><br />  // Customizing selected date.<br />  selectedDatesProperties: DatesProperties(<br />    datesDecoration: DatesDecoration(<br />      datesBorderRadius: 1000,<br />    ),<br />  ),<br />)</pre> |
|:---|
| <img src="https://user-images.githubusercontent.com/85361211/185594856-e507bc09-7af0-40b7-9935-705f30f2e6e3.gif" width="400" /> |

- Single date selection

  For single date selection modify the above example code `onSelectedDates` logic to store only single latest date as selected.

- Range, multiple ranges (coming soon)

## Changing calendar view type

Currently mothly and weekly views are added. You can change them as shown below:

```dart
CleanCalendar(
  // Setting DatePickerCalendarView.weekView for weekly view
  datePickerCalendarView: DatePickerCalendarView.weekView,
)
```

**Note:** ```datePickerCalendarView``` defaults to DatePickerCalendarView.monthView.

## Changing calendar start weekday

You can change the claendar start weekday as shown below:

```dart
CleanCalendar(
  // Setting start weekday
  startWeekday: WeekDay.monday,
)
```

**Note:** ```startWeekday``` defaults to WeekDay.sunday.

## Changing weekday and month symbols

You can change the claendar months and weekdays symbols as shown below:

```dart
CleanCalendar(
  // Setting custom weekday symbols
  weekdaysSymbol: const Weekdays(sunday: "s", monday: "m", tuesday: "t", wednesday: "w", thursday: "t", friday: "f", saturday: "s"),
  // Setting custom month symbols
  monthsSymbol: const Months(january: "Jan", february: "Feb", march: "Mar", april: "Apr", may: "May", june: "Jun", july: "Jul", august: "Aug", september: "Sep", october: "Oct", november: "Nov", december: "Dec"),
)
```

**Note:** ```weekdaysSymbol``` defaults to Mo, Tu, We, Th, Fr, Sa, Su from monday to sunday and ```monthsSymbol``` defaults to January, February, March, April, May, June, July, August, September, October, November, December.

## Accessing selected dates

To access selected dates use the ```onSelectedDates``` callback but keep in mind that this callback always provides a list of dates as shown below:

```dart
CleanCalendar(
  ...
  onSelectedDates: (List<DateTime> selectedDates) {
    // Called every time dates are selected or deselected.
    print(selectedDates);
  },
)
```

**Note:** Even for single selection mode it provides a list with just one date and for multiple selection it provides a list with multiple dates.

## Providing pre-selected dates

You can provide pre-selected dates by providing a list of dates to ```selectedDates``` as shown below:

```dart
CleanCalendar(
  ...
  selectedDates: [
    DateTime(2022, 8, 6),
    DateTime(2022, 8, 9),
    DateTime(2022, 8, 11),
  ],
)
```
**Note:** Even with selection mode set to single or disable it will still show the provided pre-selected dates as selected. And I think is the correct behavious as sometimes we might want to show selected dates while also preventing users from interacting with them.

## Providing start and end dates

You can provide start and end dates for calendar view as shown below:

```dart
CleanCalendar(
  ...
  // Setting start date of calendar.
  startDateOfCalendar: DateTime(2022,6,5),

  // Setting end date of calendar.
  endDateOfCalendar: DateTime(2022,10,15),
)
```

**Note:** ```startDateOfCalendar``` defaults to DateTime.utc(0000, 1, 1) and ```endDateOfCalendar``` defaults to DateTime.utc(9999, 1, 1).

## Providing initial month view for calendar

You can provide initial month view for calendar by providing date of that month as shown below:

```dart
CleanCalendar(
  ...
  // Setting initial month view of calendar.
  initialViewMonthDateTime: DateTime(2022,9,5),
)
```

**Note:** ```initialViewMonthDateTime``` defaults to current date and if current is not between startDateOfCalendar and endDateOfCalendar then defaults to start date..

## Providing current date for calendar

You can provide current date for calendar as shown below:

```dart
CleanCalendar(
  ...
  // Setting current date of calendar.
  currentDateOfCalendar: DateTime(2022,9,5),
)
```

**Note:** ```currentDateOfCalendar``` defaults to DateTime.now().

## Listening for calendar view week or month change

You can listen and get the current calendar view date on calendar view change. Useful in case you want to change your ui acording to the dates visible to user.

```dart
CleanCalendar(
  ...
  onCalendarViewDate: (DateTime calendarViewDate) {
    // Called every time view is changed like scrolled etc.
    print(calendarViewDate);
  },
)
```

**Note:** For now ```onCalendarViewDate``` will only provide the view starting date. Later I may can add an option to get all dates of current view depending on users request. Also, ```onCalendarViewDate``` is called only on change of view like scroll, etc and will not be called on the creation of calendar as at thst time we already know the date.

## Additional information

Support is surely planned for these:

- Complete documentation.

- Option to disable user interactions on whole view, past dates, and dates after-before end-start date. (🐇)

- More customization and premade templates for calendar. (🐢)

- More calendar view types. (🐢)

- Date selection options such as range, and multiple range selections. (🐢)

- A calendar option for choosing a view by year, month, or day. (🐢)

- Support for dates to be displayed in events style. (🐢)

- Dry mode, which optimizes performance for low-end devices by removing or substituting heavy animations and widgets. (🐢)

And, if I'm forgetting something crucial/important/necessary then please let me know.
