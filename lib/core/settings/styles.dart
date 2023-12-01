import 'package:flutter_widget_examples/core/themes/radix_theme.dart';
import 'package:flutter/material.dart';

// InputDecoration inputDecoration({
//   required RadixTheme theme,
//   required String labeltext,
//   required String hintText,
// }) {
//   return InputDecoration(
//     labelText: labeltext,
//     isDense: true,
//     border: const OutlineInputBorder(),
//     floatingLabelStyle: TextStyle(color: theme.accent.step11),
//     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.accent, width: 2)),
//     errorBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.error)),
//     errorStyle: TextStyle(color: theme.error),
//     focusColor: theme.highLighterGreen,
//     hintText: hintText,
//   );
// }

// InputDecorationTheme inputDecorationTheme(RadixTheme theme) {
//   return InputDecorationTheme(
//     contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
//     border: OutlineInputBorder(borderSide: BorderSide(color: theme.error)),
//     floatingLabelStyle: TextStyle(color: theme.accent.step11),
//     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.accent, width: 2)),
//     errorBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.error)),
//     errorStyle: TextStyle(color: theme.error),
//     focusColor: theme.highLighterGreen,
//   );
// }

InputDecoration inputDecoration({
  required RadixTheme theme,
  required String labeltext,
  required String hintText,
  MainColors accent = MainColors.primary,
  MainColors error = MainColors.error,
  MainColors focus = MainColors.highLighterGreen,
}) {
  return InputDecoration(
    labelText: labeltext,
    isDense: true,
    border: const OutlineInputBorder(),
    floatingLabelStyle: TextStyle(color: theme.get(themeProperty: accent)?.step11),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: theme.get(themeProperty: accent)!, width: 2)),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.get(themeProperty: error)!)),
    errorStyle: TextStyle(color: theme.get(themeProperty: error)),
    focusColor: theme.get(themeProperty: focus),
    hintText: hintText,
  );
}

InputDecorationTheme inputDecorationTheme(
  RadixTheme theme, {
  MainColors accent = MainColors.tertiary,
  MainColors error = MainColors.error,
  MainColors focus = MainColors.highLighterGreen,
}) {
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    border: const OutlineInputBorder(),
    floatingLabelStyle: TextStyle(color: theme.get(themeProperty: accent)?.step11),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: theme.get(themeProperty: accent)!, width: 2)),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.get(themeProperty: error)!)),
    errorStyle: TextStyle(color: theme.get(themeProperty: error)),
    focusColor: theme.get(themeProperty: focus),
  );
}

MenuStyle dropDownMenuStyle(RadixTheme theme, MainColors themeProperty) {
  return MenuStyle(
    padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0)),
    alignment: AlignmentDirectional.centerStart,
    backgroundColor: MaterialStatePropertyAll(theme.get(themeProperty: themeProperty)?.step1),
  );
}

///set any theme color with themePropertyName
ButtonStyle elevatedBtnStyle(RadixTheme theme, MainColors themeProperty) {
  return ButtonStyle(
    //theme.primary
    backgroundColor:
        MaterialStateProperty.resolveWith((states) => theme.get(themeProperty: themeProperty)),
    //theme.primaryText
    foregroundColor: MaterialStateProperty.resolveWith(
        (states) => theme.get(themeProperty: themeProperty, suffix: ColorSuffix.text)),
    //theme.primary.step7
    overlayColor:
        MaterialStateProperty.resolveWith((states) => theme.get(themeProperty: themeProperty)?.step7),
  );
}

ButtonStyle textButtonStyle(RadixTheme theme, MainColors themeProperty) {
  return ButtonStyle(
    foregroundColor:
        MaterialStateProperty.resolveWith((states) => theme.get(themeProperty: themeProperty)),
    overlayColor:
        MaterialStateProperty.resolveWith((states) => theme.get(themeProperty: themeProperty)?.step3),
  );
}
