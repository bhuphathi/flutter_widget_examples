import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:signals/signals_flutter.dart';

class SignalsExample extends StatefulWidget {
  const SignalsExample({super.key});

  @override
  SignalsExampleState createState() => SignalsExampleState();
}

class SignalsExampleState extends State<SignalsExample> with SignalsAutoDisposeMixin {
  late final counter = createSignal(context, 0);

  @override
  Widget build(BuildContext context) {
    dPrint(filename: "SignalsExample.dart", msg: "Signals Widget Build...");
    return Scaffold(
      body: Center(
        child: Watch((context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Watch: $counter'),
              // Text('Counter: $counter'),
              ElevatedButton(
                onPressed: () => counter.value++,
                child: const Text('Increment'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
