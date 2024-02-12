import 'package:flutter/material.dart';

class CardExpansionDemo extends StatefulWidget {
  const CardExpansionDemo({super.key});
  @override
  State createState() => _CardExpansionDemoState();
}

class _CardExpansionDemoState extends State<CardExpansionDemo> {
  bool isExpanded = false;

  void toggleCard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: toggleCard,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 5000),
            curve: Curves.linear,
            width: isExpanded ? 300 : 200,
            height: isExpanded ? 200 : 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(isExpanded ? 20.0 : 10.0),
            ),
            child: Center(
              child: AnimatedCrossFade(
                firstChild: const Text(
                  'Tap to Expand',
                  style: TextStyle(color: Colors.white),
                ),
                secondChild: const Text(
                  'Expanded Card',
                  style: TextStyle(color: Colors.white),
                ),
                crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
