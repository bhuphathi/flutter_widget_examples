import 'package:flutter_widget_examples/presentation/screens/excel_data_table.dart';
import 'package:flutter_widget_examples/presentation/screens/excel_paginated_data_table.dart';
import 'package:flutter_widget_examples/presentation/screens/merged_grid_view.dart';
import 'package:flutter_widget_examples/presentation/screens/pageview.dart';
import 'package:flutter_widget_examples/presentation/screens/pageview_animated_cards.dart';
import 'package:flutter_widget_examples/presentation/screens/speech.dart';
import 'package:flutter_widget_examples/presentation/screens/tabs.dart';
import 'package:flutter_widget_examples/presentation/screens/volume.dart';
import 'package:flutter_widget_examples/presentation/widgets/position_of_object.dart';
import 'package:flutter_widget_examples/presentation/widgets/show_custom_menu_ontapped.dart';
import 'package:flutter_widget_examples/screens.dart';
import 'package:flutter_widget_examples/presentation/screens/card_expansion.dart';
import 'package:flutter_widget_examples/presentation/screens/excel_file_view.dart';
import 'package:flutter_widget_examples/presentation/screens/material_theme.dart';
import 'package:flutter_widget_examples/presentation/screens/overlay_portal.dart';
import 'package:flutter_widget_examples/presentation/screens/physical_keyboard_events.dart';
import 'package:flutter_widget_examples/presentation/screens/staggered_gridtile_count.dart';
import 'package:flutter_widget_examples/presentation/screens/staggered_masonary_grid.dart';
import 'package:flutter_widget_examples/presentation/widgets/custom_datatable.dart';
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
  screens,
  home,
  fluentUIShowcaseWidgetDemo,
  fontAwesomeGalleryDemo,
  gradientBgDemo,
  lifeCycleDemo,
  radixTestScreenDemo,
  readWriteDemo,
  sidePanelExample,
  customMaterialTheme,
  materialThemeDemo,
  cardExpansionDemo,
  overlayPortalDemo,
  staggeredMasonaryGrid,
  staggeredGridTileCount,
  customDatatable,
  excelFile,
  excelDatatableView,
  excelPaginatedDatatableView,
  physicalKeyboardEvents,
  pageViewExampleApp,
  tabBarApp,
  tabBarApp2,
  tabBarApp3,
  tabBarApp4,
  pageViewAnimatedCards,
  pageViewAnimatedCards2,
  volumePage,
  speechPage,
  mergedGridView,
  showCustomMenuOnTappedWidget,
  positionOfWidget,
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
    _currentScreen = getScreen(_screenName);
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
      case Screens.customMaterialTheme:
        return const CustomMaterialTheme();
      case Screens.materialThemeDemo:
        return const MaterialThemeDemo();
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
      case Screens.customDatatable:
        return const CustomDataTablePage();
      case Screens.excelDatatableView:
        return const ExcelDatatableView();
      case Screens.excelPaginatedDatatableView:
        return const ExcelPaginatedDatatableView();
      case Screens.physicalKeyboardEvents:
        return const PhysicalKeyboardEventsExample();
      case Screens.pageViewExampleApp:
        return const PageViewExampleApp();
      case Screens.tabBarApp:
        return const TabBarExample();
      case Screens.tabBarApp2:
        return const TabBarExample2();
      case Screens.tabBarApp3:
        return const TabBarExample3();
      case Screens.pageViewAnimatedCards:
        return const PageViewAnimatedCards();
      case Screens.pageViewAnimatedCards2:
        return const PageViewAnimatedCards2();
      case Screens.tabBarApp4:
        return const TabBarExample4();
      case Screens.volumePage:
        return const VolumeApp();
      case Screens.speechPage:
        return const MySpeechApp();
      case Screens.mergedGridView:
        return const MergedGridView();
      case Screens.showCustomMenuOnTappedWidget:
        return ShowCustomMenuOnTappedWidget();
      case Screens.positionOfWidget:
        return HomePage();
      default:
        return const Home();
    }
  }
}
