import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "responsive.dart";

class Responsive extends ConsumerWidget {
  final Widget? desktopLarge;
  final Widget? desktop;
  final Widget? tabletLandscape;

  ///mobile landscape can be used for tablet portrait also
  final Widget? mobileLandscape;
  final Widget? mobilePortrait;
  final Widget smallScreen;
  const Responsive({
    Key? key,
    this.desktopLarge,
    this.desktop,
    this.tabletLandscape,
    this.mobileLandscape,
    required this.mobilePortrait,
    required this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext ctx) => screenWidth(ctx) < 340;
  static bool isMobilePortrait(BuildContext ctx) => screenWidth(ctx) >= 340 && screenWidth(ctx) < 500;
  static bool isMobileLandscapeOrTablet(BuildContext ctx) =>
      screenWidth(ctx) >= 500 && screenWidth(ctx) < 860;
  static bool isTabletLandscape(BuildContext ctx) => screenWidth(ctx) >= 860 && screenWidth(ctx) < 1100;
  static bool isDesktop(BuildContext ctx) => screenWidth(ctx) >= 1100 && screenWidth(ctx) < 1600;
  static bool isDesktopLarge(BuildContext ctx) => screenWidth(ctx) >= 1600;

  static double screenWidth(BuildContext ctx) => MediaQuery.of(ctx).size.width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= 1600 && desktopLarge != null) {
      return desktopLarge!;
    } else if (size.width >= 1100 && desktop != null) {
      return desktop!;
    } else if (size.width >= 860 && tabletLandscape != null) {
      return tabletLandscape!;
    } else if (size.width > 500 && mobileLandscape != null) {
      return mobileLandscape!;
    } else if (size.width > 340 && mobilePortrait != null) {
      return mobilePortrait!;
    } else {
      return smallScreen;
    }
  }
}

/// returns any value supplied to the params <br> if the screen width meets below condition
///
/// desktopLarge: >= 1600\
/// desktop: >= 1100\
/// tabletLandscape: >= 860\
/// mobileLandscape: > 500\
/// mobilePortrait: > 340\
/// smallScreen: below 340
T responsive<T>({
  required BuildContext context,
  BoxConstraints? constraints,
  T? desktopLarge,
  T? desktop,
  T? tabletLandscape,
  T? mobileLandscape,
  required T? mobilePortrait,
  required T smallScreen,
}) {
  final Size size = MediaQuery.of(context).size;
  double width = constraints != null ? constraints.maxWidth : size.width;

  dPrint(filename: _filename, msg: width, tag: "window-width");

  if (width >= 1600 && desktopLarge != null) {
    return desktopLarge;
  } else if (width >= 1100 && desktop != null) {
    return desktop;
  } else if (width >= 860 && tabletLandscape != null) {
    return tabletLandscape;
  } else if (width > 500 && mobileLandscape != null) {
    return mobileLandscape;
  } else if (width > 340 && mobilePortrait != null) {
    return mobilePortrait;
  } else {
    return smallScreen;
  }
}
