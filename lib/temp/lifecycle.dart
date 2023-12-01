import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const _filename = "lifecycle.dart";

class Lifecycle extends StatefulWidget {
  const Lifecycle({super.key});

  @override
  State<StatefulWidget> createState() => _LifecycleState();
}

class _LifecycleState extends State<Lifecycle> {
  @override
  void activate() {
    super.activate();
    dPrint(filename: _filename, msg: "activate", tag: "lifecycle");
  }

  @override
  void deactivate() {
    super.deactivate();
    dPrint(filename: _filename, msg: "deactivate", tag: "lifecycle");
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    dPrint(filename: _filename, msg: "debugFillProperties", tag: "lifecycle");
  }

  @override
  void dispose() {
    super.dispose();
    dPrint(filename: _filename, msg: "dispose", tag: "lifecycle");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dPrint(filename: _filename, msg: "WidgetsBinding.instance.addPostFrameCallback", tag: "lifecycle");
    });
    dPrint(filename: _filename, msg: "initState", tag: "lifecycle");
  }

  @override
  void reassemble() {
    super.reassemble();
    dPrint(filename: _filename, msg: "reassemble", tag: "lifecycle");
  }

  @override
  void didUpdateWidget(covariant Lifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    dPrint(filename: _filename, msg: "didUpdateWidget", tag: "lifecycle");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dPrint(filename: _filename, msg: "didChangeDependencies", tag: "lifecycle");
  }

  @override
  Widget build(BuildContext context) {
    dPrint(filename: _filename, msg: "build mounted: $mounted", tag: "lifecycle");
    return const Text("Life Cycle...");
  }
}
