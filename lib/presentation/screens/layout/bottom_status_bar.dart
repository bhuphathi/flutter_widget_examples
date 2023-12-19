import 'package:flutter_widget_examples/controller/role_controller.dart';
import 'package:flutter_widget_examples/controller/screen_controller.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/app_bar.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/main_drawer.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/settings_panel.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const _filename = "bottom_status_bar.dart";

class BottomStatusBar extends ConsumerStatefulWidget {
  const BottomStatusBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomStatusBarState();
}

class _BottomStatusBarState extends ConsumerState<BottomStatusBar> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);
    final role = ref.watch(roleControllerProvider);
    final screenControllerNotifier = ref.read(screenControllerProvider.notifier);
    dPrint(filename: _filename, msg: "Bottom Status Bar Widget build...");
    //need conatiner to show bottom bar background and need ink to show icon button's splash radius
    // ignore: avoid_unnecessary_containers
    return Ink(
      decoration: BoxDecoration(
        color: theme.subtleBackground,
        boxShadow: [
          BoxShadow(
            color: theme.secondary.step8,
            offset: const Offset(0, -0.4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              splashRadius: 24,
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  pushScreen(context, Screens.home);
                } else {
                  screenControllerNotifier.switchScreen(screen: Screens.home);
                }
              },
              icon: const Icon(
                Icons.home,
                size: 20,
              ),
              tooltip: "Home",
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () => pushScreen(context, Screens.lifeCycleDemo),
              icon: const Icon(
                FontAwesomeIcons.link,
                size: 18,
              ),
              tooltip: "Lifecycle",
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () => pushScreen(context, Screens.radixTestScreenDemo),
              icon: const Icon(
                FluentIcons.color_24_regular,
                size: 18,
              ),
              tooltip: "Radix Theme",
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () => pushScreen(context, Screens.customMaterialTheme),
              icon: const Icon(
                FluentIcons.color_background_20_regular,
                size: 18,
              ),
              tooltip: "Custom Material Theme",
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () => pushScreen(context, Screens.materialThemeDemo),
              icon: const Icon(
                FluentIcons.color_background_20_filled,
                size: 18,
              ),
              tooltip: "Material Theme",
            ),
            TextButton(
              onPressed: () => pushScreen(context, Screens.fontAwesomeGalleryDemo),
              child: const Tooltip(message: "Font Awesome", child: Text("FA")),
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () => pushScreen(context, Screens.fluentUIShowcaseWidgetDemo),
              icon: const Icon(
                FluentIcons.fluent_24_regular,
                size: 18,
              ),
              tooltip: "Fluent UI Showcase",
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () => pushScreen(context, Screens.sidePanelExample),
              icon: const Icon(
                Icons.file_copy,
                size: 18,
              ),
              tooltip: "Side Panel Example",
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () => pushScreen(context, Screens.readWriteDemo),
              icon: const Icon(
                Icons.enhanced_encryption_outlined,
                size: 18,
              ),
              tooltip: "Read Write Demo",
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () => pushScreen(context, Screens.screens),
              icon: const Icon(
                Icons.screen_lock_landscape,
                size: 18,
              ),
              tooltip: "Screens",
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () {
                settingsPanel(context, ref);
              },
              icon: const Icon(
                Icons.settings,
                size: 18,
              ),
              tooltip: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  void pushScreen(BuildContext context, Screens screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Scaffold(
            appBar: const AppBarWidget(),
            drawer: const MainDrawer(),
            bottomNavigationBar: const BottomStatusBar(),
            body: ScreenController.getScreen(screen));
      }),
    );
  }
}
