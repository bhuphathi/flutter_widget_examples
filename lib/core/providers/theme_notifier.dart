import 'package:flutter_widget_examples/core/providers/brightness_provider.dart';
import 'package:flutter_widget_examples/core/providers/themename_provider.dart';
import 'package:flutter_widget_examples/core/themes/radix_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemesNotifier extends StateNotifier<RadixTheme> {
  ThemesNotifier(super.state, this.ref);
  final Ref ref;
  // void switchThemeState() =>
  //     state = state.switchTheme(ref.watch(brightnessProvider), ref.watch(themeNameProvider));

//   void toggleDarkThemeState() => state = state.toggleDark(state.brightness);
}

final radixThemeProvider = StateNotifierProvider<ThemesNotifier, RadixTheme>((ref) =>
    ThemesNotifier(RadixTheme(ref.watch(brightnessProvider), ref.watch(themeNameProvider)), ref));
