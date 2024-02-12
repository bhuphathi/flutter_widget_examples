import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';

/// Flutter code sample for [PhysicalKeyboardKey].

class PhysicalKeyboardEventsExample extends StatefulWidget {
  const PhysicalKeyboardEventsExample({super.key});

  @override
  State<PhysicalKeyboardEventsExample> createState() => _PhysicalKeyboardEventsExampleState();
}

class _PhysicalKeyboardEventsExampleState extends State<PhysicalKeyboardEventsExample> {
// The node used to request the keyboard focus.
  final FocusNode _focusNode = FocusNode();
// The message to display.
  String? _message;

// Focus nodes need to be disposed.
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

// Handles the key events from the RawKeyboardListener and update the
// _message.
  KeyEventResult _handleKeyEvent(FocusNode node, RawKeyEvent event) {
    setState(() {
      if (event.physicalKey == PhysicalKeyboardKey.keyA) {
        _message = 'Pressed the key next to CAPS LOCK!';
      } else {
        if (kReleaseMode) {
          _message =
              'Not the key next to CAPS LOCK: Pressed 0x${event.physicalKey.usbHidUsage.toRadixString(16)}';
        } else {
          // As the name implies, the debugName will only print useful
          // information in debug mode.
          _message = 'Not the key next to CAPS LOCK: Pressed ${event.physicalKey.debugName}';
        }
      }
    });
    return event.physicalKey == PhysicalKeyboardKey.keyA
        ? KeyEventResult.handled
        : KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    dPrint(filename: "physical keyboard events", msg: _message);
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: DefaultTextStyle(
        style: textTheme.headlineMedium!,
        child: Focus(
          focusNode: _focusNode,
          onKey: _handleKeyEvent,
          child: ListenableBuilder(
            listenable: _focusNode,
            builder: (BuildContext context, Widget? child) {
              // if (!_focusNode.hasFocus) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(_focusNode);
                    },
                    child: TextFormField(
                        initialValue: 'Press a key', decoration: InputDecoration(errorText: _message)),
                  ),
                  Text(_message ?? 'Press a key'),
                ],
              );
              // }
              // return Text(_message ?? 'Press a key');
            },
          ),
        ),
      ),
    );
  }
}
