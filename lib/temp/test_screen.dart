import 'package:flutter_widget_examples/core/utils/responsove.dart';
import 'package:flutter_widget_examples/temp/themes.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "test_screen.dart";

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeClass = ref.watch(themeProvider);
    final theme = themeClass.theme;
    final themeExt = ref.watch(themeProvider).theme.extension<ExtendedTheme>()!;

    String replaceString(Color color) {
      return color.toString().replaceAll(RegExp(r'[Color\W]'), "");
    }

    dPrint(filename: _filename, msg: "selectedTheme: ${themeClass.selectedTheme}");
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
              ListTile(
                title: SelectableText("background ${replaceString(theme.colorScheme.background)}",
                    style: TextStyle(color: theme.colorScheme.onBackground)),
                tileColor: theme.colorScheme.background,
              ),
              ListTile(
                title: SelectableText("onBackground ${replaceString(theme.colorScheme.onBackground)}",
                    style: TextStyle(color: theme.colorScheme.background)),
                tileColor: theme.colorScheme.onBackground,
              ),
              ListTile(
                title: SelectableText("surface ${replaceString(theme.colorScheme.surface)}",
                    style: TextStyle(color: theme.colorScheme.onSurface)),
                tileColor: theme.colorScheme.surface,
              ),
              ListTile(
                title: SelectableText("onSurface ${replaceString(theme.colorScheme.onSurface)}",
                    style: TextStyle(color: theme.colorScheme.surface)),
                tileColor: theme.colorScheme.onSurface,
              ),
              ListTile(
                title: SelectableText("surfaceTint ${replaceString(theme.colorScheme.surfaceTint)}",
                    style: TextStyle(color: theme.colorScheme.onSurface)),
                tileColor: theme.colorScheme.surfaceTint,
              ),
              ListTile(
                title: SelectableText("Primary ${replaceString(theme.colorScheme.primary)}",
                    style: TextStyle(color: theme.colorScheme.onPrimary)),
                tileColor: theme.colorScheme.primary,
              ),
              ListTile(
                title: SelectableText("onPrimary ${replaceString(theme.colorScheme.onPrimary)}",
                    style: TextStyle(color: theme.colorScheme.primary)),
                tileColor: theme.colorScheme.onPrimary,
              ),
              ListTile(
                title: SelectableText(
                    "primaryContainer ${replaceString(theme.colorScheme.primaryContainer)}",
                    style: TextStyle(color: theme.colorScheme.onPrimaryContainer)),
                tileColor: theme.colorScheme.primaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onPrimaryContainer ${replaceString(theme.colorScheme.onPrimaryContainer)}",
                    style: TextStyle(color: theme.colorScheme.primaryContainer)),
                tileColor: theme.colorScheme.onPrimaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "inversePrimary ${replaceString(theme.colorScheme.inversePrimary)}",
                    style: TextStyle(color: theme.colorScheme.primary)),
                tileColor: theme.colorScheme.inversePrimary,
              ),
              ListTile(
                title: SelectableText("Secondary ${replaceString(theme.colorScheme.secondary)}",
                    style: TextStyle(color: theme.colorScheme.onSecondary)),
                tileColor: theme.colorScheme.secondary,
              ),
              ListTile(
                title: SelectableText("onSecondary ${replaceString(theme.colorScheme.onSecondary)}",
                    style: TextStyle(color: theme.colorScheme.secondary)),
                tileColor: theme.colorScheme.onSecondary,
              ),
              ListTile(
                title: SelectableText(
                    "secondaryContainer ${replaceString(theme.colorScheme.secondaryContainer)}",
                    style: TextStyle(color: theme.colorScheme.onSecondaryContainer)),
                tileColor: theme.colorScheme.secondaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onSecondaryContainer ${replaceString(theme.colorScheme.onSecondaryContainer)}",
                    style: TextStyle(color: theme.colorScheme.secondaryContainer)),
                tileColor: theme.colorScheme.onSecondaryContainer,
              ),
              ListTile(
                title: SelectableText("Tertiary ${replaceString(theme.colorScheme.tertiary)}",
                    style: TextStyle(color: theme.colorScheme.onTertiary)),
                tileColor: theme.colorScheme.tertiary,
              ),
              ListTile(
                title: SelectableText("onTertiary ${replaceString(theme.colorScheme.onTertiary)}",
                    style: TextStyle(color: theme.colorScheme.tertiary)),
                tileColor: theme.colorScheme.onTertiary,
              ),
              ListTile(
                title: SelectableText(
                    "tertiaryContainer ${replaceString(theme.colorScheme.tertiaryContainer)}",
                    style: TextStyle(color: theme.colorScheme.onTertiaryContainer)),
                tileColor: theme.colorScheme.tertiaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onTertiaryContainer ${replaceString(theme.colorScheme.onTertiaryContainer)}",
                    style: TextStyle(color: theme.colorScheme.tertiaryContainer)),
                tileColor: theme.colorScheme.onTertiaryContainer,
              ),
              ListTile(
                title: SelectableText("error ${replaceString(theme.colorScheme.error)}",
                    style: TextStyle(color: theme.colorScheme.onError)),
                tileColor: theme.colorScheme.error,
              ),
              ListTile(
                title: SelectableText("onError ${replaceString(theme.colorScheme.onError)}",
                    style: TextStyle(color: theme.colorScheme.error)),
                tileColor: theme.colorScheme.onError,
              ),
              ListTile(
                title: SelectableText(
                    "errorContainer ${replaceString(theme.colorScheme.errorContainer)}",
                    style: TextStyle(color: theme.colorScheme.onErrorContainer)),
                tileColor: theme.colorScheme.errorContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onErrorContainer ${replaceString(theme.colorScheme.onErrorContainer)}",
                    style: TextStyle(color: theme.colorScheme.errorContainer)),
                tileColor: theme.colorScheme.onErrorContainer,
              ),
              ListTile(
                title: SelectableText(
                    "surfaceVariant ${replaceString(theme.colorScheme.surfaceVariant)}",
                    style: TextStyle(color: theme.colorScheme.onSurfaceVariant)),
                tileColor: theme.colorScheme.surfaceVariant,
              ),
              ListTile(
                title: SelectableText(
                    "onSurfaceVariant ${replaceString(theme.colorScheme.onSurfaceVariant)}",
                    style: TextStyle(color: theme.colorScheme.surfaceVariant)),
                tileColor: theme.colorScheme.onSurfaceVariant,
              ),
              ListTile(
                title: SelectableText("outline ${replaceString(theme.colorScheme.outline)}",
                    style: TextStyle(color: theme.colorScheme.outlineVariant)),
                tileColor: theme.colorScheme.outline,
              ),
              ListTile(
                title: SelectableText(
                    "outlineVariant ${replaceString(theme.colorScheme.outlineVariant)}",
                    style: TextStyle(color: theme.colorScheme.outline)),
                tileColor: theme.colorScheme.outlineVariant,
              ),
              ListTile(
                title: SelectableText(
                    "inverseSurface ${replaceString(theme.colorScheme.inverseSurface)}",
                    style: TextStyle(color: theme.colorScheme.onInverseSurface)),
                tileColor: theme.colorScheme.inverseSurface,
              ),
              ListTile(
                title: SelectableText(
                    "onInverseSurface ${replaceString(theme.colorScheme.onInverseSurface)}",
                    style: TextStyle(color: theme.colorScheme.inverseSurface)),
                tileColor: theme.colorScheme.onInverseSurface,
              ),
              ListTile(
                title: SelectableText("shadow ${replaceString(theme.colorScheme.shadow)}",
                    style: const TextStyle(color: Colors.white)),
                tileColor: theme.colorScheme.shadow,
              ),
              ListTile(
                title: SelectableText("scrim ${replaceString(theme.colorScheme.scrim)}",
                    style: const TextStyle(color: Colors.white)),
                tileColor: theme.colorScheme.scrim,
              ),
              ListTile(
                title: SelectableText("danger ${replaceString(themeExt.danger!)}",
                    style: TextStyle(color: themeExt.onDanger)),
                tileColor: themeExt.danger,
              ),
              ListTile(
                title: SelectableText("onDanger ${replaceString(themeExt.onDanger!)}",
                    style: TextStyle(color: themeExt.danger)),
                tileColor: themeExt.onDanger,
              ),
              ListTile(
                title: SelectableText("inverseDanger ${replaceString(themeExt.inverseDanger!)}",
                    style: TextStyle(color: themeExt.onInverseDanger)),
                tileColor: themeExt.inverseDanger,
              ),
              ListTile(
                title: SelectableText("dangerContainer ${replaceString(themeExt.dangerContainer!)}",
                    style: TextStyle(color: themeExt.onDangerContainer)),
                tileColor: themeExt.dangerContainer,
              ),
              ListTile(
                title: SelectableText("onDangerContainer ${replaceString(themeExt.onDangerContainer!)}",
                    style: TextStyle(color: themeExt.dangerContainer)),
                tileColor: themeExt.onDangerContainer,
              ),
              ListTile(
                title: SelectableText("info ${replaceString(themeExt.info!)}",
                    style: TextStyle(color: themeExt.onInfo)),
                tileColor: themeExt.info,
              ),
              ListTile(
                title: SelectableText("oninfo ${replaceString(themeExt.onInfo!)}",
                    style: TextStyle(color: themeExt.info)),
                tileColor: themeExt.onInfo,
              ),
              ListTile(
                title: SelectableText("inverseinfo ${replaceString(themeExt.inverseInfo!)}",
                    style: TextStyle(color: themeExt.onInverseInfo)),
                tileColor: themeExt.inverseInfo,
              ),
              ListTile(
                title: SelectableText("infoContainer ${replaceString(themeExt.infoContainer!)}",
                    style: TextStyle(color: themeExt.onInfoContainer)),
                tileColor: themeExt.infoContainer,
              ),
              ListTile(
                title: SelectableText("oninfoContainer ${replaceString(themeExt.onInfoContainer!)}",
                    style: TextStyle(color: themeExt.infoContainer)),
                tileColor: themeExt.onInfoContainer,
              ),
              ListTile(
                title: SelectableText("success ${replaceString(themeExt.success!)}",
                    style: TextStyle(color: themeExt.onSuccess)),
                tileColor: themeExt.success,
              ),
              ListTile(
                title: SelectableText("onsuccess ${replaceString(themeExt.onSuccess!)}",
                    style: TextStyle(color: themeExt.success)),
                tileColor: themeExt.onSuccess,
              ),
              ListTile(
                title: SelectableText("inversesuccess ${replaceString(themeExt.inverseSuccess!)}",
                    style: TextStyle(color: themeExt.onInverseSuccess)),
                tileColor: themeExt.inverseSuccess,
              ),
              ListTile(
                title: SelectableText("successContainer ${replaceString(themeExt.successContainer!)}",
                    style: TextStyle(color: themeExt.onSuccessContainer)),
                tileColor: themeExt.successContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onsuccessContainer ${replaceString(themeExt.onSuccessContainer!)}",
                    style: TextStyle(color: themeExt.successContainer)),
                tileColor: themeExt.onSuccessContainer,
              ),
              ListTile(
                title: SelectableText("warning ${replaceString(themeExt.warning!)}",
                    style: TextStyle(color: themeExt.onWarning)),
                tileColor: themeExt.warning,
              ),
              ListTile(
                title: SelectableText("onwarning ${replaceString(themeExt.onWarning!)}",
                    style: TextStyle(color: themeExt.warning)),
                tileColor: themeExt.onWarning,
              ),
              ListTile(
                title: SelectableText("inversewarning ${replaceString(themeExt.inverseWarning!)}",
                    style: TextStyle(color: themeExt.onInverseWarning)),
                tileColor: themeExt.inverseWarning,
              ),
              ListTile(
                title: SelectableText("warningContainer ${replaceString(themeExt.warningContainer!)}",
                    style: TextStyle(color: themeExt.onWarningContainer)),
                tileColor: themeExt.warningContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onwarningContainer ${replaceString(themeExt.onWarningContainer!)}",
                    style: TextStyle(color: themeExt.warningContainer)),
                tileColor: themeExt.onWarningContainer,
              ),
              ListTile(
                title: SelectableText("highlightdanger ${replaceString(themeExt.highlightDanger!)}",
                    style: TextStyle(color: themeExt.onHighlightDanger)),
                tileColor: themeExt.highlightDanger,
              ),
              ListTile(
                title: SelectableText("onhighlightdanger ${replaceString(themeExt.onHighlightDanger!)}",
                    style: TextStyle(color: themeExt.highlightDanger)),
                tileColor: themeExt.onHighlightDanger,
              ),
              ListTile(
                title: SelectableText(
                    "inversehighlightdanger ${replaceString(themeExt.inverseHighlightDanger!)}",
                    style: TextStyle(color: themeExt.onInverseHighlightDanger)),
                tileColor: themeExt.inverseHighlightDanger,
              ),
              ListTile(
                title: SelectableText(
                    "highlightdangerContainer ${replaceString(themeExt.highlightDangerContainer!)}",
                    style: TextStyle(color: themeExt.onHighlightDangerContainer)),
                tileColor: themeExt.highlightDangerContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onhighlightdangerContainer ${replaceString(themeExt.onHighlightDangerContainer!)}",
                    style: TextStyle(color: themeExt.highlightDangerContainer)),
                tileColor: themeExt.onHighlightDangerContainer,
              ),
              ListTile(
                title: SelectableText("highlightInfo ${replaceString(themeExt.highlightInfo!)}",
                    style: TextStyle(color: themeExt.onHighlightInfo)),
                tileColor: themeExt.highlightInfo,
              ),
              ListTile(
                title: SelectableText("onhighlightInfo ${replaceString(themeExt.onHighlightInfo!)}",
                    style: TextStyle(color: themeExt.highlightInfo)),
                tileColor: themeExt.onHighlightInfo,
              ),
              ListTile(
                title: SelectableText(
                    "inversehighlightInfo ${replaceString(themeExt.inverseHighlightInfo!)}",
                    style: TextStyle(color: themeExt.onInverseHighlightInfo)),
                tileColor: themeExt.inverseHighlightInfo,
              ),
              ListTile(
                title: SelectableText(
                    "highlightInfoContainer ${replaceString(themeExt.highlightInfoContainer!)}",
                    style: TextStyle(color: themeExt.onHighlightInfoContainer)),
                tileColor: themeExt.highlightInfoContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onhighlightInfoContainer ${replaceString(themeExt.onHighlightInfoContainer!)}",
                    style: TextStyle(color: themeExt.highlightInfoContainer)),
                tileColor: themeExt.onHighlightInfoContainer,
              ),
              ListTile(
                title: SelectableText("highlightSuccess ${replaceString(themeExt.highlightSuccess!)}",
                    style: TextStyle(color: themeExt.onHighlightSuccess)),
                tileColor: themeExt.highlightSuccess,
              ),
              ListTile(
                title: SelectableText(
                    "onhighlightSuccess ${replaceString(themeExt.onHighlightSuccess!)}",
                    style: TextStyle(color: themeExt.highlightSuccess)),
                tileColor: themeExt.onHighlightSuccess,
              ),
              ListTile(
                title: SelectableText(
                    "inversehighlightSuccess ${replaceString(themeExt.inverseHighlightSuccess!)}",
                    style: TextStyle(color: themeExt.onInverseHighlightSuccess)),
                tileColor: themeExt.inverseHighlightSuccess,
              ),
              ListTile(
                title: SelectableText(
                    "highlightSuccessContainer ${replaceString(themeExt.highlightSuccessContainer!)}",
                    style: TextStyle(color: themeExt.onHighlightSuccessContainer)),
                tileColor: themeExt.highlightSuccessContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onhighlightSuccessContainer ${replaceString(themeExt.onHighlightSuccessContainer!)}",
                    style: TextStyle(color: themeExt.highlightSuccessContainer)),
                tileColor: themeExt.onHighlightSuccessContainer,
              ),
              ListTile(
                title: SelectableText("highlightWarning ${replaceString(themeExt.highlightWarning!)}",
                    style: TextStyle(color: themeExt.onHighlightWarning)),
                tileColor: themeExt.highlightWarning,
              ),
              ListTile(
                title: SelectableText(
                    "onhighlightWarning ${replaceString(themeExt.onHighlightWarning!)}",
                    style: TextStyle(color: themeExt.highlightWarning)),
                tileColor: themeExt.onHighlightWarning,
              ),
              ListTile(
                title: SelectableText(
                    "inversehighlightWarning ${replaceString(themeExt.inverseHighlightWarning!)}",
                    style: TextStyle(color: themeExt.onInverseHighlightWarning)),
                tileColor: themeExt.inverseHighlightWarning,
              ),
              ListTile(
                title: SelectableText(
                    "highlightWarningContainer ${replaceString(themeExt.highlightWarningContainer!)}",
                    style: TextStyle(color: themeExt.onHighlightWarningContainer)),
                tileColor: themeExt.highlightWarningContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onhighlightWarningContainer ${replaceString(themeExt.onHighlightWarningContainer!)}",
                    style: TextStyle(color: themeExt.highlightWarningContainer)),
                tileColor: themeExt.onHighlightWarningContainer,
              ),
              ListTile(
                title: SelectableText("primary ${replaceString(themeExt.primary!)}",
                    style: TextStyle(color: themeExt.onPrimary)),
                tileColor: themeExt.primary,
              ),
              ListTile(
                title: SelectableText("onPrimary ${replaceString(themeExt.onPrimary!)}",
                    style: TextStyle(color: themeExt.primary)),
                tileColor: themeExt.onPrimary,
              ),
              ListTile(
                title: SelectableText("primaryContainer ${replaceString(themeExt.primaryContainer!)}",
                    style: TextStyle(color: themeExt.onPrimaryContainer)),
                tileColor: themeExt.primaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onPrimaryContainer ${replaceString(themeExt.onPrimaryContainer!)}",
                    style: TextStyle(color: themeExt.primaryContainer)),
                tileColor: themeExt.onPrimaryContainer,
              ),
              ListTile(
                title: SelectableText("dummy ${replaceString(theme.colorScheme.surface)}",
                    style: TextStyle(color: theme.colorScheme.onSurface)),
                tileColor: theme.colorScheme.surface,
              ),
              ListTile(
                title: SelectableText("secondary ${replaceString(themeExt.secondary!)}",
                    style: TextStyle(color: themeExt.onSecondary)),
                tileColor: themeExt.secondary,
              ),
              ListTile(
                title: SelectableText("onsecondary ${replaceString(themeExt.onSecondary!)}",
                    style: TextStyle(color: themeExt.secondary)),
                tileColor: themeExt.onSecondary,
              ),
              ListTile(
                title: SelectableText(
                    "secondaryContainer ${replaceString(themeExt.secondaryContainer!)}",
                    style: TextStyle(color: themeExt.onSecondaryContainer)),
                tileColor: themeExt.secondaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onsecondaryContainer ${replaceString(themeExt.onSecondaryContainer!)}",
                    style: TextStyle(color: themeExt.secondaryContainer)),
                tileColor: themeExt.onSecondaryContainer,
              ),
              ListTile(
                title: SelectableText("dummy ${replaceString(theme.colorScheme.surface)}",
                    style: TextStyle(color: theme.colorScheme.onSurface)),
                tileColor: theme.colorScheme.surface,
              ),
              ListTile(
                title: SelectableText("Tertiary ${replaceString(themeExt.tertiary!)}",
                    style: TextStyle(color: themeExt.onTertiary)),
                tileColor: themeExt.tertiary,
              ),
              ListTile(
                title: SelectableText("onTertiary ${replaceString(themeExt.onTertiary!)}",
                    style: TextStyle(color: themeExt.tertiary)),
                tileColor: themeExt.onTertiary,
              ),
              ListTile(
                title: SelectableText("TertiaryContainer ${replaceString(themeExt.tertiaryContainer!)}",
                    style: TextStyle(color: themeExt.onTertiaryContainer)),
                tileColor: themeExt.tertiaryContainer,
              ),
              ListTile(
                title: SelectableText(
                    "onTertiaryContainer ${replaceString(themeExt.onTertiaryContainer!)}",
                    style: TextStyle(color: themeExt.tertiaryContainer)),
                tileColor: themeExt.onTertiaryContainer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
