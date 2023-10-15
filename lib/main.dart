import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/overlay_portal.dart';

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
      home: Scaffold(
        appBar: AppBar(title: const Text('Playground - Flutter')),
        body: const Center(child: OverlayPortalExampleApp()),
      ),
    );
  }
}
