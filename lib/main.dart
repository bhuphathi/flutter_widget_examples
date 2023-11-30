import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/screens/card_expansion.dart';
import 'package:flutter_widget_examples/screens/overlay_portal.dart';
import 'package:flutter_widget_examples/screens.dart';

void main() {
  runApp(const FlutterWidgets());
}

class FlutterWidgets extends StatefulWidget {
  const FlutterWidgets({Key? key}) : super(key: key);

  @override
  State createState() => _FlutterWidgetsState();
}

class _FlutterWidgetsState extends State<FlutterWidgets> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
        ),
      ),
      home: Screens(),
    );
  }
}
