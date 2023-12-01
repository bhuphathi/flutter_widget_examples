import 'package:flutter_widget_examples/presentation/screens/body_content.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

const _filename = "main_screen.dart";

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dPrint(filename: _filename, msg: "Main screen widget build...");

    return const KeyboardDismisser(
      gestures: [
        GestureType.onTap,
      ],
      child: BodyContent(),
    );
  }
}
