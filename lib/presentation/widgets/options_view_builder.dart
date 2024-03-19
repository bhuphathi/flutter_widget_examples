import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_widget_examples/core/themes/radix_theme.dart';

Widget optionsViewBuilder<T>({
  required BuildContext context,
  required Iterable<T> options,
  required String Function(T option) optionString,
  required void Function(T selected) onSelected,
  required double maxWidth,
  required RadixTheme theme,
  FocusNode? nextWidgetFocusNode,
  double? maxHeight,
}) {
  var data = options.toList();
  maxHeight = maxHeight ?? 300.0;
  return Align(
    alignment: Alignment.topLeft,
    child: Material(
      elevation: 10.0,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: maxWidth),
        child: ListView.builder(
            padding: const EdgeInsets.all(2),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final bool highlight = AutocompleteHighlightedOption.of(context) == index;
              if (highlight) {
                SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
                  Scrollable.ensureVisible(context, alignment: 0.5);
                });
              }
              return InkWell(
                onTap: () {
                  onSelected(data[index]);
                  nextWidgetFocusNode?.requestFocus();
                },
                child: Builder(builder: (BuildContext context) {
                  final bool highlight = AutocompleteHighlightedOption.of(context) == index;
                  if (highlight) {
                    SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
                      Scrollable.ensureVisible(context, alignment: 0.5);
                    });
                  }
                  return Container(
                    color: highlight ? theme.surfaceVariant : null,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(optionString(data[index])),
                  );
                }),
              );
            }),
      ),
    ),
  );
}
