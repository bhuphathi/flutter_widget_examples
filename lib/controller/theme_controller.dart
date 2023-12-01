// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_widget_examples/core/exception/custom_exception.dart';
import 'package:flutter_widget_examples/core/providers/error_provider.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter_widget_examples/core/providers/brightness_provider.dart';
import 'package:flutter_widget_examples/core/providers/themename_provider.dart';
import 'package:flutter_widget_examples/core/themes/radix_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _filename = "theme_controller.dart";

final themeControllerProvider = Provider((ref) {
  return ThemeController(ref: ref, sharedPreferences: SharedPreferences.getInstance());
});

class ThemeController {
  final Ref _ref;
  final Future<SharedPreferences> _sharedPreferences;
  const ThemeController({
    required Ref ref,
    required Future<SharedPreferences> sharedPreferences,
  })  : _ref = ref,
        _sharedPreferences = sharedPreferences;

  init() async {
    try {
      final pref = await _sharedPreferences;
      final dark = pref.getBool("dark") ?? false;
      final themeIndex = pref.getInt("themeIndex") ?? 27;

      _ref.read(brightnessProvider.notifier).update((state) {
        dPrint(filename: _filename, msg: "init dark $dark");
        if (dark) {
          return Brightness.dark;
        } else {
          return Brightness.light;
        }
      });

      final themeName = RadixTheme.themeNames[themeIndex];
      dPrint(filename: _filename, msg: "init themeName $themeName");
      _ref.read(themeNameProvider.notifier).update((state) => themeName);
    } catch (e) {
      throwException(e, code: "init");
    }
  }

  toggleDarkTheme() async {
    try {
      final pref = await _sharedPreferences;

      _ref.read(brightnessProvider.notifier).update((state) {
        if (state == Brightness.light) {
          pref.setBool("dark", true);
          return Brightness.dark;
        } else {
          pref.setBool("dark", false);
          return Brightness.light;
        }
      });
    } catch (e) {
      throwException(e, code: "toggleDarkTheme");
    }
  }

  setThemeName(int themeIndex) async {
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.setInt("themeIndex", themeIndex);

      final themeName = RadixTheme.themeNames[themeIndex];
      _ref.read(themeNameProvider.notifier).update((state) => themeName);
    } catch (e) {
      throwException(e, code: "setThemeName");
    }
  }

  void throwException(
    Object? e, {
    String title = "Theme Cntrlr Error",
    String message = "",
    String code = "",
    AlertTheme alertTheme = AlertTheme.error,
  }) {
    CustomException customException = CustomException(
      title: title,
      message: "${e.toString()}; $message",
      code: "theme_controller $code",
      alertTheme: alertTheme,
    );

    _ref.read(errorProvider.notifier).update((state) => customException);
    dPrint(filename: _filename, msg: customException.toString(), tag: "theme cntrlr error");
  }
}
