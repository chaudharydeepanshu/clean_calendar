import 'package:flutter/material.dart';

Offset getWidgetCenterOffsetInfo(GlobalKey widgetKey) {
  final RenderBox renderBox =
      widgetKey.currentContext?.findRenderObject() as RenderBox;

  // final Size size = renderBox.size; // or _widgetKey.currentContext?.size
  // show('Size: ${size.width}, ${size.height}');

  final Offset offset = renderBox.localToGlobal(Offset.zero);
  // show('Offset top left: ${offset.dx}, ${offset.dy}');
  // show(
  //     'Offset center: ${offset.dx + (size.width / 2)}, ${offset.dy + (size.height / 2)}');

  return Offset((offset.dx), (offset.dy));
}
