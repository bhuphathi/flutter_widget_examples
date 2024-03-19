import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter_widget_examples/core/utils/responsive.dart';
import 'package:flutter_widget_examples/presentation/widgets/color_swatch.dart';

const _filename = "radix_test_screen.dart";

class RadixThemeScreen extends ConsumerWidget {
  const RadixThemeScreen({super.key});
  String getColorHexValue(Color color) {
    var clr = color.toString().replaceAll("RadixColor(primary value: Color(", "");
    return clr.toString().replaceAll(RegExp(r'[()]'), "").toUpperCase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(radixThemeProvider);

    dPrint(filename: _filename, msg: "Widget build...");

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
                color: (color: theme.background, name: "background"),
                textOrOnColor: (color: theme.onBackground, name: "onBackground"),
              ),
              colorTile(
                color: (color: theme.subtleBackground, name: "subtleBackground"),
                textOrOnColor: (color: theme.onSubtleBackground, name: "onSubtleBackground"),
              ),
              colorTile(
                color: (color: theme.contrastBackground, name: "contrastBackground"),
                textOrOnColor: (color: theme.onContrastBackground, name: "onContrastBackground"),
              ),
              colorTile(
                color: (color: theme.base, name: "base"),
                textOrOnColor: (color: theme.baseText, name: "baseText"),
                colorA: (color: theme.baseA, name: "baseA"),
              ),
              colorTile(
                color: (color: theme.accent, name: "accent"),
                textOrOnColor: (color: theme.accentText, name: "accentText"),
                colorA: (color: theme.accentA, name: "accentA"),
                onColor: (color: theme.onAccent, name: "onAccent"),
              ),
              colorTile(
                color: (color: theme.accentContainer, name: "accentContainer"),
                textOrOnColor: (color: theme.onAccentContainer, name: "onAccentContainer"),
              ),
              colorTile(
                color: (color: theme.error, name: "error"),
                textOrOnColor: (color: theme.errorText, name: "errorText"),
                colorA: (color: theme.errorA, name: "errorA"),
                onColor: (color: theme.onError, name: "onError"),
              ),
              colorTile(
                color: (color: theme.errorContainer, name: "errorContainer"),
                textOrOnColor: (color: theme.onErrorContainer, name: "onErrorContainer"),
              ),
              colorTile(
                color: (color: theme.success, name: "success"),
                textOrOnColor: (color: theme.successText, name: "successText"),
                colorA: (color: theme.successA, name: "successA"),
                onColor: (color: theme.onSuccess, name: "onSuccess"),
              ),
              colorTile(
                color: (color: theme.successContainer, name: "successContainer"),
                textOrOnColor: (color: theme.onSuccessContainer, name: "onSuccessContainer"),
              ),
              colorTile(
                color: (color: theme.info, name: "info"),
                textOrOnColor: (color: theme.infoText, name: "infoText"),
                colorA: (color: theme.infoA, name: "infoA"),
                onColor: (color: theme.onInfo, name: "oninfo"),
              ),
              colorTile(
                color: (color: theme.infoContainer, name: "infoContainer"),
                textOrOnColor: (color: theme.onInfoContainer, name: "onInfoContainer"),
              ),
              colorTile(
                color: (color: theme.warning, name: "warning"),
                textOrOnColor: (color: theme.warningText, name: "warningText"),
                colorA: (color: theme.warningA, name: "warningA"),
                onColor: (color: theme.onWarning, name: "onWarning"),
              ),
              colorTile(
                color: (color: theme.warningContainer, name: "warningContainer"),
                textOrOnColor: (color: theme.onWarningContainer, name: "onWarningContainer"),
              ),
              colorTile(
                color: (color: theme.hlError, name: "hlError"),
                textOrOnColor: (color: theme.hlErrorText, name: "hlErrorText"),
                colorA: (color: theme.hlErrorA, name: "hlErrorA"),
              ),
              colorTile(
                color: (color: theme.hlSuccess, name: "hlSuccess"),
                textOrOnColor: (color: theme.hlSuccessText, name: "hlSuccessText"),
                colorA: (color: theme.hlSuccessA, name: "hlSuccessA"),
              ),
              colorTile(
                color: (color: theme.hlInfo, name: "hlInfo"),
                textOrOnColor: (color: theme.hlInfoText, name: "hlInfoText"),
                colorA: (color: theme.hlInfoA, name: "hlInfoA"),
              ),
              colorTile(
                color: (color: theme.hlWarning, name: "hlWarning"),
                textOrOnColor: (color: theme.hlWarningText, name: "hlWarningText"),
                colorA: (color: theme.hlWarningA, name: "hlWarningA"),
              ),
              colorTile(
                color: (color: theme.primary, name: "primary"),
                textOrOnColor: (color: theme.primaryText, name: "primaryText"),
                colorA: (color: theme.primaryA, name: "primaryA"),
                onColor: (color: theme.onPrimary, name: "onPrimary"),
              ),
              colorTile(
                color: (color: theme.primaryContainer, name: "primaryContainer"),
                textOrOnColor: (color: theme.onPrimaryContainer, name: "onPrimaryContainer"),
              ),
              colorTile(
                color: (color: theme.secondary, name: "secondary"),
                textOrOnColor: (color: theme.secondaryText, name: "secondaryText"),
                colorA: (color: theme.secondaryA, name: "secondaryA"),
                onColor: (color: theme.onSecondary, name: "onSecondary"),
              ),
              colorTile(
                color: (color: theme.secondaryContainer, name: "secondaryContainer"),
                textOrOnColor: (color: theme.onSecondaryContainer, name: "onSecondaryContainer"),
              ),
              colorTile(
                color: (color: theme.surface, name: "surface"),
                textOrOnColor: (color: theme.onSurface, name: "onSurface"),
              ),
              colorTile(
                color: (color: theme.inverseSurface, name: "inverseSurface"),
                textOrOnColor: (color: theme.onInverseSurface, name: "onInverseSurface"),
              ),
              colorTile(
                color: (color: theme.surfaceVariant, name: "surfaceVariant"),
                textOrOnColor: (color: theme.onSurfaceVariant, name: "onSurfaceVariant"),
              ),
              colorTile(
                color: (color: theme.surfaceTint, name: "surfaceTint"),
                textOrOnColor: (color: theme.onSurfaceTint, name: "onSurfaceTint"),
              ),
              colorTile(
                color: (color: theme.outline, name: "outline"),
                textOrOnColor: (color: theme.outlineVariant, name: "outlineVariant"),
              ),
              colorTile(
                color: (color: theme.outlineVariant, name: "outlineVariant"),
                textOrOnColor: (color: theme.outline, name: "outline"),
              ),
              colorTile(
                color: (color: theme.staticBlack, name: "staticBlack"),
                textOrOnColor: (color: theme.staticWhite, name: "staticWhite"),
              ),
              colorTile(
                color: (color: theme.staticWhite, name: "staticWhite"),
                textOrOnColor: (color: theme.staticBlack, name: "staticBlack"),
              ),
              const ColorSwatchWidget(),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 2),
                title: SelectableText("dummy ${getColorHexValue(theme.surface)}",
                    style: TextStyle(color: theme.onSurface)),
                tileColor: theme.surface,
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
      child: SingleChildScrollView(
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
      ),
    );
  }
}
