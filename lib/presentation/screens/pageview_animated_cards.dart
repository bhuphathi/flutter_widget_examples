import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//https://stackoverflow.com/questions/51607440/horizontally-scrollable-cards-with-snap-effect-in-flutter
class PageViewAnimatedCards extends ConsumerStatefulWidget {
  const PageViewAnimatedCards({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageViewAnimatedCards2State();
}

class _PageViewAnimatedCarsState extends ConsumerState<PageViewAnimatedCards> {
  final PageController _controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100, // Card height
          child: PageView.builder(
            itemCount: 10,
            controller: _controller,
            itemBuilder: (context, index) {
              return ListenableBuilder(
                listenable: _controller,
                builder: (context, child) {
                  double factor = 1;
                  if (_controller.position.hasContentDimensions) {
                    factor = 1 - (_controller.page! - index).abs();
                  }

                  return Center(
                    child: SizedBox(
                      height: 70 + (factor * 30),
                      child: Card(
                        elevation: 4,
                        child: Center(child: Text('Card $index')),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class PageViewAnimatedCards2 extends ConsumerStatefulWidget {
  const PageViewAnimatedCards2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageViewAnimatedCards2State();
}

class _PageViewAnimatedCards2State extends ConsumerState<PageViewAnimatedCards2> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100, // Card height
        child: PageView.builder(
          itemCount: 10,
          controller: PageController(viewportFraction: 0.8),
          onPageChanged: (index) => setState(() => _index = index),
          itemBuilder: (context, index) {
            return AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              padding: EdgeInsets.all(_index == index ? 0.0 : 8.0),
              child: Card(
                elevation: 4,
                child: Center(child: Text('Card $index')),
              ),
            );
          },
        ),
      ),
    );
  }
}
