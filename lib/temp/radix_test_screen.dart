import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/responsove.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter_widget_examples/presentation/widgets/color_swatch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "radix_test_screen.dart";

class RadixTestScreen extends ConsumerWidget {
  const RadixTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(radixThemeProvider);

    dPrint(filename: _filename, msg: "Widget build...");

    return Column(
      children: [
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: responsive(context,
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
              const ColorSwatchWidget(),
              ListTile(
                title: SelectableText("background theme.background",
                    style: TextStyle(color: theme.onBackground)),
                tileColor: theme.background,
              ),
              ListTile(
                title: SelectableText("subtleBackground theme.subtleBackground",
                    style: TextStyle(color: theme.onSubtleBackground)),
                tileColor: theme.subtleBackground,
              ),
              ListTile(
                title: SelectableText("contrastBackground theme.contrastBackground",
                    style: TextStyle(color: theme.onContrastBackground)),
                tileColor: theme.contrastBackground,
              ),
              ListTile(
                title:
                    SelectableText("base theme.base baseText", style: TextStyle(color: theme.baseText)),
                tileColor: theme.base,
              ),
              ListTile(
                title: SelectableText("Primary theme.primary primaryText",
                    style: TextStyle(color: theme.primaryText)),
                tileColor: theme.primary,
              ),
              ListTile(
                title: SelectableText("Primary theme.primary onPrimary",
                    style: TextStyle(color: theme.onPrimary)),
                tileColor: theme.primary,
              ),
              ListTile(
                title: SelectableText("primaryContainer theme.primaryContainer",
                    style: TextStyle(color: theme.onPrimaryContainer)),
                tileColor: theme.primaryContainer,
              ),
              ListTile(
                title: SelectableText("Secondary theme.secondary secondaryText",
                    style: TextStyle(color: theme.secondaryText)),
                tileColor: theme.secondary,
              ),
              ListTile(
                title: SelectableText("Secondary theme.secondary onSecondary",
                    style: TextStyle(color: theme.onSecondary)),
                tileColor: theme.secondary,
              ),
              ListTile(
                title: SelectableText("secondaryContainer theme.secondaryContainer",
                    style: TextStyle(color: theme.onSecondaryContainer)),
                tileColor: theme.secondaryContainer,
              ),
              ListTile(
                title: SelectableText("tertiary theme.tertiary tertiaryText",
                    style: TextStyle(color: theme.tertiaryText)),
                tileColor: theme.tertiary,
              ),
              ListTile(
                title: SelectableText("tertiary theme.tertiary onTertiary",
                    style: TextStyle(color: theme.onTertiary)),
                tileColor: theme.tertiary,
              ),
              ListTile(
                title: SelectableText("tertiaryContainer theme.tertiaryContainer",
                    style: TextStyle(color: theme.onTertiaryContainer)),
                tileColor: theme.tertiaryContainer,
              ),
              ListTile(
                title: SelectableText("error theme.error errorText",
                    style: TextStyle(color: theme.errorText)),
                tileColor: theme.error,
              ),
              ListTile(
                title:
                    SelectableText("error theme.error onError", style: TextStyle(color: theme.onError)),
                tileColor: theme.error,
              ),
              ListTile(
                title: SelectableText("errorContainer theme.errorContainer",
                    style: TextStyle(color: theme.onErrorContainer)),
                tileColor: theme.errorContainer,
              ),
              ListTile(
                title:
                    SelectableText("info theme.info infotext", style: TextStyle(color: theme.infoText)),
                tileColor: theme.info,
              ),
              ListTile(
                title: SelectableText("info theme.info oninfo", style: TextStyle(color: theme.onInfo)),
                tileColor: theme.info,
              ),
              ListTile(
                title: SelectableText("infoContainer theme.infoContainer onInfoContainer",
                    style: TextStyle(color: theme.onInfoContainer)),
                tileColor: theme.infoContainer,
              ),
              ListTile(
                title: SelectableText("success theme.success successText",
                    style: TextStyle(color: theme.successText)),
                tileColor: theme.success,
              ),
              ListTile(
                title: SelectableText("success theme.success onsuccess",
                    style: TextStyle(color: theme.onSuccess)),
                tileColor: theme.success,
              ),
              ListTile(
                title: SelectableText("successContainer theme.success.step3",
                    style: TextStyle(color: theme.success.step12)),
                tileColor: theme.success.step3,
              ),
              ListTile(
                title: SelectableText("warning theme.warning warningText",
                    style: TextStyle(color: theme.warningText)),
                tileColor: theme.warning,
              ),
              ListTile(
                title: SelectableText("warning theme.warning onWarning",
                    style: TextStyle(color: theme.onWarning)),
                tileColor: theme.warning,
              ),
              ListTile(
                title: SelectableText("warningContainer theme.warning onWarningContainer",
                    style: TextStyle(color: theme.onWarningContainer)),
                tileColor: theme.warningContainer,
              ),
              ListTile(
                title: SelectableText("highLighter Error theme.highLighterCrimson",
                    style: TextStyle(color: theme.highLighterCrimsonText)),
                tileColor: theme.highLighterCrimson,
              ),
              ListTile(
                title: SelectableText("highLighter error Container theme.highLighterCrimson.step3",
                    style: TextStyle(color: theme.highLighterCrimson.step11)),
                tileColor: theme.highLighterCrimson.step3,
              ),
              ListTile(
                title: SelectableText("highLighter info theme.highLighterIndigo",
                    style: TextStyle(color: theme.highLighterIndigoText)),
                tileColor: theme.highLighterIndigo,
              ),
              ListTile(
                title: SelectableText("highLighter info Container theme.highLighterIndigo.step3",
                    style: TextStyle(color: theme.highLighterIndigo.step11)),
                tileColor: theme.highLighterIndigo.step3,
              ),
              ListTile(
                title: SelectableText("highLighter success theme.highLighterGreen",
                    style: TextStyle(color: theme.highLighterGreenText)),
                tileColor: theme.highLighterGreen,
              ),
              ListTile(
                title: SelectableText("highLighter success Container theme.highLighterGreen.step3",
                    style: TextStyle(color: theme.highLighterGreen.step11)),
                tileColor: theme.highLighterGreen.step3,
              ),
              ListTile(
                title: SelectableText("highLighter warning theme.highLighterOrange",
                    style: TextStyle(color: theme.highLighterOrangeText)),
                tileColor: theme.highLighterOrange,
              ),
              ListTile(
                title: SelectableText("highLighter warning Container theme.highLighterGreen.step3",
                    style: TextStyle(color: theme.highLighterOrange.step11)),
                tileColor: theme.highLighterOrange.step3,
              ),
              ListTile(
                title: SelectableText("surface theme.surface", style: TextStyle(color: theme.onSurface)),
                tileColor: theme.surface,
              ),
              ListTile(
                title: SelectableText("inverseSurface theme.inverseSurface",
                    style: TextStyle(color: theme.onInverseSurface)),
                tileColor: theme.inverseSurface,
              ),
              ListTile(
                title: SelectableText("surfaceVariant theme.surfaceVariant",
                    style: TextStyle(color: theme.onSurfaceVariant)),
                tileColor: theme.surfaceVariant,
              ),
              ListTile(
                title: SelectableText("Soft(surfacetint) theme.surfaceTint",
                    style: TextStyle(color: theme.onSurfaceTint)),
                tileColor: theme.surfaceTint,
              ),
              ListTile(
                title: SelectableText("outline theme.outline",
                    style: TextStyle(color: theme.secondary.step12)),
                tileColor: theme.outline,
              ),
              ListTile(
                title: SelectableText("outlineVariant theme.outlineVariant",
                    style: TextStyle(color: theme.secondary.step12)),
                tileColor: theme.outlineVariant,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
