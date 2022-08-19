import 'package:clean_calendar/src/state/properties_state.dart';
import 'package:clean_calendar/src/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// List<DateTime> generateInitialDatesList(
//     {required List<int> list, required DateTime initialViewMonthDateTime}) {
//   List<DateTime> initialDatesList = [];
//
//   for (var element in list) {
//     if (element < 0) {
//       //method works until (12 -(initialViewMonthDateTime.month - element + 1)) is not equal to zero or negative
//       DateTime newPreviousMonth;
//       if ((initialViewMonthDateTime.month + element).isNegative) {
//         newPreviousMonth = DateTime(initialViewMonthDateTime.year - 1,
//             12 - (initialViewMonthDateTime.month + element + 1), 1);
//       } else if ((initialViewMonthDateTime.month + element) == 0) {
//         newPreviousMonth = DateTime(initialViewMonthDateTime.year - 1, 12, 1);
//       } else {
//         newPreviousMonth = DateTime(initialViewMonthDateTime.year,
//             initialViewMonthDateTime.month + element, 1);
//       }
//       initialDatesList
//           .add(DateTime.utc(newPreviousMonth.year, newPreviousMonth.month, 1));
//     } else if (element > 0) {
//       DateTime newNextMonth;
//       if ((initialViewMonthDateTime.month + element) > 12) {
//         newNextMonth = DateTime(initialViewMonthDateTime.year + 1,
//             (initialViewMonthDateTime.month + element) - 12, 1);
//       } else if ((initialViewMonthDateTime.month + element) == 12) {
//         newNextMonth = DateTime(initialViewMonthDateTime.year, 12, 1);
//       } else {
//         newNextMonth = DateTime(initialViewMonthDateTime.year,
//             initialViewMonthDateTime.month + element, 1);
//       }
//       initialDatesList
//           .add(DateTime.utc(newNextMonth.year, newNextMonth.month, 1));
//     } else {
//       initialDatesList.add(DateTime.utc(
//           initialViewMonthDateTime.year, initialViewMonthDateTime.month, 1));
//     }
//   }
//
//   return initialDatesList;
// }

class PageControllerState extends ChangeNotifier {
  PageControllerState({required this.ref});

  late DateTime initialViewMonthDateTime = ref.watch(
      calendarPropertiesStateProvider
          .select((value) => value.initialViewMonthDateTime));

  late DateTime startDateOfCalendar = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.startDateOfCalendar));

  late DateTime endDateOfCalendar = ref.watch(calendarPropertiesStateProvider
      .select((value) => value.endDateOfCalendar));

  final AutoDisposeChangeNotifierProviderRef ref;

  late PageController _pageController;
  PageController get pageController => _pageController;

  late DateTime _pageViewDateTime;
  DateTime get pageViewDateTime => _pageViewDateTime;

  late int initialIndex;

  late int _pageViewIndex;

  /// The list of integers form -ve to +ve index with initial date at 0 index.
  late List<int> listOfIntegersFromStartToAndEndDateWithInitialAs0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  initializePageViewVars() {
    _pageViewDateTime = DateTime.utc(
        initialViewMonthDateTime.year, initialViewMonthDateTime.month, 1);

    int monthsCountBeforeInitialDateToStartDate =
        DateUtils.monthDelta(startDateOfCalendar, _pageViewDateTime);

    int monthsCountAfterInitialDateToStartDate =
        DateUtils.monthDelta(_pageViewDateTime, endDateOfCalendar);

    int startIndex = -1 * monthsCountBeforeInitialDateToStartDate;

    int endIndex = monthsCountAfterInitialDateToStartDate;

    listOfIntegersFromStartToAndEndDateWithInitialAs0 = [
      for (var i = startIndex; i <= endIndex; i += 1) i
    ];

    // log(listOfIntegersFromStartToAndEndDateWithInitialAs0.toString());

    initialIndex =
        monthsCountBeforeInitialDateToStartDate; //(list.length / 2).floor();

    _pageViewIndex = initialIndex;

    // Setting viewportFraction to 0.99 to preload before and after pages.
    _pageController =
        PageController(initialPage: _pageViewIndex, viewportFraction: 1);

    _pageController.addListener(() {
      // Get index according to the direction
      // _pageController.page! > _initialIndex => swiping to the right, going to the left / previous element
      // _pageController.page! < _initialIndex => swiping to the left, going to the right / next element
      final index = _pageController.page! > _pageViewIndex
          ? _pageController.page!.floor()
          : _pageController.page!.ceil();

      if (index == _pageViewIndex) {
        return;
      }
      if (index < _pageViewIndex) {
        _prev();
      } else if (index > _pageViewIndex) {
        _next();
      }
    });

    // print("_initialIndex: $initialIndex");

    // ref.listen(
    //     calendarPropertiesStateProvider
    //         .select((value) => value.startDateOfCalendar),
    //     (DateTime? previousDateTime, DateTime newDateTime) {
    //   print("previousDateTime: $previousDateTime");
    //   print("newDateTime: $newDateTime");
    //
    //   // final readCalendarPropertiesStateProviderValue =
    //   //     ref.read(calendarPropertiesStateProvider);
    //   //
    //   // DateTime pageViewDateTime = DateTime.utc(
    //   //     readCalendarPropertiesStateProviderValue
    //   //         .initialViewMonthDateTime.year,
    //   //     readCalendarPropertiesStateProviderValue
    //   //         .initialViewMonthDateTime.month,
    //   //     1);
    //   // int monthsCountBeforeInitialDateToStartDate =
    //   //     DateUtils.monthDelta(newDateTime, pageViewDateTime);
    //   // print("initialIndex: $monthsCountBeforeInitialDateToStartDate");
    //   // _pageController.jumpToPage(monthsCountBeforeInitialDateToStartDate);
    //
    //   // print("initialIndex: $initialIndex");
    //   // _pageController.jumpToPage(initialIndex);
    // });

    ref.listen(calendarPropertiesStateProvider,
        (CalendarPropertiesState? previousCalendarPropertiesState,
            CalendarPropertiesState newCalendarPropertiesState) {
      // print(
      //     "previousCalendarPropertiesState: ${previousCalendarPropertiesState?.startDateOfCalendar}");
      // print(
      //     "newCalendarPropertiesState: ${newCalendarPropertiesState.startDateOfCalendar}");
      // print("startDateOfCalendar: $startDateOfCalendar");
      if (startDateOfCalendar !=
              newCalendarPropertiesState.startDateOfCalendar ||
          endDateOfCalendar != newCalendarPropertiesState.endDateOfCalendar ||
          initialViewMonthDateTime !=
              newCalendarPropertiesState.initialViewMonthDateTime) {
        DateTime pageViewDateTime = DateTime.utc(
            newCalendarPropertiesState.initialViewMonthDateTime.year,
            newCalendarPropertiesState.initialViewMonthDateTime.month,
            1);
        int monthsCountBeforeInitialDateToStartDate = DateUtils.monthDelta(
            newCalendarPropertiesState.startDateOfCalendar, pageViewDateTime);
        // print("initialIndex: $monthsCountBeforeInitialDateToStartDate");
        _pageController.jumpToPage(monthsCountBeforeInitialDateToStartDate);
      }
    });

    notifyListeners();
  }

  // Update list and jump to the middle element
  void _next() {
    _pageViewDateTime =
        DateTime.utc(pageViewDateTime.year, pageViewDateTime.month + 1, 1);
    _pageViewIndex++;
    notifyListeners();
  }

  // Update list and jump to the middle element
  void _prev() {
    _pageViewDateTime =
        DateTime.utc(pageViewDateTime.year, pageViewDateTime.month - 1, 1);
    _pageViewIndex--;
    notifyListeners();
  }
}

