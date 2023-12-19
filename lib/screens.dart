import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/controller/screen_controller.dart';
import 'package:flutter_widget_examples/core/utils/string_exension.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/app_bar.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/bottom_status_bar.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/main_drawer.dart';

class ScreensDemo extends ConsumerStatefulWidget {
  const ScreensDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreensDemoState();
}

class _ScreensDemoState extends ConsumerState<ScreensDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Playground - Flutter'),
          ),
          body: SingleChildScrollView(
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
                for (var screen in Screens.values) widgetScreen(context, screen),
              ])),
        ));
  }

  InkWell widgetScreen(BuildContext context, Screens screen) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Scaffold(
              appBar: const AppBarWidget(),
              drawer: const MainDrawer(),
              bottomNavigationBar: const BottomStatusBar(),
              body: ScreenController.getScreen(screen));
        }),
      ),
      child: Card(
        color: Color(Random().nextInt(0xFFEEBF24)),
        child: Center(child: Text(screen.name.toCapitalize())),
      ),
    );
  }
}
