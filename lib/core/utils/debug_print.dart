import 'package:flutter/material.dart';

dPrint({required String filename, required msg, String? tag}) {
  String newTag = "DebugTag:${tag != null && tag.isNotEmpty ? ' $tag:' : ''}";
  debugPrint("$filename: ${DateTime.now()} $newTag $msg");
}
