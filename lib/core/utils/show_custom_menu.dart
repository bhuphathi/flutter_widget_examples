import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/extensions/context_extension.dart';

void showCustomMenu(
  BuildContext context, {
  required List<PopupMenuEntry<String>> items,
  required FutureOr Function(String?) onValue,
  Function? onError,
  Offset? position,
}) {
  Offset tmpPosition = context.getWidgetBottomLeftOffset();
  if (position != null) tmpPosition = position;

  final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect positionRect = RelativeRect.fromRect(
    tmpPosition & const Size(0, 0), // Position where the menu will be shown,
    Offset.zero & overlay.size, // The full overlay size
  );

  showMenu<String>(
    context: context,
    position: positionRect,
    items: items,
    elevation: 8,
  ).then(onValue, onError: onError);
}
