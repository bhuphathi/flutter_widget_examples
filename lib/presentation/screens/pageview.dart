import 'package:flutter/material.dart';

/// Flutter code sample for [PageView].

class PageViewExampleApp extends StatelessWidget {
  const PageViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 1, viewportFraction: 0.8);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      scrollDirection: Axis.horizontal,
      onPageChanged: (int index) {
        /// Called when the page in the center of the viewport changes.
      },
      children: const <Widget>[
        Center(
          child: Card(child: Text('First Page')),
        ),
        Center(
          child: Card(child: Text('Second Page')),
        ),
        Center(
          child: Card(child: Text('Third Page')),
        ),
      ],
    );
  }
}
