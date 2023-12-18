import 'package:flutter_widget_examples/core/utils/responsive.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "test_screen.dart";

class MaterialThemeDemo extends ConsumerWidget {
  const MaterialThemeDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String replaceString(Color color) {
      return color.toString().replaceAll(RegExp(r'[Color\W]'), "");
    }

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
                    "background ${replaceString(Theme.of(context).colorScheme.background)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onBackground)),
                tileColor: Theme.of(context).colorScheme.background,
              ),
              ListTile(
                title: SelectableText(
                    "onBackground ${replaceString(Theme.of(context).colorScheme.onBackground)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.background)),
                tileColor: Theme.of(context).colorScheme.onBackground,
              ),
              ListTile(
                title: SelectableText("surface ${replaceString(Theme.of(context).colorScheme.surface)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                tileColor: Theme.of(context).colorScheme.surface,
              ),
              ListTile(
                title: SelectableText(
                    "onSurface ${replaceString(Theme.of(context).colorScheme.onSurface)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.surface)),
                tileColor: Theme.of(context).colorScheme.onSurface,
              ),
              ListTile(
                title: SelectableText(
                    "surfaceTint ${replaceString(Theme.of(context).colorScheme.surfaceTint)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                tileColor: Theme.of(context).colorScheme.surfaceTint,
              ),
              ListTile(
                title: SelectableText("Primary ${replaceString(Theme.of(context).colorScheme.primary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                tileColor: Theme.of(context).colorScheme.primary,
              ),
              ListTile(
                title: SelectableText(
                    "onPrimary ${replaceString(Theme.of(context).colorScheme.onPrimary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                tileColor: Theme.of(context).colorScheme.onPrimary,
              ),
              ListTile(
                title: SelectableText(
                    "primaryContainer ${replaceString(Theme.of(context).colorScheme.primaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)),
                tileColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onPrimaryContainer ${replaceString(Theme.of(context).colorScheme.onPrimaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer)),
                tileColor: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "inversePrimary ${replaceString(Theme.of(context).colorScheme.inversePrimary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                tileColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              ListTile(
                title: SelectableText(
                    "Secondary ${replaceString(Theme.of(context).colorScheme.secondary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
                tileColor: Theme.of(context).colorScheme.secondary,
              ),
              ListTile(
                title: SelectableText(
                    "onSecondary ${replaceString(Theme.of(context).colorScheme.onSecondary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                tileColor: Theme.of(context).colorScheme.onSecondary,
              ),
              ListTile(
                title: SelectableText(
                    "secondaryContainer ${replaceString(Theme.of(context).colorScheme.secondaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer)),
                tileColor: Theme.of(context).colorScheme.secondaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onSecondaryContainer ${replaceString(Theme.of(context).colorScheme.onSecondaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondaryContainer)),
                tileColor: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "Tertiary ${replaceString(Theme.of(context).colorScheme.tertiary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onTertiary)),
                tileColor: Theme.of(context).colorScheme.tertiary,
              ),
              ListTile(
                title: SelectableText(
                    "onTertiary ${replaceString(Theme.of(context).colorScheme.onTertiary)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
                tileColor: Theme.of(context).colorScheme.onTertiary,
              ),
              ListTile(
                title: SelectableText(
                    "tertiaryContainer ${replaceString(Theme.of(context).colorScheme.tertiaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer)),
                tileColor: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onTertiaryContainer ${replaceString(Theme.of(context).colorScheme.onTertiaryContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer)),
                tileColor: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
              ListTile(
                title: SelectableText("error ${replaceString(Theme.of(context).colorScheme.error)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onError)),
                tileColor: Theme.of(context).colorScheme.error,
              ),
              ListTile(
                title: SelectableText("onError ${replaceString(Theme.of(context).colorScheme.onError)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.error)),
                tileColor: Theme.of(context).colorScheme.onError,
              ),
              ListTile(
                title: SelectableText(
                    "errorContainer ${replaceString(Theme.of(context).colorScheme.errorContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer)),
                tileColor: Theme.of(context).colorScheme.errorContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onErrorContainer ${replaceString(Theme.of(context).colorScheme.onErrorContainer)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.errorContainer)),
                tileColor: Theme.of(context).colorScheme.onErrorContainer,
              ),
              ListTile(
                title: SelectableText(
                    "surfaceVariant ${replaceString(Theme.of(context).colorScheme.surfaceVariant)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                tileColor: Theme.of(context).colorScheme.surfaceVariant,
              ),
              ListTile(
                title: SelectableText(
                    "onSurfaceVariant ${replaceString(Theme.of(context).colorScheme.onSurfaceVariant)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.surfaceVariant)),
                tileColor: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              ListTile(
                title: SelectableText("outline ${replaceString(Theme.of(context).colorScheme.outline)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.outlineVariant)),
                tileColor: Theme.of(context).colorScheme.outline,
              ),
              ListTile(
                title: SelectableText(
                    "outlineVariant ${replaceString(Theme.of(context).colorScheme.outlineVariant)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.outline)),
                tileColor: Theme.of(context).colorScheme.outlineVariant,
              ),
              ListTile(
                title: SelectableText(
                    "inverseSurface ${replaceString(Theme.of(context).colorScheme.inverseSurface)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onInverseSurface)),
                tileColor: Theme.of(context).colorScheme.inverseSurface,
              ),
              ListTile(
                title: SelectableText(
                    "onInverseSurface ${replaceString(Theme.of(context).colorScheme.onInverseSurface)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface)),
                tileColor: Theme.of(context).colorScheme.onInverseSurface,
              ),
              ListTile(
                title: SelectableText("shadow ${replaceString(Theme.of(context).colorScheme.shadow)}",
                    style: const TextStyle(color: Colors.white)),
                tileColor: Theme.of(context).colorScheme.shadow,
              ),
              ListTile(
                title: SelectableText("scrim ${replaceString(Theme.of(context).colorScheme.scrim)}",
                    style: const TextStyle(color: Colors.white)),
                tileColor: Theme.of(context).colorScheme.scrim,
              ),
              ListTile(
                title: SelectableText("dummy ${replaceString(Theme.of(context).colorScheme.surface)}",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                tileColor: Theme.of(context).colorScheme.surface,
              ),
              ListTile(
                title: SelectableText("dummy ${replaceString(Theme.of(context).colorScheme.surface)}",
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
