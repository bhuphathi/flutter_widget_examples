import 'package:flutter_widget_examples/screens.dart';
import 'package:flutter_widget_examples/screens/card_expansion.dart';
import 'package:flutter_widget_examples/screens/excel_file_view.dart';
import 'package:flutter_widget_examples/screens/overlay_portal.dart';
import 'package:flutter_widget_examples/screens/staggered_gridtile_count.dart';
import 'package:flutter_widget_examples/screens/staggered_masonary_grid.dart';
import 'package:flutter_widget_examples/temp/fluent_icons.dart';
import 'package:flutter_widget_examples/temp/font_awesome_gallery.dart';
import 'package:flutter_widget_examples/temp/gradient_bg_screen.dart';
import 'package:flutter_widget_examples/temp/lifecycle.dart';
import 'package:flutter_widget_examples/temp/radix_test_screen.dart';
import 'package:flutter_widget_examples/temp/read_write_file.dart';
import 'package:flutter_widget_examples/temp/side_panel_example.dart';
import 'package:flutter_widget_examples/temp/test_screen.dart';
import 'package:flutter_widget_examples/presentation/screens/home.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Screens {
  fluentUIShowcaseWidgetDemo,
  fontAwesomeGalleryDemo,
  gradientBgDemo,
  home,
  lifeCycleDemo,
  radixTestScreenDemo,
  readWriteDemo,
  sidePanelExample,
  testScreenDemo,
  screens,
  excelFile,
  cardExpansionDemo,
  overlayPortalDemo,
  staggeredMasonaryGrid,
  staggeredGridTileCount,
}

/// Home() screen is default
final screenControllerProvider = StateNotifierProvider<ScreenNotifier, ScreenController>(
    (ref) => ScreenNotifier(ScreenController(ref: ref), ref));

class ScreenNotifier extends StateNotifier<ScreenController> {
  Ref ref;
  ScreenNotifier(super.state, this.ref);

  void switchScreen({required Screens screen, Map<String, dynamic>? args}) {
    state = ScreenController(ref: ref, screenName: screen, args: args);
  }
}

class ScreenController {
  late Widget _currentScreen;
  final Ref ref;
  final Screens _screenName;
  final Map<String, dynamic>? _args;

  ScreenController({
    required this.ref,
    Screens? screenName = Screens.home,
    Map<String, dynamic>? args,
  })  : _screenName = screenName!,
        _args = args {
    _switchScreen();
  }

  Widget get currentScreen => _currentScreen;
  Screens get screenName => _screenName;

  void _switchScreen() {
    switch (_screenName) {
      case Screens.fluentUIShowcaseWidgetDemo:
        _currentScreen = const FluentUIShowcaseWidget();
        break;
      case Screens.fontAwesomeGalleryDemo:
        _currentScreen = const FontAwesomeGallery();
        break;
      case Screens.gradientBgDemo:
        _currentScreen = const GradientBg();
        break;
      case Screens.home:
        _currentScreen = const Home();
        break;
      case Screens.lifeCycleDemo:
        _currentScreen = const Lifecycle();
        break;
      case Screens.radixTestScreenDemo:
        _currentScreen = const RadixTestScreen();
        break;
      case Screens.readWriteDemo:
        // assert(_args?[0] != null, "CounterStorage() class need as args[0] for ReadWriteDemo screen");
        _currentScreen = ReadWriteDemo(storage: CounterStorage());
        break;
      case Screens.sidePanelExample:
        _currentScreen = const SidePanelExample();
        break;
      case Screens.testScreenDemo:
        _currentScreen = const TestScreen();
        break;
      case Screens.screens:
        _currentScreen = const ScreensDemo();
        break;
      case Screens.excelFile:
        _currentScreen = const ExcelFileDemo();
        break;
      case Screens.cardExpansionDemo:
        _currentScreen = const CardExpansionDemo();
        break;
      case Screens.overlayPortalDemo:
        _currentScreen = const OverlayPortalDemo();
        break;
      case Screens.staggeredMasonaryGrid:
        _currentScreen = const StaggeredMasonaryGrid();
        break;
      case Screens.staggeredGridTileCount:
        _currentScreen = const StaggeredGridTileCount();
        break;
      default:
        _currentScreen = const Home();
        break;
    }
  }
  static Widget getScreen(Screens screen) {
    switch (screen) {
      case Screens.fluentUIShowcaseWidgetDemo:
        return const FluentUIShowcaseWidget();
      case Screens.fontAwesomeGalleryDemo:
        return const FontAwesomeGallery();
      case Screens.gradientBgDemo:
        return const GradientBg();
      case Screens.home:
        return const Home();
      case Screens.lifeCycleDemo:
        return const Lifecycle();
      case Screens.radixTestScreenDemo:
        return const RadixTestScreen();
      case Screens.readWriteDemo:
        // assert(_args?[0] != null, "CounterStorage() class need as args[0] for ReadWriteDemo screen");
        return ReadWriteDemo(storage: CounterStorage());
      case Screens.sidePanelExample:
        return const SidePanelExample();
      case Screens.testScreenDemo:
        return const TestScreen();
      case Screens.screens:
        return const ScreensDemo();
      case Screens.excelFile:
        return const ExcelFileDemo();
      case Screens.cardExpansionDemo:
        return const CardExpansionDemo();
      case Screens.overlayPortalDemo:
        return const OverlayPortalDemo();
      case Screens.staggeredMasonaryGrid:
        return const StaggeredMasonaryGrid();
      case Screens.staggeredGridTileCount:
        return const StaggeredGridTileCount();
      default:
        return const Home();
    }
  }
}
