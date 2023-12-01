import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform;
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';

const _filename = "check_platform.dart";

class CheckPlatform {
  static final CheckPlatform _instance = CheckPlatform._();
  static CheckPlatform get instance => _instance;
  late bool isWeb = false;
  late bool isMobile = false;
  late bool isAndroid = false;
  late bool isIOS = false;
  late bool isDesktop = false;
  late bool isLinux = false;
  late bool isWindows = false;
  late bool isMacOS = false;

  CheckPlatform._() {
    dPrint(filename: _filename, msg: "CheckPlatfrom private constructor...");
    if (kIsWeb) {
      isWeb = true;
    } else {
      if (TargetPlatform.android == defaultTargetPlatform) {
        isMobile = true;
        isAndroid = true;
      } else if (TargetPlatform.iOS == defaultTargetPlatform) {
        isMobile = true;
        isIOS = true;
      } else if (TargetPlatform.linux == defaultTargetPlatform) {
        isDesktop = true;
        isLinux = true;
      } else if (TargetPlatform.windows == defaultTargetPlatform) {
        isDesktop = true;
        isWindows = true;
      } else if (TargetPlatform.macOS == defaultTargetPlatform) {
        isDesktop = true;
        isMacOS = true;
      }
    }
  }

  factory CheckPlatform() => _instance;
}
