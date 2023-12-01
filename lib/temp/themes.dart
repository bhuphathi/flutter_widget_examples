import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

typedef ThemeNames = ({
  String basic,
  String lavender,
  String tranquillity,
});

//https://www.youtube.com/watch?v=7lFIDCnK6Dg
class Themes {
  Themes({
    this.brightness = Brightness.light,
    this.selectedTheme = "basic",
  }) {
    switchTheme(selectedTheme);
  }
  static ThemeNames get _themeNames =>
      (basic: "basic", lavender: "lavender", tranquillity: "tranquillity");
  static List<String> get themeNames => _themeNames.toString().split(",").map((element) {
        // \w: signifies any alphanumeric character( numbers and letters, a-z, A-Z, 0-9)
        // \W: This is the opposite of `\w`, it signifies any character that is not alphanumeric
        //removes special characters
        return element.split(':')[0].replaceAll(RegExp(r'\W'), "");
      }).toList();

  Brightness brightness;
  String selectedTheme;
  late ThemeData theme;

  //for riverpod state management sending new instance with previous dark theme setting
  Themes switchThemeNewInstance({
    Brightness? brightness,
    String? selectedTheme,
  }) {
    brightness = brightness ?? this.brightness;
    selectedTheme = selectedTheme ?? this.selectedTheme;

    Themes newThemes = Themes(brightness: brightness);
    newThemes.switchTheme(selectedTheme);
    return newThemes;
  }

  Themes toggleDark(Brightness brightness) {
    if (brightness == Brightness.dark) {
      brightness = Brightness.light;
    } else {
      brightness = Brightness.dark;
    }
    return switchThemeNewInstance(brightness: brightness);
  }

  void switchTheme(String themeToSwitch) {
    //set selected theme
    selectedTheme = themeToSwitch;
    if (themeToSwitch == _themeNames.lavender) {
      theme = lavenderScheme(brightness: brightness);
    } else if (themeToSwitch == _themeNames.tranquillity) {
      theme = tranquillityScheme(brightness: brightness);
    } else if (themeToSwitch == _themeNames.basic) {
      theme = basicScheme(brightness: brightness);
    } else {
      theme = lavenderScheme(brightness: brightness);
      selectedTheme = _themeNames.lavender;
    }
  }

  static ThemeData _mainThemeData(ColorScheme colorScheme, ThemeExtension themeExtension) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: colorScheme.onPrimaryContainer,
        foregroundColor: colorScheme.primaryContainer,
      ),
      textTheme: GoogleFonts.latoTextTheme(),
      extensions: <ThemeExtension<dynamic>>[themeExtension],
    );
  }

  static ThemeData basicScheme({required Brightness brightness}) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF25476A),
      brightness: brightness,
    );
    return _mainThemeData(colorScheme, ExtendedTheme(brightness: brightness));
  }

  static ThemeData lavenderScheme({required Brightness brightness}) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF574476),
      brightness: brightness,
    );
    return _mainThemeData(
        colorScheme,
        ExtendedTheme(
          brightness: brightness,
          highlightInfo: const Color(0xFF574476),
          highlightSuccess: const Color(0xFF1dc9b7),
          highlightDanger: const Color(0xFFfd3995),
        ));
  }

  static ThemeData tranquillityScheme({required Brightness brightness}) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF25476A),
      brightness: brightness,
    );
    return _mainThemeData(
        colorScheme,
        ExtendedTheme(
          brightness: brightness,
          secondarySeed: const Color(0xFF03A9F4),
          tertiarySeed: const Color(0xFFab47bc),
        ));
  }

  static ThemeData createScheme({required Brightness brightness}) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF574476),
      brightness: brightness,
    );
    return _mainThemeData(
        colorScheme,
        ExtendedTheme(
          brightness: brightness,
          tertiarySeed: const Color(0xFFfd3995),
        ));
  }
}

