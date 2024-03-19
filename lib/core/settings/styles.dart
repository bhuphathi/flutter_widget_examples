import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/themes/radix_theme.dart';

class MyInputDecoration extends InputDecoration {
  final RadixTheme theme;
  final bool outlineBorder;
  final MainColors accentColor;
  final MainColors subtleColor;
  final MainColors errorColor;
  MyInputDecoration({
    required this.theme,
    super.errorText,
    super.errorMaxLines = 2,
    super.hintText,
    super.labelText,
    super.isDense = true,
    this.outlineBorder = true,
    this.accentColor = MainColors.primary,
    this.subtleColor = MainColors.secondary,
    this.errorColor = MainColors.error,
  }) : super(
          border: outlineBorder ? const OutlineInputBorder() : null,
          floatingLabelStyle: TextStyle(color: theme.get(themeProperty: subtleColor)?.step11),
          focusedBorder: outlineBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: theme.get(themeProperty: accentColor)!, width: 2))
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.get(themeProperty: accentColor)!, width: 2)),
          errorBorder: outlineBorder
              ? OutlineInputBorder(borderSide: BorderSide(color: theme.get(themeProperty: errorColor)!))
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.get(themeProperty: accentColor)!, width: 2)),
          errorStyle: TextStyle(color: theme.get(themeProperty: errorColor)),
        );
}

class MyInputDecorationTheme extends InputDecorationTheme {
  final RadixTheme theme;
  final MainColors borderColor;
  final MainColors errorColor;
  final MainColors focusClr;
  MyInputDecorationTheme({
    required this.theme,
    this.borderColor = MainColors.primary,
    this.errorColor = MainColors.error,
    this.focusClr = MainColors.hlSuccess,
  }) : super(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          border: const OutlineInputBorder(),
          floatingLabelStyle: TextStyle(color: theme.get(themeProperty: borderColor)?.step11),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.get(themeProperty: borderColor)!, width: 2)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: theme.get(themeProperty: errorColor)!)),
          errorStyle: TextStyle(color: theme.get(themeProperty: errorColor)),
          focusColor: theme.get(themeProperty: focusClr),
        );
}

class MydropDownMenuStyle extends MenuStyle {
  final RadixTheme theme;
  final MainColors themeProperty;
  MydropDownMenuStyle({
    required this.theme,
    this.themeProperty = MainColors.secondary,
    super.alignment = AlignmentDirectional.centerStart,
    super.padding = const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0)),
  }) : super(
          backgroundColor: MaterialStatePropertyAll(theme.get(themeProperty: themeProperty)?.step2),
        );
}

class MyElevatedBtnStyle extends ButtonStyle {
  final RadixTheme theme;
  final MainColors themeProperty;

  ///set any theme color with themePropertyName
  MyElevatedBtnStyle(
    this.theme,
    this.themeProperty,
  ) : super(
          //theme.primary
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => theme.get(themeProperty: themeProperty)),
          //theme.primaryText
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => theme.get(themeProperty: themeProperty, suffix: ColorSuffix.text)),
          //theme.primary.step7
          overlayColor: MaterialStateProperty.resolveWith(
              (states) => theme.get(themeProperty: themeProperty, suffix: ColorSuffix.a)?.step6),
        );
}

class MyTextButtonStyle extends ButtonStyle {
  final RadixTheme theme;
  final MainColors themeProperty;
  MyTextButtonStyle(
    this.theme,
    this.themeProperty,
  ) : super(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => theme.get(themeProperty: themeProperty)?.step11),
          overlayColor: MaterialStateProperty.resolveWith(
              (states) => theme.get(themeProperty: themeProperty)?.step5),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => theme.get(themeProperty: themeProperty)?.step3),
        );
}
