// import 'package:flutter_widget_examples/utils/debug_print.dart';
import 'package:flutter_widget_examples/core/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:radix_colors/radix_colors.dart';

// const _filename = "radix_theme.dart";

enum ColorSuffix {
  a,
  text,
}

enum MainColors {
  base,
  primary,
  secondary,
  tertiary,
  error,
  info,
  success,
  warning,
  highLighterCrimson,
  highLighterIndigo,
  highLighterGreen,
  highLighterOrange,
}

enum ThemeNames {
  gold,
  bronze,
  brown,
  yellow,
  amber,
  orange,
  tomato,
  red,
  ruby,
  crimson,
  pink,
  plum,
  purple,
  violet,
  iris,
  indigo,
  blue,
  cyan,
  teal,
  jade,
  green,
  grass,
  lime,
  mint,
  sky,
  grey,
  white,
  black,
}

List<ThemeNames> convertEnumToListOfEnum(ThemeNames enumValue) {
  // Get a list of all the enum values.
  List<ThemeNames> enumValues = ThemeNames.values;

  // Cast the list to the desired type of enum.
  final List<ThemeNames> convertedEnumList = enumValues.cast<ThemeNames>();

  // Return the list of enums.
  return convertedEnumList;
}

class RadixTheme {
  const RadixTheme.theme({
    required this.themeName,
    required this.radixColorsDynamic,
    required this.white,
    required this.staticWhite,
    required this.black,
    required this.staticBlack,
    required this.base,
    required this.baseA,
    required this.baseText,
    //primary color
    required this.primary,
    required this.primaryA,
    required this.primaryText,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    //secondary color
    required this.secondary,
    required this.secondaryA,
    required this.secondaryText,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    //tertiary or accent color
    required this.tertiary,
    required this.tertiaryA,
    required this.tertiaryText,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    //error color
    required this.error,
    required this.errorA,
    required this.errorText,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    //info
    required this.info,
    required this.infoA,
    required this.infoText,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,

    //succcess
    required this.success,
    required this.successA,
    required this.successText,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    //warning
    required this.warning,
    required this.warningA,
    required this.warningText,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    //highligh error
    required this.highLighterCrimson,
    required this.highLighterCrimsonA,
    required this.highLighterCrimsonText,
    //highligh info
    required this.highLighterIndigo,
    required this.highLighterIndigoA,
    required this.highLighterIndigoText,
    //highligh success
    required this.highLighterGreen,
    required this.highLighterGreenA,
    required this.highLighterGreenText,
    //highlight warning
    required this.highLighterOrange,
    required this.highLighterOrangeA,
    required this.highLighterOrangeText,
    //background
    required this.background,
    required this.onBackground,
    required this.subtleBackground,
    required this.onSubtleBackground,
    required this.contrastBackground,
    required this.onContrastBackground,
    //surface
    required this.surface,
    required this.onSurface,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.surfaceTint,
    required this.onSurfaceTint,
    //outline
    required this.outline,
    required this.outlineVariant,
  });
  final String themeName;
  final RadixColorsDynamic radixColorsDynamic;

  ///Light: Colors.white, Dark: sand.step1
  final Color white;

  ///Light: Colors.white, Dark: sand.step1
  final Color staticWhite;

  ///Light: gray.step12, Dark: Colors.black
  final Color black;

  ///Light: gray.step12, Dark: Colors.black
  final Color staticBlack;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor base;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor baseText;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor baseA;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor primary;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor primaryA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor primaryText;

  ///default color: step1
  ///
  ///{@macro RadixColor.step1}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onPrimary;

  ///default color: step3
  ///
  ///{@macro RadixColor.step3}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor primaryContainer;

  ///default color: step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onPrimaryContainer;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor secondary;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor secondaryA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor secondaryText;

  ///default color: step1
  ///
  ///{@macro RadixColor.step1}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onSecondary;

  ///default color: step3
  ///
  ///{@macro RadixColor.step3}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor secondaryContainer;

  ///default color: step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onSecondaryContainer;

  ///default color: step9 (accent)
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor tertiary;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor tertiaryA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor tertiaryText;

  ///default color: step1
  ///
  ///{@macro RadixColor.step1}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onTertiary;

  ///default color: step3
  ///
  ///{@macro RadixColor.step3}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor tertiaryContainer;

  ///default color: step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onTertiaryContainer;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor error;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor errorA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor errorText;

  ///default color: step1
  ///
  ///{@macro RadixColor.step1}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onError;

