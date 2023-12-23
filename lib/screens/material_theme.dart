import 'package:flutter_widget_examples/core/utils/responsive.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "test_screen.dart";

class MaterialThemeDemo extends ConsumerWidget {
  const MaterialThemeDemo({super.key});
  String getColorHexValue(Color color) {
    var clr = color.toString().replaceAll("Color(", "");
    return clr.toString().replaceAll(RegExp(r'[()]'), "");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dPrint(filename: _filename, msg: "Material Theme widget build...");

    return Column(
      children: [
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: responsive(
                    context: context,
                    desktopLarge: 6,
                    desktop: 6,
                    tabletLandscape: 4,
                    mobileLandscape: 3,
                    mobilePortrait: 2,
                    smallScreen: 1),
                // childAspectRatio: 2,
                mainAxisExtent: 80,
                crossAxisSpacing: 4,
                mainAxisSpacing: 2),
            children: [
              colorTile(
                color: (color: Theme.of(context).colorScheme.background, name: "background"),
                textOrOnColor: (color: Theme.of(context).colorScheme.onBackground, name: "onBackground"),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.primary, name: "primary"),
                textOrOnColor: (color: Theme.of(context).colorScheme.onPrimary, name: "onPrimary"),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.inversePrimary, name: "inversePrimary"),
                textOrOnColor: (color: Theme.of(context).colorScheme.primary, name: "primary"),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.primaryContainer, name: "primaryContainer"),
                textOrOnColor: (
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  name: "onPrimaryContainer"
                ),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.secondary, name: "secondary"),
                textOrOnColor: (color: Theme.of(context).colorScheme.onSecondary, name: "onSecondary"),
              ),
              colorTile(
                color: (
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  name: "secondaryContainer"
                ),
                textOrOnColor: (
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  name: "onSecondaryContainer"
                ),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.error, name: "error"),
                textOrOnColor: (color: Theme.of(context).colorScheme.onError, name: "onError"),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.errorContainer, name: "errorContainer"),
                textOrOnColor: (
                  color: Theme.of(context).colorScheme.onErrorContainer,
                  name: "onErrorContainer"
                ),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.tertiary, name: "tertiary"),
                textOrOnColor: (color: Theme.of(context).colorScheme.onTertiary, name: "onTertiary"),
              ),
              colorTile(
                color: (
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  name: "tertiaryContainer"
                ),
                textOrOnColor: (
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  name: "onTertiaryContainer"
                ),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.surface, name: "surface"),
                textOrOnColor: (color: Theme.of(context).colorScheme.onSurface, name: "onSurface"),
              ),
              colorTile(color: (
                color: Theme.of(context).colorScheme.inverseSurface,
                name: "inverseSurface"
              ), textOrOnColor: (
                color: Theme.of(context).colorScheme.onInverseSurface,
                name: "onInverseSurface"
              )),
              colorTile(color: (
                color: Theme.of(context).colorScheme.surfaceVariant,
                name: "surfaceVariant"
              ), textOrOnColor: (
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                name: "onSurfaceVariant"
              )),
              colorTile(color: (
                color: Theme.of(context).colorScheme.outline,
                name: "outline"
              ), textOrOnColor: (
                color: Theme.of(context).colorScheme.outlineVariant,
                name: "outlineVariant"
              )),
              colorTile(
                color: (color: Theme.of(context).colorScheme.outlineVariant, name: "outlineVariant"),
                textOrOnColor: (color: Theme.of(context).colorScheme.outline, name: "outline"),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.scrim, name: "scrim"),
                textOrOnColor: (color: Theme.of(context).colorScheme.background, name: "background"),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.shadow, name: "shadow"),
                textOrOnColor: (color: Theme.of(context).colorScheme.background, name: "background"),
              ),
              colorTile(
                color: (color: Theme.of(context).colorScheme.surfaceTint, name: "surfaceTint"),
                textOrOnColor: (color: Theme.of(context).colorScheme.onPrimary, name: "onPrimary"),
              ),
              ListTile(
                title: SelectableText("dummy ${getColorHexValue(Theme.of(context).colorScheme.surface)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                tileColor: Theme.of(context).colorScheme.surface,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget colorTile({
    required ({Color color, String name}) color,
    required ({Color color, String name}) textOrOnColor,
    ({Color color, String name})? onColor,
    ({Color color, String name})? colorA,
  }) {
    if (colorA != null) {
      return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(children: [
          Container(color: color.color),
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 2),
            child: colorTexts(color, textOrOnColor, onColor, colorA),
          ),
          Positioned.directional(
            end: 0,
            top: 0,
            bottom: 0,
            textDirection: TextDirection.ltr,
            child: Container(
              color: colorA.color,
              width: constraints.maxWidth * 0.35,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectableText(
                  "${getColorHexValue(colorA.color)}:\n${colorA.name}",
                  style: TextStyle(color: textOrOnColor.color, fontSize: 12),
                ),
              ),
            ),
          ),
        ]);
      });
    }
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      tileColor: color.color,
      title: colorTexts(color, textOrOnColor, onColor, null),
    );
  }

  Widget colorTexts(
    ({Color color, String name}) color,
    ({Color color, String name}) textOrOnColor,
    ({Color color, String name})? onColor,
    ({Color color, String name})? colorA,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: Card(
                  color: color.color,
                  shape: const RoundedRectangleBorder(),
                  margin: EdgeInsets.zero,
                ),
              ),
              const SizedBox(width: 6),
              SelectableText("${getColorHexValue(color.color)} : ${color.name}",
                  style: TextStyle(color: textOrOnColor.color)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: Card(
                  color: textOrOnColor.color,
                  shape: const RoundedRectangleBorder(),
                  margin: EdgeInsets.zero,
                ),
              ),
              const SizedBox(width: 6),
              SelectableText("${getColorHexValue(textOrOnColor.color)} : ${textOrOnColor.name}",
                  style: TextStyle(color: textOrOnColor.color)),
            ],
          ),
          const SizedBox(height: 4),
          if (onColor != null)
            Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: Card(
                    color: onColor.color,
                    shape: const RoundedRectangleBorder(),
                    margin: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(width: 6),
                SelectableText("${getColorHexValue(onColor.color)} : ${onColor.name}",
                    style: TextStyle(color: onColor.color)),
              ],
            ),
          const SizedBox(height: 4),
          if (colorA != null)
            Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: Card(
                    color: colorA.color,
                    shape: const RoundedRectangleBorder(),
                    margin: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(width: 6),
                SelectableText("${getColorHexValue(colorA.color)} : ${colorA.name}",
                    style: TextStyle(color: colorA.color)),
              ],
            ),
        ],
      ),
    );
  }
}
