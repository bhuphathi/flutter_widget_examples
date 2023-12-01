import 'package:flutter_widget_examples/core/themes/radix_theme.dart';

List<ThemeNames> convertEnumToListOfEnum(ThemeNames enumValue, Enum test) {
  // Get a list of all the enum values.
  List<ThemeNames> enumValues = ThemeNames.values;

  // Cast the list to the desired type of enum.
  final List<ThemeNames> convertedEnumList = enumValues.cast<ThemeNames>();

  // Return the list of enums.
  return convertedEnumList;
}

// Usage example:

// final ThemeNames enumValue = ThemeNames.amber;
// final List<ThemeNames> enumList = convertEnumToListOfEnum(enumValue);

// print(enumList) //[ThemeNames.bronze, ThemeNames.amber, ThemeNames.purple, ThemeNames.blue, ThemeNames.indigo]
