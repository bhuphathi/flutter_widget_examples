import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/app_bar.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/bottom_status_bar.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/main_drawer.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter_widget_examples/controller/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "body_content.dart";

class BodyContent extends ConsumerStatefulWidget {
  const BodyContent({
    super.key,
  });

  @override
  ConsumerState<BodyContent> createState() => _BodyContent();
}

class _BodyContent extends ConsumerState<BodyContent> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    dPrint(filename: _filename, msg: "initstate...");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        dPrint(filename: _filename, msg: "app resumed...");
        //if permission request is not already in progress then check for permission
        
        break;
      case AppLifecycleState.inactive:
        dPrint(filename: _filename, msg: "app inactive...");
        break;
      case AppLifecycleState.paused:
        dPrint(filename: _filename, msg: "app paused...");
        break;
      case AppLifecycleState.detached:
        dPrint(filename: _filename, msg: "app detached...");
        break;
      case AppLifecycleState.hidden:
        dPrint(filename: _filename, msg: "app hidden...");
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);

    /// Home() screen is default
    final screenController = ref.watch(screenControllerProvider);
    dPrint(filename: _filename, msg: "Body content widget build...");

    return Scaffold(
        key: _scaffoldKey,
        appBar: const AppBarWidget(),
        bottomNavigationBar: const BottomStatusBar(),
        drawer: const MainDrawer(),
        backgroundColor: theme.background,
        body: screenController.currentScreen);
  }
}
