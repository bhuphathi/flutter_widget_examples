import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';

const _filename = "context_extension.dart";

extension CustomContextExtensions on BuildContext {
  Offset getWidgetBottomLeftOffset() {
    final RenderBox box = findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);

    final bottomLeftOffset = Offset(position.dx, position.dy + box.size.height);
    // final bottomRightOffset = Offset(position.dx + box.size.width, position.dy + box.size.height);
    return bottomLeftOffset;
  }

  Rect? get globalPaintBounds {
    final renderObject = findRenderObject();
    dPrint(filename: _filename, msg: "renderObject $renderObject");
    final translation = renderObject?.getTransformTo(null).getTranslation();
    dPrint(filename: _filename, msg: "translation $translation");

    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      dPrint(filename: _filename, msg: "offset $offset");
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}