// @immutable
class ExtendedTheme extends ThemeExtension<ExtendedTheme> {
  // colors from https://coderthemes.com/hyper/saas/ui-buttons.html
  // colors from https://www.bootstrapdash.com/blog/best-color-schemes-for-websites
  ExtendedTheme({
    required this.brightness,
    this.primarySeed = const Color(0xFF0d6efd),
    this.secondarySeed = const Color(0xff00cccd),
    this.tertiarySeed = const Color(0xFFFF0854),
    this.danger = const Color(0xFFfa5c7c),
    this.info = const Color(0xFF39afd1),
    this.success = const Color(0xFF0acf97),
    this.warning = const Color(0xFFffc35a),
    this.highlightDanger = const Color(0xFFdc3545),
    this.highlightInfo = const Color(0xFF0dcaf0),
    this.highlightSuccess = const Color(0xFF198754),
    this.highlightWarning = const Color(0xFFffc107),
  }) {
    var primaryScheme = CreateScheme(brightness: brightness, seedColor: primarySeed!);
    var secondaryScheme = CreateScheme(brightness: brightness, seedColor: secondarySeed!);
    var tertiaryScheme = CreateScheme(brightness: brightness, seedColor: tertiarySeed!);
    var dangerScheme = CreateScheme(brightness: brightness, seedColor: danger!);
    var infoScheme = CreateScheme(brightness: brightness, seedColor: info!);
    var successScheme = CreateScheme(brightness: brightness, seedColor: success!);
    var warningScheme = CreateScheme(brightness: brightness, seedColor: warning!);
    var highlightDangerScheme = CreateScheme(brightness: brightness, seedColor: highlightDanger!);
    var highlightInfoScheme = CreateScheme(brightness: brightness, seedColor: highlightInfo!);
    var highlightSuccessScheme = CreateScheme(brightness: brightness, seedColor: highlightSuccess!);
    var highlightWarningScheme = CreateScheme(brightness: brightness, seedColor: highlightWarning!);

    primary = primaryScheme.colorScheme.primary;
    onPrimary = primaryScheme.colorScheme.onPrimary;
    primaryContainer = primaryScheme.colorScheme.primaryContainer;
    onPrimaryContainer = primaryScheme.colorScheme.onPrimaryContainer;

    secondary = secondaryScheme.colorScheme.secondary;
    onSecondary = secondaryScheme.colorScheme.onSecondary;
    secondaryContainer = secondaryScheme.colorScheme.secondaryContainer;
    onSecondaryContainer = secondaryScheme.colorScheme.onSecondaryContainer;

    tertiary = tertiaryScheme.colorScheme.primary;
    onTertiary = tertiaryScheme.colorScheme.onPrimary;
    tertiaryContainer = tertiaryScheme.colorScheme.primaryContainer;
    onTertiaryContainer = tertiaryScheme.colorScheme.onPrimaryContainer;

    danger = dangerScheme.colorScheme.primary;
    onDanger = dangerScheme.colorScheme.onPrimary;
    dangerContainer = dangerScheme.colorScheme.primaryContainer;
    onDangerContainer = dangerScheme.colorScheme.onPrimaryContainer;
    inverseDanger = dangerScheme.colorScheme.inversePrimary;
    onInverseDanger = dangerScheme.colorScheme.surfaceTint;

    info = infoScheme.colorScheme.primary;
    onInfo = infoScheme.colorScheme.onPrimary;
    infoContainer = infoScheme.colorScheme.primaryContainer;
    onInfoContainer = infoScheme.colorScheme.onPrimaryContainer;
    inverseInfo = infoScheme.colorScheme.inversePrimary;
    onInverseInfo = infoScheme.colorScheme.surfaceTint;

    success = successScheme.colorScheme.primary;
    onSuccess = successScheme.colorScheme.onPrimary;
    successContainer = successScheme.colorScheme.primaryContainer;
    onSuccessContainer = successScheme.colorScheme.onPrimaryContainer;
    inverseSuccess = successScheme.colorScheme.inversePrimary;
    onInverseSuccess = successScheme.colorScheme.surfaceTint;

    warning = warningScheme.colorScheme.primary;
    onWarning = warningScheme.colorScheme.onPrimary;
    warningContainer = warningScheme.colorScheme.primaryContainer;
    onWarningContainer = warningScheme.colorScheme.onPrimaryContainer;
    inverseWarning = warningScheme.colorScheme.inversePrimary;
    onInverseWarning = warningScheme.colorScheme.surfaceTint;

    highlightDanger = highlightDangerScheme.colorScheme.primary;
    onHighlightDanger = highlightDangerScheme.colorScheme.onPrimary;
    highlightDangerContainer = highlightDangerScheme.colorScheme.primaryContainer;
    onHighlightDangerContainer = highlightDangerScheme.colorScheme.onPrimaryContainer;
    inverseHighlightDanger = highlightDangerScheme.colorScheme.inversePrimary;
    onInverseHighlightDanger = highlightDangerScheme.colorScheme.surfaceTint;

    highlightInfo = highlightInfoScheme.colorScheme.primary;
    onHighlightInfo = highlightInfoScheme.colorScheme.onPrimary;
    highlightInfoContainer = highlightInfoScheme.colorScheme.primaryContainer;
    onHighlightInfoContainer = highlightInfoScheme.colorScheme.onPrimaryContainer;
    inverseHighlightInfo = highlightInfoScheme.colorScheme.inversePrimary;
    onInverseHighlightInfo = highlightInfoScheme.colorScheme.surfaceTint;

    highlightSuccess = highlightSuccessScheme.colorScheme.primary;
    onHighlightSuccess = highlightSuccessScheme.colorScheme.onPrimary;
    highlightSuccessContainer = highlightSuccessScheme.colorScheme.primaryContainer;
    onHighlightSuccessContainer = highlightSuccessScheme.colorScheme.onPrimaryContainer;
    inverseHighlightSuccess = highlightSuccessScheme.colorScheme.inversePrimary;
    onInverseHighlightSuccess = highlightSuccessScheme.colorScheme.surfaceTint;

    highlightWarning = highlightWarningScheme.colorScheme.primary;
    onHighlightWarning = highlightWarningScheme.colorScheme.onPrimary;
    highlightWarningContainer = highlightWarningScheme.colorScheme.primaryContainer;
    onHighlightWarningContainer = highlightWarningScheme.colorScheme.onPrimaryContainer;
    inverseHighlightWarning = highlightWarningScheme.colorScheme.inversePrimary;
    onInverseHighlightWarning = highlightWarningScheme.colorScheme.surfaceTint;
  }

