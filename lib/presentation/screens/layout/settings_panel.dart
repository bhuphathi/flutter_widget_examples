import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/responsive.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/settings_panel_content.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "settings_panel.dart";

Future<dynamic> settingsPanel(BuildContext context, WidgetRef ref) {
  final theme = ref.watch(radixThemeProvider);
  dPrint(filename: _filename, msg: "settings panel called...");

  return showGeneralDialog(
    barrierLabel: "Settings Panel",
    barrierDismissible: true,
    barrierColor: theme.secondary.withOpacity(0.6),
    transitionDuration: const Duration(milliseconds: 300),
    context: context,
    pageBuilder: (context, animation1, animation2) {
      final width = MediaQuery.of(context).size.width;
      double panelWidth = responsive(
          context: context,
          mobileLandscape: 350,
          mobilePortrait: width * 0.80,
          smallScreen: width * 0.80);
      //need consumer builder to rebuild while state change
      return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final theme = ref.watch(radixThemeProvider);
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            elevation: 15,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(color: theme.background),
              height: double.infinity,
              width: panelWidth,
              child: const SafeArea(child: SettingsPanelContent()),
            ),
          ),
        );
      });
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(animation1),
        child: child,
      );
    },
  );
}
