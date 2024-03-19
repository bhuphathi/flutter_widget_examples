import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/settings/styles.dart';
import 'package:flutter_widget_examples/core/themes/radix_theme.dart';

class MyTextFormField extends TextFormField {
  final String? hintText;
  final String labelText;
  final RadixTheme theme;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final int errorMaxLines;
  final bool outlineBorder;

  MyTextFormField({
    super.key,
    super.autofocus = false,
    super.controller,
    super.enabled,
    super.focusNode,
    super.initialValue,
    super.inputFormatters,
    super.keyboardType = TextInputType.text,
    super.onChanged,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.onSaved,
    super.onTap,
    super.readOnly,
    super.validator,
    super.textCapitalization = TextCapitalization.none,
    super.textInputAction = TextInputAction.next,
    required this.theme,
    required this.labelText,
    this.errorMaxLines = 1,
    this.hintText,
    this.obscureText = false,
    this.outlineBorder = true,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(
          decoration: MyInputDecoration(
            hintText: hintText,
            labelText: labelText,
            theme: theme,
            errorMaxLines: errorMaxLines,
            outlineBorder: outlineBorder,
          ).copyWith(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
          style: TextStyle(color: theme.primary.step11),
        );
}