  final Brightness brightness;
  final Color? primarySeed;
  late final Color? primary;
  late final Color? onPrimary;
  late final Color? primaryContainer;
  late final Color? onPrimaryContainer;
  final Color? secondarySeed;
  late final Color? secondary;
  late final Color? onSecondary;
  late final Color? secondaryContainer;
  late final Color? onSecondaryContainer;
  final Color? tertiarySeed;
  late final Color? tertiary;
  late final Color? onTertiary;
  late final Color? tertiaryContainer;
  late final Color? onTertiaryContainer;
  Color? danger;
  late final Color? onDanger;
  late final Color? dangerContainer;
  late final Color? onDangerContainer;
  late final Color? inverseDanger;
  late final Color? onInverseDanger;
  Color? info;
  late final Color? onInfo;
  late final Color? infoContainer;
  late final Color? onInfoContainer;
  late final Color? inverseInfo;
  late final Color? onInverseInfo;
  Color? success;
  late final Color? onSuccess;
  late final Color? successContainer;
  late final Color? onSuccessContainer;
  late final Color? inverseSuccess;
  late final Color? onInverseSuccess;
  Color? warning;
  late final Color? onWarning;
  late final Color? warningContainer;
  late final Color? onWarningContainer;
  late final Color? inverseWarning;
  late final Color? onInverseWarning;
  Color? highlightDanger;
  late final Color? onHighlightDanger;
  late final Color? highlightDangerContainer;
  late final Color? onHighlightDangerContainer;
  late final Color? inverseHighlightDanger;
  late final Color? onInverseHighlightDanger;
  Color? highlightInfo;
  late final Color? onHighlightInfo;
  late final Color? highlightInfoContainer;
  late final Color? onHighlightInfoContainer;
  late final Color? inverseHighlightInfo;
  late final Color? onInverseHighlightInfo;
  Color? highlightSuccess;
  late final Color? onHighlightSuccess;
  late final Color? highlightSuccessContainer;
  late final Color? onHighlightSuccessContainer;
  late final Color? inverseHighlightSuccess;
  late final Color? onInverseHighlightSuccess;
  Color? highlightWarning;
  late final Color? onHighlightWarning;
  late final Color? highlightWarningContainer;
  late final Color? onHighlightWarningContainer;
  late final Color? inverseHighlightWarning;
  late final Color? onInverseHighlightWarning;