  ///default color: step3
  ///
  ///{@macro RadixColor.step3}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor errorContainer;

  ///default color: step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onErrorContainer;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor info;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor infoA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor infoText;

  ///default color: step1
  ///
  ///{@macro RadixColor.step1}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onInfo;

  ///default color: step3
  ///
  ///{@macro RadixColor.step3}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor infoContainer;

  ///default color: step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onInfoContainer;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor success;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor successA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor successText;

  ///default color: step1
  ///
  ///{@macro RadixColor.step1}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onSuccess;

  ///default color: step3
  ///
  ///{@macro RadixColor.step3}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor successContainer;

  ///default color: step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onSuccessContainer;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor warning;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor warningA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor warningText;

  ///default color: step1
  ///
  ///{@macro RadixColor.step1}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onWarning;

  ///default color: step3
  ///
  ///{@macro RadixColor.step3}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor warningContainer;

  ///default color: step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onWarningContainer;

  ///default color: step9\
  ///highlight error colors
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor highLighterCrimson;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor highLighterCrimsonA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor highLighterCrimsonText;

  ///default color: step9\
  ///highlight info colors
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor highLighterIndigo;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor highLighterIndigoA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor highLighterIndigoText;

  ///default color: step9\
  ///highlight success colors
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor highLighterGreen;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor highLighterGreenA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor highLighterGreenText;

  ///default color: step9\
  ///highlight warning colors
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor highLighterOrange;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor highLighterOrangeA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor highLighterOrangeText;

  ///default color: secondary.step1
  ///
  ///{@macro RadixColor.step1}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor background;

  ///default color: secondary.step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onBackground;

  ///default color: secondary.step2
  ///
  ///{@macro RadixColor.step2}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor subtleBackground;

  ///default color: secondary.step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onSubtleBackground;

  ///default color: base.step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor contrastBackground;

  ///default color: baseText\
  ///default color: step12: whiteA | blackA : light and dark theme won't work
  final RadixColor onContrastBackground;

  ///default color: base.step2
  ///
  ///{@macro RadixColor.step2}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor surface;

  ///default color: base.step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onSurface;

  ///default color: secondary.step10
  ///
  ///{@macro RadixColor.step10}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor inverseSurface;

  ///default color: secondary.step1
  ///
  ///{@macro RadixColor.step1}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onInverseSurface;

  ///default color: secondary.step3
  ///
  ///{@macro RadixColor.step3}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor surfaceVariant;

  ///default color: secondary.step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onSurfaceVariant;

  ///default color: primary.step3
  ///
  ///{@macro RadixColor.step3}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor surfaceTint;

  ///default color: primary.step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor onSurfaceTint;

  ///default color: secondary.step8
  ///
  ///{@macro RadixColor.step8}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor outline;

  ///default color: secondary.step6
  ///
  ///{@macro RadixColor.step6}
  ///
  ///See also:
  ///{@macro RadixColor}
  final RadixColor outlineVariant;

  ///default color: step9 (accent)
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  RadixColor get accent => tertiary;

  ///default color: step9
  ///
  ///{@macro RadixColor.step9}
  ///
  ///See also:
  ///{@macro RadixColor}
  RadixColor get accentA => tertiaryA;

  ///default color: step12: whiteA | blackA : light and dark theme won't work
  RadixColor get accentText => tertiaryText;

  ///default color: step1
  ///
  ///{@macro RadixColor.step1}
  ///
  ///See also:
  ///{@macro RadixColor}
  RadixColor get onAccent => onTertiary;

  ///default color: step3
  ///
  ///{@macro RadixColor.step3}
  ///
  ///See also:
  ///{@macro RadixColor}
  RadixColor get accentContainer => tertiaryContainer;

  ///default color: step11
  ///
  ///{@macro RadixColor.step11}
  ///
  ///See also:
  ///{@macro RadixColor}
  RadixColor get onAccentContainer => onTertiaryContainer;

