import 'package:flutter_widget_examples/controller/theme_controller.dart';
import 'package:flutter_widget_examples/core/providers/brightness_provider.dart';
import 'package:flutter_widget_examples/core/providers/themename_provider.dart';
import 'package:flutter_widget_examples/core/themes/radix_theme.dart';
import 'package:flutter_widget_examples/core/utils/string_exension.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "color_swatch.dart";

class ColorSwatchWidget extends ConsumerStatefulWidget {
  const ColorSwatchWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ColorSwatchWidgetState();
}

class _ColorSwatchWidgetState extends ConsumerState<ColorSwatchWidget> {
  @override
  Widget build(BuildContext context) {
    final brightness = ref.watch(brightnessProvider);
    final currentTheme = ref.watch(themeNameProvider);
    final themeNames = RadixTheme.themeNames;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        height: 160,
        child: GridView.builder(
          itemCount: themeNames.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9, childAspectRatio: 1),
          itemBuilder: (context, index) {
            final themeName = themeNames[index];
            final theme = RadixTheme(brightness, themeName);

            return InkWell(
              onTap: () {
                ref.read(themeControllerProvider).setThemeName(index);
              },
              child: Tooltip(
                message: themeName.toString().split(".")[1].toCapitalize(),
                child: Card(
                    color: theme.base,
                    elevation: 0.5,
                    shape: const CircleBorder(),
                    child: currentTheme == themeName
                        ? Icon(FluentIcons.checkmark_24_filled, color: theme.baseText)
                        : null),
              ),
            );
          },
        ),
      ),
    );
  }
}