  @override
  ThemeExtension<ExtendedTheme> copyWith({
    Brightness? brightness,
    Color? primarySeed,
    Color? secondarySeed,
    Color? tertiarySeed,
    Color? danger,
    Color? info,
    Color? success,
    Color? warning,
    Color? highlightDanger,
    Color? highlightInfo,
    Color? highlightSuccess,
    Color? highlightWarning,
  }) {
    return ExtendedTheme(
      brightness: brightness ?? this.brightness,
      primarySeed: primarySeed ?? this.primarySeed,
      secondarySeed: secondarySeed ?? this.secondarySeed,
      tertiarySeed: tertiarySeed ?? this.tertiarySeed,
      danger: danger ?? this.danger,
      info: info ?? this.info,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      highlightDanger: highlightDanger ?? this.highlightDanger,
      highlightInfo: highlightInfo ?? this.highlightInfo,
      highlightSuccess: highlightSuccess ?? this.highlightSuccess,
      highlightWarning: highlightWarning ?? this.highlightWarning,
    );
  }

  @override
  ThemeExtension<ExtendedTheme> lerp(covariant ThemeExtension<ExtendedTheme>? other, double t) {
    if (other is! ExtendedTheme) {
      return this;
    }
    return ExtendedTheme(
      brightness: brightness,
      primarySeed: Color.lerp(primarySeed, other.primarySeed, t),
      secondarySeed: Color.lerp(secondarySeed, other.secondarySeed, t),
      tertiarySeed: Color.lerp(tertiarySeed, other.tertiarySeed, t),
      danger: Color.lerp(danger, other.danger, t),
      info: Color.lerp(info, other.info, t),
      success: Color.lerp(success, other.success, t),
      warning: Color.lerp(warning, other.warning, t),
      highlightDanger: Color.lerp(highlightDanger, other.highlightDanger, t),
      highlightInfo: Color.lerp(highlightInfo, other.highlightInfo, t),
      highlightSuccess: Color.lerp(highlightSuccess, other.highlightSuccess, t),
      highlightWarning: Color.lerp(highlightWarning, other.highlightWarning, t),
    );
  }
}

class CreateScheme {
  CreateScheme({
    required Brightness brightness,
    required Color seedColor,
  }) {
    colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );
  }
  late final ColorScheme colorScheme;
}

class ThemesNotifier extends StateNotifier<Themes> {
  ThemesNotifier(super.state);

  void switchThemeState(String themeName) =>
      state = state.switchThemeNewInstance(selectedTheme: themeName);

  void toggleDarkThemeState() => state = state.toggleDark(state.brightness);
}

final themeProvider =
    StateNotifierProvider<ThemesNotifier, Themes>((ref) => ThemesNotifier(Themes()));
