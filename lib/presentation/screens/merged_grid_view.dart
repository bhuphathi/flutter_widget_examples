import 'package:flutter/material.dart';

class MergedGridView extends StatelessWidget {
  const MergedGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjust as per your need
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        // Add logic to determine merged cells
        if (index == 1 || index == 4) {
          // Merged cells, return a placeholder or desired widget
          return Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Cell $index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ); // Adjust size, color, etc. as needed
        } else if (index == 3 || index == 4 || index == 5) {
          return Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Cell $index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        } else if (index == 7 || index == 8) {
          return Container(
            color: Colors.yellow,
            child: Center(
              child: Text(
                'Cell $index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          // Normal cell
          return Container(
            color: Colors.purple,
            margin: const EdgeInsets.all(4.0),
            child: Center(
              child: Text(
                'Cell $index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
    );
  }
}
