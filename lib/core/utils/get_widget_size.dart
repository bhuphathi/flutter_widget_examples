import 'package:flutter/material.dart';

Size? getSizeOfWidget(GlobalKey? widgetKey) {
  // Access the widget's BuildContext using the GlobalKey
  BuildContext? widgetContext = widgetKey?.currentContext;

  if (widgetContext != null) {
    // Use the BuildContext to find the RenderBox
    RenderBox renderBox = widgetContext.findRenderObject() as RenderBox;

    // Get the size of the widget
    Size size = renderBox.size;

    return size;
  } else {
    return null;
  }
}
