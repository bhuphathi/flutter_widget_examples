import 'package:flutter/material.dart';

// const _filename = "loading.dart";

BuildContext loading(BuildContext context, {Color? barrierColor, Color? indicatorColor}) {
  BuildContext dialogContext = context;
  showDialog(
    barrierLabel: "loading",
    barrierColor: barrierColor ?? Colors.white54,
    barrierDismissible: false,
    context: context,
    builder: (context) {
      dialogContext = context;
      return SafeArea(
        child: Center(
          child: CircularProgressIndicator(color: indicatorColor),
        ),
      );
    },
  );
  return dialogContext;
}
