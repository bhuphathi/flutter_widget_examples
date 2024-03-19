import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/controller/screen_controller.dart';
import 'package:flutter_widget_examples/core/utils/string_extension.dart';
import 'package:flutter_widget_examples/temp/searchbar.dart';

class ScreensDemo extends ConsumerStatefulWidget {
  const ScreensDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreensDemoState();
}

class _ScreensDemoState extends ConsumerState<ScreensDemo> {
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SearchBarWidget(
          title: "search",
          setSearchKeyword: (value) {
            setState(() {
              searchText = value;
            });
          },
        ),
        Expanded(
          child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // childAspectRatio: 4,
                mainAxisExtent: 65,
                crossAxisSpacing: 8,
                mainAxisSpacing: 4,
              ),
              children: [
                for (var screen in Screens.values)
                  if (screen.name.trim().toLowerCase().contains(searchText.trim().toLowerCase()))
                    widgetScreen(context, screen),
              ]),
        ),
      ],
    );
  }

  InkWell widgetScreen(BuildContext context, Screens screen) {
    return InkWell(
      onTap: () {
        ref.read(screenControllerProvider.notifier).switchScreen(screen: screen);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return Scaffold(
        //         appBar: const AppBarWidget(),
        //         drawer: const MainDrawer(),
        //         bottomNavigationBar: const BottomStatusBar(),
        //         body: ScreenController.getScreen(screen));
        //   }),
        // );
      },
      child: Card(
        color: Color(Random().nextInt(0xFFEEBFFF)),
        child: Center(child: Text(screen.name.splitCamelCase())),
      ),
    );
  }
}
