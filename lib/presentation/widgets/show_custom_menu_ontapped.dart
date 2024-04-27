import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/utils/show_custom_menu.dart';

class ShowCustomMenuOnTappedWidget extends StatelessWidget {
  const ShowCustomMenuOnTappedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTapDown: (onTapDownDetails) {
          final RenderBox box = context.findRenderObject() as RenderBox;
          final position = box.localToGlobal(Offset.zero);
          final bottomRightOffset = Offset(position.dx + box.size.width, position.dy + box.size.height);

          showCustomMenu(context, position: onTapDownDetails.globalPosition, items: const [
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
          ], onValue: (String? value) {
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
        },
        child: Container(
          width: 200,
          height: 50,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Tap here to show menu',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
