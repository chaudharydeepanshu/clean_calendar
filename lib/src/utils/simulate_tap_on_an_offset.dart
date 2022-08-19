import 'package:flutter/gestures.dart';

simulateTapOnAnOffset(Offset offset) {
  GestureBinding.instance.handlePointerEvent(PointerDownEvent(
    position: offset,
  ));
  // await Future.delayed(Duration(milliseconds: 500));
  GestureBinding.instance.handlePointerEvent(PointerUpEvent(
    position: offset,
  ));
}
