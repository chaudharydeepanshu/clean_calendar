## 0.6.2

* **BREAKING:** Updated flutter_riverpod dependency to ^2.0.2
* Updated minimum required Flutter SDK version to 3.0.0
* Updated minimum required Dart SDK version to 2.17.0

## 0.6.1

* **BREAKING:** ```DecorationProperties``` is now ```DatesDecoration```.
* **BREAKING:** ```decorationProperties``` is now ```datesDecoration```.
* **BREAKING:** Now ```monthsSymbol``` takes ```Months``` instead of ```List<String>```.
* **BREAKING:** Now ```weekdaysSymbol``` takes ```Weekdays``` instead of ```List<String>```.
* Added decoration properties for weekdays. [#1](https://github.com/chaudharydeepanshu/clean_calendar/issues/1)
* Updated documentation.

## 0.5.4

* Fixes unwanted spacing in Streak Days after version 0.5.1. [#3](https://github.com/chaudharydeepanshu/clean_calendar/issues/3)

## 0.5.3

* Fixes few overflow and ink issues.
* Added note about dense mode under customisations in documentation.

## 0.5.2

* Updated documentation for weekdaysSymbol, monthsSymbol and startWeekday.

## 0.5.1

* Added support for custom month symbols. [#2](https://github.com/chaudharydeepanshu/clean_calendar/issues/2)
* Added support for custom weekday symbols. [#2](https://github.com/chaudharydeepanshu/clean_calendar/issues/2)
* Added support for setting start weekday for both month and week view. [#2](https://github.com/chaudharydeepanshu/clean_calendar/issues/2)

## 0.4.1

* Moved to stable flutter SDK.

## 0.3.1-dev.1

* Fixed lots of performance issues due to unnecessary rebuilds.

## 0.3.0-dev.2

* Ran ```flutter format .``` to fix analyzer formatting issues.

## 0.3.0-dev.1

* Added weekly calendar view.
* Added ```onCalendarViewDate``` callback to listen for change in calendar view date.
* Updated example to showcase weekly calendar view and ```onCalendarViewDate```.
* Note - For weekly calendar view the default theme properties for leading-trailing dates is same as general dates default theme properties.

## 0.2.0-dev.2

* Fixed README.md tables structure.

## 0.2.0-dev.1

* Removed weird logs from package.
* Optimized calendar scrolling and loading time tremendously.
* Disable and hide different types of dates through their properties.
* Customise dates look and feel by changing its properties.
* Single date selection with customized behaviour.
* Access selected dates.
* Provide pre-selected dates.
* Provide start and end dates for calendar view.
* Provide initial month view for calendar view.
* Provide current date for calendar view.
* Improved documentation.

## 0.0.1-dev.3

* Now, showing only public methods and classes.

## 0.0.1-dev.2

* Updated and fixed typo in Readme.md.

## 0.0.1-dev.1

* Initial development release.