import 'package:flutter_widget_examples/core/themes/radix_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeNameProvider = StateProvider<ThemeNames>((ref) {
  return RadixTheme.themeNames[27];
});
