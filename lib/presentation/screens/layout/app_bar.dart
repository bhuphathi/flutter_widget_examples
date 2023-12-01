import 'package:flutter_widget_examples/core/providers/error_provider.dart';
import 'package:flutter_widget_examples/presentation/widgets/error_dialog.dart';
import 'package:flutter_widget_examples/controller/theme_controller.dart';
import 'package:flutter_widget_examples/core/providers/brightness_provider.dart';
import 'package:flutter_widget_examples/controller/screen_controller.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/user_profile_button.dart';
import 'package:flutter_widget_examples/temp/themes.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "app_bar.dart";

// https://stackoverflow.com/questions/53294006/how-to-create-a-custom-appbar-widget
class AppBarWidget extends ConsumerStatefulWidget implements PreferredSizeWidget {
  //'kToolbarHeight' const is from material.dart
  const AppBarWidget({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0
//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight), super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends ConsumerState<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);
    final brightness = ref.watch(brightnessProvider);
    dPrint(filename: _filename, msg: "App bar widget build...");

    return AppBar(
      backgroundColor: theme.base.step10,
      foregroundColor: theme.baseText,
      elevation: 1,
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () =>
                ref.read(screenControllerProvider.notifier).switchScreen(screen: Screens.home),
          ),
          const Expanded(
            child: Center(child: Text('Flutter Widgets Demo')),
          ),
          //display error alert dialog
          Builder(builder: (context) {
            final error = ref.watch(errorProvider);
            Future.delayed(const Duration(milliseconds: 10), () {
              if (error != null) errorDialog(ref);
            });
            return const Text("");
          })
        ],
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              //   constraints: BoxConstraints.loose(const Size.fromWidth(30)),
              splashRadius: 24,
              onPressed: () {
                ref.read(themeControllerProvider).toggleDarkTheme();
                //below theme is not used
                ref.read(themeProvider.notifier).toggleDarkThemeState();
              },
              icon: Icon(
                  brightness == Brightness.light ? Icons.sunny : FluentIcons.weather_moon_24_filled,
                  size: 20),
            ),
            const UserProfileButton(),
          ],
        )
      ],
    );
  }
}
