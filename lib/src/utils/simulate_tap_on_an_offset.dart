import 'package:flutter/gestures.dart';

void simulateTapOnAnOffset(Offset offset) {
  GestureBinding.instance.handlePointerEvent(PointerDownEvent(
    position: offset,
  ));
  // await Future.delayed(Duration(milliseconds: 500));
  GestureBinding.instance.handlePointerEvent(PointerUpEvent(
    position: offset,
  ));
}
