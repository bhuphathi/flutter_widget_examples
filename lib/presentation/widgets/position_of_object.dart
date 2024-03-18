import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/extensions/context_extension.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(
        builder: (context) {
          // Get the position of the widget
          final RenderBox? box = context.findRenderObject() as RenderBox?;
          final position = box?.localToGlobal(Offset.zero);

          // return Text(
          //   'Widget Position: (${position?.dx}, ${position?.dy})',
          //   style: TextStyle(fontSize: 18),
          // );

          return Container(
            width: 200,
            height: 100,
            color: Colors.blue,
            child: Center(
              child: InkWell(
                onTap: () {
                  // Get the position of the widget

                  final RenderBox box = context.findRenderObject() as RenderBox;
                  final position = box.localToGlobal(Offset.zero);
                  final bottomLeftOffset = Offset(position.dx, position.dy + box.size.height);

                  dPrint(filename: "position_of_widget", msg: "position ${position.dx}, ${position.dy}");
                  dPrint(
                      filename: "position_of_widget",
                      msg: "position ${position.dx}, ${position.dy + box.size.height}");
                  dPrint(
                      filename: "position_of_widget",
                      msg: "getWidgetOffset ${context.getWidgetOffset()}");
                  showCustomMenu(context, context.getWidgetOffset());
                },
                child: Text(
                  'Click to detect position ${position?.dx}, ${position?.dy}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void showCustomMenu(BuildContext context, Offset position) {
  final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

  showMenu<String>(
    context: context,
    position: RelativeRect.fromRect(
      position & Size(0, 0), // Position where the menu will be shown
      Offset.zero & overlay.size, // The full overlay size
    ),
    items: <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: 'option1',
        child: Text('Option 1'),
      ),
      PopupMenuItem<String>(
        value: 'option2',
        child: Text('Option 2'),
      ),
      PopupMenuItem<String>(
        value: 'option3',
        child: Text('Option 3'),
      ),
    ],
    elevation: 8,
  ).then((String? value) {
    // Handle menu item selection here
    if (value != null) {
      switch (value) {
        case 'option1':
          // Handle option 1
          break;
        case 'option2':
          // Handle option 2
          break;
        case 'option3':
          // Handle option 3
          break;
      }
    }
  });
}
