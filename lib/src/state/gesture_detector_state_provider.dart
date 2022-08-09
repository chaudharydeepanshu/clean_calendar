import 'package:flutter/material.dart';

class OffsetDetails {
  final double? xf;
  final double? xe;
  final double? yf;
  final double? ye;

  OffsetDetails(
      {required this.xf, required this.xe, required this.yf, required this.ye});

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'OffsetDetails{xf: $xf, xe: $xe, yf: $yf, ye: $ye}';
  }
}

class GestureDetectorStateProvider extends ChangeNotifier {
  late List<GlobalKey> _pageViewElementsGlobalKeys;
  List<GlobalKey> get pageViewElementsGlobalKeys => _pageViewElementsGlobalKeys;

  List<OffsetDetails> _pageViewElementsOffsetDetails =
      List.filled(42, OffsetDetails(xf: null, xe: null, yf: null, ye: null))
          .toList();
  List<OffsetDetails> get pageViewElementsOffsetDetails =>
      _pageViewElementsOffsetDetails;

  late List<DateTime> _pageViewElementsDates;
  List<DateTime> get pageViewElementsDates => _pageViewElementsDates;

  late int _panCurrentIndex;
  DateTime get panCurrentDate => _pageViewElementsDates[_panCurrentIndex];

  late int _panStartIndex;
  DateTime get panStartDate => _pageViewElementsDates[_panStartIndex];

  late int _panEndIndex;
  DateTime get panEndDate => _pageViewElementsDates[_panEndIndex];

  initialise(
      {required List<DateTime> pageViewElementsDates,
      required List<GlobalKey> pageViewElementsGlobalKeys}) {
    _pageViewElementsGlobalKeys = pageViewElementsGlobalKeys;

    _pageViewElementsOffsetDetails =
        List.filled(42, OffsetDetails(xf: null, xe: null, yf: null, ye: null))
            .toList();

    _pageViewElementsDates = pageViewElementsDates;
  }

  onPanStart(details) async {
    for (int i = 0; i < _pageViewElementsGlobalKeys.length; i++) {
      final RenderBox renderBox = _pageViewElementsGlobalKeys[i]
          .currentContext
          ?.findRenderObject() as RenderBox;
      final Offset offset = renderBox.localToGlobal(Offset.zero);
      final Size size = renderBox.size;

      if (_pageViewElementsOffsetDetails[i].xf == null) {
        final data = OffsetDetails(
            xf: offset.dx,
            xe: offset.dx + size.width,
            yf: offset.dy,
            ye: offset.dy + size.height);
        _pageViewElementsOffsetDetails[i] = data;
      } else {}
    }

    final dx = details.globalPosition.dx;
    final dy = details.globalPosition.dy;
    final start = _pageViewElementsOffsetDetails.where((e) {
      return dx > e.xf! && dx < e.xe! && dy > e.yf! && dy < e.ye!;
    }).toList();
    await Future.delayed(const Duration(seconds: 0));
    if (start.isNotEmpty) {
      final int index = _pageViewElementsOffsetDetails.indexOf(start.first);
      _panStartIndex = index;
      _panEndIndex = index;
      // _panCurrentIndex = null;

      notifyListeners();
    }
  }

  onPanUpdate(details) async {
    final dx = details.globalPosition.dx;
    final dy = details.globalPosition.dy;
    final start = _pageViewElementsOffsetDetails.where((e) {
      return dx >= e.xf! && dx <= e.xe! && dy >= e.yf! && dy <= e.ye!;
    }).toList();
    await Future.delayed(const Duration(seconds: 0));
    if (start.isNotEmpty) {
      final int index = _pageViewElementsOffsetDetails.indexOf(start.first);
      // _panCurrentIndex = null;
      _panEndIndex = index;

      notifyListeners();
    }
  }

  bool isSelected(
      {required int index,
      required int? selectedIndex,
      required int? startIndex,
      required int? endIndex}) {
    if (selectedIndex == null) {
      final bool isSelect = startIndex != null && endIndex != null
          ? selectionCheck(index: index, start: startIndex, end: endIndex)
          : false;

      return isSelect;
    }
    return index == selectedIndex;
  }

  bool selectionCheck(
      {required int index, required int start, required int end}) {
    if (start <= end) {
      if (index >= start && index <= end) {
        return true;
      }
    } else {
      if (index <= start && index >= end) {
        return true;
      }
    }
    return false;
  }
}
