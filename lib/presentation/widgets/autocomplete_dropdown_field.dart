import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/presentation/widgets/my_textform_field.dart';
import 'package:flutter_widget_examples/presentation/widgets/options_view_builder.dart';

class AutocompleteDropdown<T extends Object> extends ConsumerStatefulWidget {
  const AutocompleteDropdown({
    super.key,
    required this.dropDownData,
    required this.dropDownDisplayString,
    this.dropDownMaxHeight,
    this.enabled,
    this.nextFieldFocusNode,
    this.hintText,
    required this.labelText,
    required this.onChanged,
    this.onFieldSubmitted,
    required this.onSelected,
    this.outlineBorder = true,
    this.setFocusNode,
    this.setTextEditController,
    this.validator,
  });
  final List<T> dropDownData;

  /// ``` dart
  /// example:
  /// String Function(UserInfoModel option) => "${option.email} - ${option.displayName}";
  /// or
  /// String Function(UserInfoModel option) => "${option.email}";
  /// ```
  final String Function(T value) dropDownDisplayString;
  final FocusNode? nextFieldFocusNode;
  final String? hintText;
  final String labelText;
  final void Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;
  final void Function(T value) onSelected;
  final String? Function(String? value)? validator;
  final double? dropDownMaxHeight;
  final bool? enabled;
  final bool outlineBorder;

  ///setTextEditController callback to set controller from parent widget
  final void Function(TextEditingController controller)? setTextEditController;
  final void Function(FocusNode focusNode)? setFocusNode;

  @override
  AutocompleteDropdownState<T> createState() => AutocompleteDropdownState<T>();
}

class AutocompleteDropdownState<T extends Object> extends ConsumerState<AutocompleteDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);

    return LayoutBuilder(builder: (context, constraints) {
      return Autocomplete<T>(
        optionsViewBuilder: (context, onSelected, options) {
          return optionsViewBuilder<T>(
              context: context,
              maxWidth: constraints.maxWidth,
              maxHeight: widget.dropDownMaxHeight,
              nextWidgetFocusNode: widget.nextFieldFocusNode,
              onSelected: onSelected,
              options: options,
              optionString: widget.dropDownDisplayString,
              theme: theme);
        },
        displayStringForOption: widget.dropDownDisplayString,
        fieldViewBuilder: (BuildContext context, TextEditingController controller, FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          widget.setTextEditController?.call(controller);
          widget.setFocusNode?.call(focusNode);

          return MyTextFormField(
            autofocus: true,
            controller: controller,
            enabled: widget.enabled,
            focusNode: focusNode,
            hintText: widget.hintText,
            labelText: widget.labelText,
            theme: theme,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            outlineBorder: widget.outlineBorder,
            validator: widget.validator,
            textInputAction: TextInputAction.next,
          );
        },
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return Iterable<T>.empty();
          }
          return widget.dropDownData.where((option) {
            return option.toString().toLowerCase().contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: widget.onSelected,
      );
    });
  }
}