  RadixColor? get({required MainColors themeProperty, ColorSuffix? suffix}) {
    var colors = {
      "base": base,
      "baseA": baseA,
      "baseText": baseText,
      "primary": primary,
      "primaryA": primaryA,
      "primaryText": primaryText,
      "onPrimary": onPrimary,
      "primaryContainer": primaryContainer,
      "onPrimaryContainer": onPrimaryContainer,
      "secondary": secondary,
      "secondaryA": secondaryA,
      "secondaryText": secondaryText,
      "onSecondary": onSecondary,
      "secondaryContainer": secondaryContainer,
      "onSecondaryContainer": onSecondaryContainer,
      "tertiary": tertiary,
      "tertiaryA": tertiaryA,
      "tertiaryText": tertiaryText,
      "onTertiary": onTertiary,
      "tertiaryContainer": tertiaryContainer,
      "onTertiaryContainer": onTertiaryContainer,
      "error": error,
      "errorA": errorA,
      "errorText": errorText,
      "onError": onError,
      "errorContainer": errorContainer,
      "onErrorContainer": onErrorContainer,
      "info": info,
      "infoA": infoA,
      "infoText": infoText,
      "onInfo": onInfo,
      "infoContainer": infoContainer,
      "onInfoContainer": onInfoContainer,
      "success": success,
      "successA": successA,
      "successText": successText,
      "onSuccess": onSuccess,
      "successContainer": successContainer,
      "onSuccessContainer": onSuccessContainer,
      "warning": warning,
      "warningA": warningA,
      "warningText": warningText,
      "onWarning": onWarning,
      "warningContainer": warningContainer,
      "onWarningContainer": onWarningContainer,
      "highLighterCrimson": highLighterCrimson,
      "highLighterCrimsonA": highLighterCrimsonA,
      "highLighterCrimsonText": highLighterCrimsonText,
      "highLighterIndigo": highLighterIndigo,
      "highLighterIndigoA": highLighterIndigoA,
      "highLighterIndigoText": highLighterIndigoText,
      "highLighterGreen": highLighterGreen,
      "highLighterGreenA": highLighterGreenA,
      "highLighterGreenText": highLighterGreenText,
      "highLighterOrange": highLighterOrange,
      "highLighterOrangeA": highLighterOrangeA,
      "highLighterOrangeText": highLighterOrangeText,
      "background": background,
      "onBackground": onBackground,
      "subtleBackground": subtleBackground,
      "onSubtleBackground": onSubtleBackground,
      "contrastBackground": contrastBackground,
      "onContrastBackground": onContrastBackground,
      "surface": surface,
      "onSurface": onSurface,
      "inverseSurface": inverseSurface,
      "onInverseSurface": onInverseSurface,
      "surfaceVariant": surfaceVariant,
      "onSurfaceVariant": onSurfaceVariant,
      "surfaceTint": surfaceTint,
      "onSurfaceTint": onSurfaceTint,
      "outline": outline,
      "outlineVariant": outlineVariant,
    };

    String property = themeProperty.name;
    if (suffix != null) {
      property = themeProperty.name + suffix.name.toCapitalize();
    }

    for (var key in colors.keys) {
      if (key == property) return colors[property];
    }
    return null;
  }

  factory RadixTheme(
    Brightness brightness,
    ThemeNames themeName,
  ) {
    switch (themeName) {
      case ThemeNames.white:
        return whiteTheme(brightness);
      case ThemeNames.black:
        return blackTheme(brightness);
      case ThemeNames.grey:
        return grey(brightness);
      case ThemeNames.bronze:
        return bronze(brightness);
      case ThemeNames.gold:
        return gold(brightness);
      case ThemeNames.brown:
        return brown(brightness);
      case ThemeNames.orange:
        return orange(brightness);
      case ThemeNames.tomato:
        return tomato(brightness);
      case ThemeNames.red:
        return red(brightness);
      case ThemeNames.ruby:
        return ruby(brightness);
      case ThemeNames.crimson:
        return crimson(brightness);
      case ThemeNames.pink:
        return pink(brightness);
      case ThemeNames.plum:
        return plum(brightness);
      case ThemeNames.purple:
        return purple(brightness);
      case ThemeNames.violet:
        return violet(brightness);
      case ThemeNames.iris:
        return iris(brightness);
      case ThemeNames.indigo:
        return indigo(brightness);
      case ThemeNames.blue:
        return blue(brightness);
      case ThemeNames.cyan:
        return cyan(brightness);
      case ThemeNames.teal:
        return teal(brightness);
      case ThemeNames.jade:
        return jade(brightness);
      case ThemeNames.green:
        return green(brightness);
      case ThemeNames.grass:
        return grass(brightness);
      case ThemeNames.sky:
        return sky(brightness);
      case ThemeNames.mint:
        return mint(brightness);
      case ThemeNames.lime:
        return lime(brightness);
      case ThemeNames.yellow:
        return yellow(brightness);
      case ThemeNames.amber:
        return amber(brightness);
      default:
        return amber(brightness);
    }
  }