// class PageControllerState extends ChangeNotifier {
//   PageControllerState(
//       {required this.watchCalendarPropertiesStateProviderValue});
//
//   CalendarPropertiesState watchCalendarPropertiesStateProviderValue;
//
//   late PageController _pageController;
//   PageController get pageController => _pageController;
//
//   late DateTime _pageViewDateTime;
//   DateTime get pageViewDateTime => _pageViewDateTime;
//
//   late int _initialIndex;
//
//   late List<DateTime> _listOfPageViewMonthDates;
//   List<DateTime> get listOfPageViewMonthDates => _listOfPageViewMonthDates;
//
//   // This should work with 3, 7, 11, ... odd elements. Mind the pattern!!!
//   List<int> list = [-2, -1, 0, 1, 2];
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   initializePageViewVars() {
//     _pageViewDateTime =
//         watchCalendarPropertiesStateProviderValue.initialViewMonthDateTime;
//
//     _initialIndex = (list.length / 2).floor();
//
//     _listOfPageViewMonthDates = generateInitialDatesList(
//         list: list,
//         initialViewMonthDateTime:
//             watchCalendarPropertiesStateProviderValue.initialViewMonthDateTime);
//
//     _pageController =
//         PageController(initialPage: _initialIndex, viewportFraction: 1);
//
//     _pageController.addListener(() {
//       // Get index according to the direction
//       // _pageController.page! > _initialIndex => swiping to the right, going to the left / previous element
//       // _pageController.page! < _initialIndex => swiping to the left, going to the right / next element
//       final index = _pageController.page! > _initialIndex
//           ? _pageController.page!.floor()
//           : _pageController.page!.ceil();
//
//       if (index == _initialIndex) return;
//       if (index == _initialIndex - 1) {
//         _prev();
//       } else if (index == _initialIndex + 1) {
//         _next();
//       }
//     });
//   }
//
//   // Update list and jump to the middle element
//   void _next() {
//     // Update current DateTime here
//     DateTime newNextMonth;
//     if (_listOfPageViewMonthDates.last.month != 12) {
//       newNextMonth = DateTime(_listOfPageViewMonthDates.last.year,
//           _listOfPageViewMonthDates.last.month + 1, 1);
//     } else {
//       newNextMonth = DateTime(_listOfPageViewMonthDates.last.year + 1, 1, 1);
//     }
//     _listOfPageViewMonthDates
//       ..removeAt(0)
//       ..insert(_listOfPageViewMonthDates.length, newNextMonth);
//
//     _pageViewDateTime =
//         _listOfPageViewMonthDates[_listOfPageViewMonthDates.length - 3];
//
//     _pageController.jumpToPage(_initialIndex);
//
//     notifyListeners();
//   }
//
//   // Update list and jump to the middle element
//   void _prev() {
//     DateTime newPreviousMonth;
//     if (_listOfPageViewMonthDates.first.month != 1) {
//       newPreviousMonth = DateTime(_listOfPageViewMonthDates.first.year,
//           _listOfPageViewMonthDates.first.month - 1, 1);
//     } else {
//       newPreviousMonth =
//           DateTime(_listOfPageViewMonthDates.first.year - 1, 12, 1);
//     }
//     _listOfPageViewMonthDates
//       ..insert(0, newPreviousMonth)
//       ..removeLast();
//     _pageViewDateTime = _listOfPageViewMonthDates[2];
//     _pageController.jumpToPage(_initialIndex);
//
//     notifyListeners();
//   }
// }
