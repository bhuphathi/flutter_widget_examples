import 'package:flutter/material.dart';

class ShowCustomMenuOnTappedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          showCustomMenu(context, details.globalPosition);
        },
        child: Container(
          width: 200,
          height: 50,
          color: Colors.blue,
          child: Center(
            child: Text(
              'Tap here to show menu',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void showCustomMenu(BuildContext context, Offset position) {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

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
}
