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
                    desktopLarge: 8,
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
              ListTile(
                title: SelectableText(
                    "background ${getColorHexValue(Theme.of(context).colorScheme.background)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onBackground)),
                tileColor: Theme.of(context).colorScheme.background,
              ),
              ListTile(
                title: SelectableText(
                    "onBackground ${getColorHexValue(Theme.of(context).colorScheme.onBackground)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.background)),
                tileColor: Theme.of(context).colorScheme.onBackground,
              ),
              ListTile(
                title: SelectableText("error ${getColorHexValue(Theme.of(context).colorScheme.error)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onError)),
                tileColor: Theme.of(context).colorScheme.error,
              ),
              ListTile(
                title: SelectableText(
                    "onError ${getColorHexValue(Theme.of(context).colorScheme.onError)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.error)),
                tileColor: Theme.of(context).colorScheme.onError,
              ),
              ListTile(
                title: SelectableText(
                    "errorContainer ${getColorHexValue(Theme.of(context).colorScheme.errorContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer)),
                tileColor: Theme.of(context).colorScheme.errorContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onErrorContainer ${getColorHexValue(Theme.of(context).colorScheme.onErrorContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.errorContainer)),
                tileColor: Theme.of(context).colorScheme.onErrorContainer,
              ),
              ListTile(
                title: SelectableText(
                    "inversePrimary ${getColorHexValue(Theme.of(context).colorScheme.inversePrimary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                tileColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              ListTile(
                title: SelectableText(
                    "inverseSurface ${getColorHexValue(Theme.of(context).colorScheme.inverseSurface)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onInverseSurface)),
                tileColor: Theme.of(context).colorScheme.inverseSurface,
              ),
              ListTile(
                title: SelectableText(
                    "onInverseSurface ${getColorHexValue(Theme.of(context).colorScheme.onInverseSurface)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface)),
                tileColor: Theme.of(context).colorScheme.onInverseSurface,
              ),
              ListTile(
                title: SelectableText(
                    "outline ${getColorHexValue(Theme.of(context).colorScheme.outline)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.outlineVariant)),
                tileColor: Theme.of(context).colorScheme.outline,
              ),
              ListTile(
                title: SelectableText(
                    "outlineVariant ${getColorHexValue(Theme.of(context).colorScheme.outlineVariant)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.outline)),
                tileColor: Theme.of(context).colorScheme.outlineVariant,
              ),
              ListTile(
                title: SelectableText(
                    "primary ${getColorHexValue(Theme.of(context).colorScheme.primary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                tileColor: Theme.of(context).colorScheme.primary,
              ),
              ListTile(
                title: SelectableText(
                    "onPrimary ${getColorHexValue(Theme.of(context).colorScheme.onPrimary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                tileColor: Theme.of(context).colorScheme.onPrimary,
              ),
              ListTile(
                title: SelectableText(
                    "primaryContainer ${getColorHexValue(Theme.of(context).colorScheme.primaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)),
                tileColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onPrimaryContainer ${getColorHexValue(Theme.of(context).colorScheme.onPrimaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer)),
                tileColor: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              ListTile(
                title: SelectableText("scrim ${getColorHexValue(Theme.of(context).colorScheme.scrim)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.background)),
                tileColor: Theme.of(context).colorScheme.scrim,
              ),
              ListTile(
                title: SelectableText(
                    "Secondary ${getColorHexValue(Theme.of(context).colorScheme.secondary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
                tileColor: Theme.of(context).colorScheme.secondary,
              ),
              ListTile(
                title: SelectableText(
                    "onSecondary ${getColorHexValue(Theme.of(context).colorScheme.onSecondary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                tileColor: Theme.of(context).colorScheme.onSecondary,
              ),
              ListTile(
                title: SelectableText(
                    "secondaryContainer ${getColorHexValue(Theme.of(context).colorScheme.secondaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer)),
                tileColor: Theme.of(context).colorScheme.secondaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onSecondaryContainer ${getColorHexValue(Theme.of(context).colorScheme.onSecondaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondaryContainer)),
                tileColor: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              ListTile(
                title: SelectableText("shadow ${getColorHexValue(Theme.of(context).colorScheme.shadow)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.background)),
                tileColor: Theme.of(context).colorScheme.shadow,
              ),
              ListTile(
                title: SelectableText(
                    "surface ${getColorHexValue(Theme.of(context).colorScheme.surface)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                tileColor: Theme.of(context).colorScheme.surface,
              ),
              ListTile(
                title: SelectableText(
                    "surfaceTint ${getColorHexValue(Theme.of(context).colorScheme.surfaceTint)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                tileColor: Theme.of(context).colorScheme.surfaceTint,
              ),
              ListTile(
                title: SelectableText(
                    "surfaceVariant ${getColorHexValue(Theme.of(context).colorScheme.surfaceVariant)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                tileColor: Theme.of(context).colorScheme.surfaceVariant,
              ),
              ListTile(
                title: SelectableText(
                    "tertiary ${getColorHexValue(Theme.of(context).colorScheme.tertiary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onTertiary)),
                tileColor: Theme.of(context).colorScheme.tertiary,
              ),
              ListTile(
                title: SelectableText(
                    "onTertiary ${getColorHexValue(Theme.of(context).colorScheme.onTertiary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
                tileColor: Theme.of(context).colorScheme.onTertiary,
              ),
              ListTile(
                title: SelectableText(
                    "tertiaryContainer ${getColorHexValue(Theme.of(context).colorScheme.tertiaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer)),
                tileColor: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onTertiaryContainer ${getColorHexValue(Theme.of(context).colorScheme.onTertiaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer)),
                tileColor: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
              ListTile(
                title: SelectableText("dummy ${getColorHexValue(Theme.of(context).colorScheme.surface)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                tileColor: Theme.of(context).colorScheme.surface,
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
}