  static RadixTheme Function(Brightness) get whiteTheme => _whiteTheme;
  static RadixTheme Function(Brightness) get blackTheme => _blackTheme;
  static RadixTheme Function(Brightness) get grey => _greyTheme;
  static RadixTheme Function(Brightness) get bronze => _bronzeTheme;
  static RadixTheme Function(Brightness) get gold => _goldTheme;
  static RadixTheme Function(Brightness) get brown => _brownTheme;
  static RadixTheme Function(Brightness) get orange => _orangeTheme;
  static RadixTheme Function(Brightness) get tomato => _tomatoTheme;
  static RadixTheme Function(Brightness) get red => _redTheme;
  static RadixTheme Function(Brightness) get ruby => _rubyTheme;
  static RadixTheme Function(Brightness) get crimson => _crimsonTheme;
  static RadixTheme Function(Brightness) get pink => _pinkTheme;
  static RadixTheme Function(Brightness) get plum => _plumTheme;
  static RadixTheme Function(Brightness) get purple => _purpleTheme;
  static RadixTheme Function(Brightness) get violet => _violetTheme;
  static RadixTheme Function(Brightness) get iris => _irisTheme;
  static RadixTheme Function(Brightness) get indigo => _indigoTheme;
  static RadixTheme Function(Brightness) get blue => _blueTheme;
  static RadixTheme Function(Brightness) get cyan => _cyanTheme;
  static RadixTheme Function(Brightness) get teal => _tealTheme;
  static RadixTheme Function(Brightness) get jade => _jadeTheme;
  static RadixTheme Function(Brightness) get green => _greenTheme;
  static RadixTheme Function(Brightness) get grass => _grassTheme;
  static RadixTheme Function(Brightness) get sky => _skyTheme;
  static RadixTheme Function(Brightness) get mint => _mintTheme;
  static RadixTheme Function(Brightness) get lime => _limeTheme;
  static RadixTheme Function(Brightness) get yellow => _yellowTheme;
  static RadixTheme Function(Brightness) get amber => _amberTheme;

  ///will return list of all ThemeNames enum
  static List<ThemeNames> get themeNames => convertEnumToListOfEnum(ThemeNames.amber);

  static RadixTheme _whiteTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.white;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.gray;
    final accent = radixColorsDynamic.iris;

