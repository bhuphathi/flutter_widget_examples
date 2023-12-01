import 'package:flutter_widget_examples/core/constants/navigator_key.dart';
import 'package:flutter_widget_examples/core/exception/custom_exception.dart';
import 'package:flutter_widget_examples/core/providers/error_provider.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "error_dialog.dart";

errorDialog(WidgetRef ref) {
  final context = navigatorKey.currentContext;
  final error = ref.read(errorProvider);
  final theme = ref.read(radixThemeProvider);
  Color background;
  Color onBackground;

  switch (error?.alertTheme) {
    case AlertTheme.normal:
      background = theme.background;
      onBackground = theme.onBackground;
      break;
    case AlertTheme.error:
      background = theme.error.step2;
      onBackground = theme.error.step11;
      break;
    case AlertTheme.info:
      background = theme.info.step2;
      onBackground = theme.info.step11;
      break;
    case AlertTheme.warning:
      background = theme.warning.step2;
      onBackground = theme.warning.step11;
      break;
    case AlertTheme.success:
      background = theme.success.step2;
      onBackground = theme.success.step11;
      break;
    case AlertTheme.hlError:
      background = theme.highLighterCrimson.step2;
      onBackground = theme.highLighterCrimson.step11;
      break;
    case AlertTheme.hlinfo:
      background = theme.highLighterIndigo.step2;
      onBackground = theme.highLighterIndigo.step11;
      break;
    case AlertTheme.hlWarning:
      background = theme.highLighterOrange.step2;
      onBackground = theme.highLighterOrange.step11;
      break;
    case AlertTheme.hlSuccess:
      background = theme.highLighterGreen.step2;
      onBackground = theme.highLighterGreen.step11;
      break;
    default:
      background = theme.background;
      onBackground = theme.onBackground;
  }

  if (error != null && context != null) {
    showDialog(
      barrierColor: theme.secondaryA.step5,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: background,
          title: Text(
            error.title,
            style: TextStyle(
              //   fontFamily: '.SF UI Display',
              color: onBackground,
              inherit: false,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
              height: 1.3,
              letterSpacing: -0.5,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
          content: Text(
            error.message,
            style: TextStyle(
              //   fontFamily: 'Quicksand',
              color: onBackground,
              inherit: false,
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              height: 1.35,
              letterSpacing: -0.2,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(onBackground)),
              onPressed: () {
                ref.read(errorProvider.notifier).update((state) => null);
                Navigator.pop(ctx, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
