import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/screens/overlay.dart';
import 'package:flutter_widget_examples/screens/card_expansion.dart';
import 'package:flutter_widget_examples/screens/overlay_portal.dart';
import 'package:flutter_widget_examples/screens/staggered_masonary_grid.dart';
import 'package:flutter_widget_examples/screens/staggered_gridtile_count.dart';

class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  State createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
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
                widgetScreen(context, const CardExpansionDemo()),
                widgetScreen(context, const OverlayPortalDemo()),
                widgetScreen(context, const OverlayExample()),
                widgetScreen(context, const StaggeredMasonaryGrid()),
                widgetScreen(context, const StaggeredGridTileCount()),
              ])),
        ));
  }

  InkWell widgetScreen(BuildContext context, Widget screen) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Scaffold(
              appBar: AppBar(
                title: Text(screen.toString()),
              ),
              body: screen);
        }),
      ),
      child: Card(
        color: Color(Random().nextInt(0xffffffff)),
        child: Center(child: Text(screen.toString())),
      ),
    );
  }
}