    return _createThemeColors(
      themeName: ThemeNames.white.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _blackTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.black;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.gray;
    final accent = radixColorsDynamic.iris;

    return _createThemeColors(
      themeName: ThemeNames.black.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _greyTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.gray;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.gold;
    final accent = radixColorsDynamic.iris;

    return _createThemeColors(
      themeName: ThemeNames.grey.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  // https://artincontext.org/what-color-goes-with-bronze/#:~:text=real%20aging%20bronze.-,What%20Are%20the%20Best%20Colors%20That%20Complement%20Bronze%3F,and%20make%20it%20stand%20out.
  static RadixTheme _bronzeTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.bronze;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.sand;
    final accent = radixColorsDynamic.orange;

    return _createThemeColors(
      themeName: ThemeNames.bronze.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _goldTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.gold;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.sand;
    final accent = radixColorsDynamic.mint;

    return _createThemeColors(
      themeName: ThemeNames.gold.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _brownTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.brown;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.sand;
    final accent = radixColorsDynamic.lime;

    return _createThemeColors(
      themeName: ThemeNames.brown.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _orangeTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.orange;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.sand;
    final accent = radixColorsDynamic.yellow;

    return _createThemeColors(
      themeName: ThemeNames.orange.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _tomatoTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.tomato;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.mauve;
    final accent = radixColorsDynamic.amber;

    return _createThemeColors(
      themeName: ThemeNames.tomato.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  // https://artincontext.org/what-colors-go-with-red/
  static RadixTheme _redTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.red;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.mauve;
    final accent = radixColorsDynamic.cyan;

    return _createThemeColors(
      themeName: ThemeNames.red.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _rubyTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.ruby;
    final primary = radixColorsDynamic.violet;
    final secondary = radixColorsDynamic.mauve;
    final accent = radixColorsDynamic.gold;

    return _createThemeColors(
      themeName: ThemeNames.ruby.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  //https://artincontext.org/what-colors-go-with-red/
  static RadixTheme _crimsonTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.crimson;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.mauve;
    final accent = radixColorsDynamic.jade;

    return _createThemeColors(
      themeName: ThemeNames.crimson.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  //https://artincontext.org/what-colors-go-with-pink/
  static RadixTheme _pinkTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.pink;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.mauve;
    final accent = radixColorsDynamic.grass;

    return _createThemeColors(
      themeName: ThemeNames.pink.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _plumTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.plum;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.mauve;
    final accent = radixColorsDynamic.amber;

    return _createThemeColors(
      themeName: ThemeNames.plum.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  // https://muffingroup.com/blog/purple-color-palette/
  static RadixTheme _purpleTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.purple;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.mauve;
    final accent = radixColorsDynamic.mint;

    return _createThemeColors(
      themeName: ThemeNames.purple.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _violetTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.violet;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.mauve;
    final accent = radixColorsDynamic.ruby;

    return _createThemeColors(
      themeName: ThemeNames.violet.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _irisTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.iris;
    final primary = radixColorsDynamic.violet;
    final secondary = radixColorsDynamic.slate;
    final accent = radixColorsDynamic.lime;

    return _createThemeColors(
      themeName: ThemeNames.iris.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  // https://muffingroup.com/blog/purple-color-palette/
  static RadixTheme _indigoTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.indigo;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.slate;
    final accent = radixColorsDynamic.amber;

    return _createThemeColors(
      themeName: ThemeNames.indigo.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  // https://muffingroup.com/blog/blue-websites/
  static RadixTheme _blueTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.blue;
    final primary = radixColorsDynamic.indigo;
    final secondary = radixColorsDynamic.slate;
    final accent = radixColorsDynamic.plum;

    return _createThemeColors(
      themeName: ThemeNames.blue.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _cyanTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.cyan;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.slate;
    final accent = radixColorsDynamic.red;

    return _createThemeColors(
      themeName: ThemeNames.cyan.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _tealTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.teal;
    final primary = radixColorsDynamic.violet;
    final secondary = radixColorsDynamic.slate;
    final accent = radixColorsDynamic.ruby;

    return _createThemeColors(
      themeName: ThemeNames.teal.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _jadeTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.jade;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.slate;
    final accent = radixColorsDynamic.crimson;

    return _createThemeColors(
      themeName: ThemeNames.jade.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _greenTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.green;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.slate;
    final accent = radixColorsDynamic.pink;

    return _createThemeColors(
      themeName: ThemeNames.green.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _grassTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.grass;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.olive;
    final accent = radixColorsDynamic.plum;

    return _createThemeColors(
      themeName: ThemeNames.grass.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _skyTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.sky;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.slate;
    final accent = radixColorsDynamic.bronze;

    return _createThemeColors(
      themeName: ThemeNames.sky.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _mintTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.mint;
    final primary = radixColorsDynamic.violet;
    final secondary = radixColorsDynamic.sage;
    final accent = radixColorsDynamic.ruby;

    return _createThemeColors(
      themeName: ThemeNames.mint.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _limeTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.lime;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.olive;
    final accent = radixColorsDynamic.brown;

    return _createThemeColors(
      themeName: ThemeNames.lime.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static RadixTheme _yellowTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.yellow;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.sand;
    final accent = radixColorsDynamic.orange;

    return _createThemeColors(
      themeName: ThemeNames.yellow.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  // https://muffingroup.com/blog/yellow-color-palette/
  static RadixTheme _amberTheme(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);

    final base = radixColorsDynamic.amber;
    final primary = radixColorsDynamic.iris;
    final secondary = radixColorsDynamic.sand;
    final accent = radixColorsDynamic.teal;

    return _createThemeColors(
      themeName: ThemeNames.amber.name,
      brightness: brightness,
      base: base,
      primary: primary,
      secondary: secondary,
      tertiary: accent,
      radixColorsDynamic: radixColorsDynamic,
    );
  }

  static WhiteAndBlackColors _whiteAndBlackColors(Brightness brightness) {
    var radixColor = RadixColorsDynamic(brightness);
    if (brightness == Brightness.dark) {
      //dark theme
      return (
        //while dark theme step1 will be assigned
        white: radixColor.sand.step12,
        //while dark theme step12 will be assigned
        black: radixColor.sand.step1,
      );
    } else {
      //light theme
      return (
        white: Colors.white,
        black: radixColor.gray.step12,
      );
    }
  }

  static RadixTheme _createThemeColors({
    required String themeName,
    required Brightness brightness,
    required RadixColor base,
    required RadixColor primary,
    required RadixColor secondary,
    required RadixColor tertiary,
    required RadixColorsDynamic radixColorsDynamic,
  }) {
    final contrastColors = _contrastColors(brightness);
    final whiteBlackColors = _whiteAndBlackColors(brightness);
    final highlightColors = _highlightColors(brightness);
    final baseText = contrastColors[getColorName(base.name)]!;
    final primaryText = contrastColors[getColorName(primary.name)]!;
    final secondaryText = contrastColors[getColorName(secondary.name)]!;
    final tertiaryText = contrastColors[getColorName(tertiary.name)]!;

    return RadixTheme.theme(
      themeName: themeName.toCapitalize(),
      radixColorsDynamic: radixColorsDynamic,
      staticWhite: whiteBlackColors.white,
      staticBlack: whiteBlackColors.black,
      white: secondary.step1,
      black: secondary.step12,
      base: base,
      baseA: scaleAColors(brightness, base),
      //   baseA: _rxColorSwatch("baseA", scaleAColors(brightness, base), 3),
      baseText: baseText,
      //primary Colors
      primary: primary,
      primaryA: scaleAColors(brightness, primary),
      primaryText: primaryText,
      onPrimary: _radixColorSwatch("onPrimary", primary, 1),
      primaryContainer: _radixColorSwatch("primaryContainer", primary, 3),
      onPrimaryContainer: _radixColorSwatch("onPrimaryContainer", primary, 11),
      //secondary colors
      secondary: secondary,
      secondaryA: scaleAColors(brightness, secondary),
      secondaryText: secondaryText,
      onSecondary: _radixColorSwatch("onSecondary", secondary, 1),
      secondaryContainer: _radixColorSwatch("secondaryContainer", secondary, 3),
      onSecondaryContainer: _radixColorSwatch("onSecondaryContainer", secondary, 11),
      //tertiary colors
      tertiary: tertiary,
      tertiaryA: scaleAColors(brightness, tertiary),
      tertiaryText: tertiaryText,
      onTertiary: _radixColorSwatch("onTertiary", tertiary, 1),
      tertiaryContainer: _radixColorSwatch("tertiaryContainer", tertiary, 3),
      onTertiaryContainer: _radixColorSwatch("onTertiaryContainer", tertiary, 11),
      //error colors
      error: highlightColors.error,
      errorA: scaleAColors(brightness, highlightColors.error),
      errorText: highlightColors.errorText,
      onError: _radixColorSwatch("onError", highlightColors.error, 1),
      errorContainer: _radixColorSwatch("errorContainer", highlightColors.error, 3),
      onErrorContainer: _radixColorSwatch("onErrorContainer", highlightColors.error, 11),
      //info colors
      info: highlightColors.info,
      infoA: scaleAColors(brightness, highlightColors.info),
      infoText: highlightColors.infoText,
      onInfo: _radixColorSwatch("onInfo", highlightColors.info, 1),
      infoContainer: _radixColorSwatch("infoContainer", highlightColors.info, 3),
      onInfoContainer: _radixColorSwatch("onInfoContainer", highlightColors.info, 11),
      //success colors
      success: highlightColors.success,
      successA: scaleAColors(brightness, highlightColors.success),
      successText: highlightColors.successText,
      onSuccess: _radixColorSwatch("onInfo", highlightColors.success, 1),
      successContainer: _radixColorSwatch("infoContainer", highlightColors.success, 3),
      onSuccessContainer: _radixColorSwatch("onInfoContainer", highlightColors.success, 11),
      //warning colors
      warning: highlightColors.warning,
      warningA: scaleAColors(brightness, highlightColors.warning),
      warningText: highlightColors.warningText,
      onWarning: _radixColorSwatch("onInfo", highlightColors.warning, 1),
      warningContainer: _radixColorSwatch("infoContainer", highlightColors.warning, 3),
      onWarningContainer: _radixColorSwatch("onInfoContainer", highlightColors.warning, 11),
      //highlight colors
      highLighterCrimson: highlightColors.highLighterCrimson,
      highLighterCrimsonA: scaleAColors(brightness, highlightColors.highLighterCrimson),
      highLighterCrimsonText: highlightColors.highLighterCrimsonText,
      highLighterIndigo: highlightColors.highLighterIndigo,
      highLighterIndigoA: scaleAColors(brightness, highlightColors.highLighterIndigo),
      highLighterIndigoText: highlightColors.highLighterIndigoText,
      highLighterGreen: highlightColors.highLighterGreen,
      highLighterGreenA: scaleAColors(brightness, highlightColors.highLighterGreen),
      highLighterGreenText: highlightColors.highLighterGreenText,
      highLighterOrange: highlightColors.highLighterOrange,
      highLighterOrangeA: scaleAColors(brightness, highlightColors.highLighterOrange),
      highLighterOrangeText: highlightColors.highLighterOrangeText,
      //background colors
      background: _radixColorSwatch("background", secondary, 1),
      onBackground: _radixColorSwatch("onBackground", secondary, 11),
      subtleBackground: _radixColorSwatch("subtleBackground", secondary, 2),
      onSubtleBackground: _radixColorSwatch("onSubtleBackground", secondary, 11),
      contrastBackground: _radixColorSwatch("contrastBackground", base, 9),
      onContrastBackground: baseText,
      //surface colors
      surface: _radixColorSwatch("surface", base, 2),
      onSurface: _radixColorSwatch("onSurface", base, 11),
      inverseSurface: _radixColorSwatch("inverseSurface", secondary, 10),
      onInverseSurface: _radixColorSwatch("onInverseSurface", secondary, 1),
      surfaceVariant: _radixColorSwatch("surfaceVariant", secondary, 3),
      onSurfaceVariant: _radixColorSwatch("onSurfaceVariant", secondary, 11),
      surfaceTint: _radixColorSwatch("surfaceTint", primary, 3),
      onSurfaceTint: _radixColorSwatch("onSurfaceTint", primary, 11),
      //outline colors
      outline: _radixColorSwatch("outline", secondary, 8),
      outlineVariant: _radixColorSwatch("outlineVariant", secondary, 6),
    );
  }

  static HighlightColors _highlightColors(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);
    final contrastColors = _contrastColors(brightness);

    final RadixColor error = radixColorsDynamic.red;
    final RadixColor info = radixColorsDynamic.cyan;
    final RadixColor success = radixColorsDynamic.grass;
    final RadixColor warning = radixColorsDynamic.amber;
    final RadixColor highLighterCrimson = radixColorsDynamic.crimson;
    final RadixColor highLighterIndigo = radixColorsDynamic.indigo;
    final RadixColor highLighterGreen = radixColorsDynamic.green;
    final RadixColor highLighterOrange = radixColorsDynamic.orange;

    return (
      error: error,
      errorText: contrastColors[getColorName(error.name)]!,
      info: info,
      infoText: contrastColors[getColorName(info.name)]!,
      success: success,
      successText: contrastColors[getColorName(success.name)]!,
      warning: warning,
      warningText: contrastColors[getColorName(warning.name)]!,
      highLighterCrimson: highLighterCrimson,
      highLighterCrimsonText: contrastColors[getColorName(highLighterCrimson.name)]!,
      highLighterIndigo: highLighterIndigo,
      highLighterIndigoText: contrastColors[getColorName(highLighterIndigo.name)]!,
      highLighterGreen: highLighterGreen,
      highLighterGreenText: contrastColors[getColorName(highLighterGreen.name)]!,
      highLighterOrange: highLighterOrange,
      highLighterOrangeText: contrastColors[getColorName(highLighterOrange.name)]!,
    );
  }

  ///dark theme will not work for whiteA and blackA
  static Map<String, RadixColor> _contrastColors(Brightness brightness) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);
    return {
      //grey colors: white foreground text
      "black": radixColorsDynamic.whiteA,
      "gray": radixColorsDynamic.whiteA,
      "mauve": radixColorsDynamic.whiteA,
      "slate": radixColorsDynamic.whiteA,
      "sage": radixColorsDynamic.whiteA,
      "olive": radixColorsDynamic.whiteA,
      "sand": radixColorsDynamic.whiteA,
      //colors: white foreground text
      "tomato": radixColorsDynamic.whiteA,
      "red": radixColorsDynamic.whiteA,
      "ruby": radixColorsDynamic.whiteA,
      "crimson": radixColorsDynamic.whiteA,
      "pink": radixColorsDynamic.whiteA,
      "plum": radixColorsDynamic.whiteA,
      "purple": radixColorsDynamic.whiteA,
      "violet": radixColorsDynamic.whiteA,
      "iris": radixColorsDynamic.whiteA,
      "indigo": radixColorsDynamic.whiteA,
      "blue": radixColorsDynamic.whiteA,
      "cyan": radixColorsDynamic.whiteA,
      "teal": radixColorsDynamic.whiteA,
      "jade": radixColorsDynamic.whiteA,
      "green": radixColorsDynamic.whiteA,
      "grass": radixColorsDynamic.whiteA,
      "orange": radixColorsDynamic.whiteA,
      "brown": radixColorsDynamic.whiteA,
      "gold": radixColorsDynamic.whiteA,
      "bronze": radixColorsDynamic.whiteA,
      //colors: dark foreground text
      "white": radixColorsDynamic.black,
      "sky": radixColorsDynamic.blackA,
      "mint": radixColorsDynamic.blackA,
      "lime": radixColorsDynamic.blackA,
      "yellow": radixColorsDynamic.blackA,
      "amber": radixColorsDynamic.blackA,
    };
  }

  ///returns equivalent alpha scale radixcolor
  static RadixColor scaleAColors(Brightness brightness, RadixColor color) {
    final radixColorsDynamic = RadixColorsDynamic(brightness);
    final radixScaleAColors = {
      //grey colors: white foreground text
      "black": radixColorsDynamic.blackA,
      "gray": radixColorsDynamic.grayA,
      "mauve": radixColorsDynamic.mauveA,
      "slate": radixColorsDynamic.slateA,
      "sage": radixColorsDynamic.sageA,
      "olive": radixColorsDynamic.oliveA,
      "sand": radixColorsDynamic.sandA,
      //colors: white foreground text
      "tomato": radixColorsDynamic.tomatoA,
      "red": radixColorsDynamic.redA,
      "ruby": radixColorsDynamic.rubyA,
      "crimson": radixColorsDynamic.crimsonA,
      "pink": radixColorsDynamic.pinkA,
      "plum": radixColorsDynamic.plumA,
      "purple": radixColorsDynamic.purpleA,
      "violet": radixColorsDynamic.violetA,
      "iris": radixColorsDynamic.irisA,
      "indigo": radixColorsDynamic.indigoA,
      "blue": radixColorsDynamic.blueA,
      "cyan": radixColorsDynamic.cyanA,
      "teal": radixColorsDynamic.tealA,
      "jade": radixColorsDynamic.jadeA,
      "green": radixColorsDynamic.greenA,
      "grass": radixColorsDynamic.grassA,
      "orange": radixColorsDynamic.orangeA,
      "brown": radixColorsDynamic.brownA,
      "gold": radixColorsDynamic.goldA,
      "bronze": radixColorsDynamic.bronzeA,
      //colors: dark foreground text
      "white": radixColorsDynamic.whiteA,
      "sky": radixColorsDynamic.skyA,
      "mint": radixColorsDynamic.mintA,
      "lime": radixColorsDynamic.limeA,
      "yellow": radixColorsDynamic.yellowA,
      "amber": radixColorsDynamic.amberA,
    };
    return radixScaleAColors[getColorName(color.name)]!;
  }

  /// returns radix color swatch with default step and name as required
  static RadixColor _radixColorSwatch(
    String name,
    RadixColor color,
    int initStep,
  ) {
    final colorSwatch = {
      1: color.step1,
      2: color.step2,
      3: color.step3,
      4: color.step4,
      5: color.step5,
      6: color.step6,
      7: color.step7,
      8: color.step8,
      9: color.step9,
      10: color.step10,
      11: color.step11,
      12: color.step12,
    };

    return RadixColor(colorSwatch[initStep]!.value, colorSwatch, name: name);
  }

  ///remove characters Caps 'A' | 'Dark' | 'DarkA' from string and return plain color name
  ///
  ///ex: 'blueA' => 'blue', 'blueDark' => 'blue', 'blueDarkA' => 'blue'
  static String getColorName(String? name) => name!.replaceAll(RegExp(r'[A]|Dark'), "");
}

typedef HighlightColors = ({
  RadixColor error,
  RadixColor errorText,
  RadixColor info,
  RadixColor infoText,
  RadixColor success,
  RadixColor successText,
  RadixColor warning,
  RadixColor warningText,
  RadixColor highLighterCrimson,
  RadixColor highLighterCrimsonText,
  RadixColor highLighterIndigo,
  RadixColor highLighterIndigoText,
  RadixColor highLighterGreen,
  RadixColor highLighterGreenText,
  RadixColor highLighterOrange,
  RadixColor highLighterOrangeText,
});

typedef WhiteAndBlackColors = ({
  Color white,
  Color black,
});
