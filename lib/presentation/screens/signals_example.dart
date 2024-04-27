import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:signals/signals_flutter.dart';

const _filename = "signals_example.dart";

final counter2 = signal(0, autoDispose: true);

class SignalsExample extends StatefulWidget {
  const SignalsExample({super.key});

  @override
  SignalsExampleState createState() => SignalsExampleState();
}

class SignalsExampleState extends State<SignalsExample> {
  // late final counter = createSignal(context, 0);
  final counter = signal(0, autoDispose: true);

  @override
  void dispose() {
    dPrint(filename: _filename, msg: "SignalsExampleState dispose...");
    counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dPrint(filename: _filename, msg: "Signals Widget Build...");

    counter.onDispose(() {
      dPrint(filename: _filename, msg: "counter signals disposed...");
    });
    counter2.onDispose(() {
      dPrint(filename: _filename, msg: "PublicCounter signals disposed...");
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No Watch Counter: ${counter.value}"),
            Text("No Watch PublicCounter: ${counter2()}"),
            Builder(
              builder: (context) {
                // Called every time the signal changes
                final count = counter.watch(context);
                return Text('$count');
              },
            ),
            Watch((context) {
              return Text('Counter: $counter');
            }),
            Watch((context) {
              return Text('PublicCounter: $counter2');
            }),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: const Text("No rebuild..."),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
          counter2.value++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
