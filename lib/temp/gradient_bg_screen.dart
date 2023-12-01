import 'package:flutter_widget_examples/core/providers/brightness_provider.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radix_colors/radix_colors.dart';

const _filename = "gradient_bg_screen.dart";

class GradientBg extends ConsumerStatefulWidget {
  const GradientBg({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GradientBgState();
}

class _GradientBgState extends ConsumerState<GradientBg> {
  @override
  Widget build(BuildContext context) {
    final brightness = ref.watch(brightnessProvider);
    dPrint(filename: _filename, msg: "Widget build...");

    return Padding(
      padding: const EdgeInsets.all(80),
      child: Ink(
        decoration: BoxDecoration(
          gradient: SweepGradient(
            colors: [
              RadixColorsDynamic(brightness).redA.step2,
              RadixColorsDynamic(brightness).orangeA.step2,
              RadixColorsDynamic(brightness).yellowA.step2,
              RadixColorsDynamic(brightness).grassA.step2,
              RadixColorsDynamic(brightness).blueA.step2,
              RadixColorsDynamic(brightness).indigoA.step2,
              RadixColorsDynamic(brightness).violetA.step2,
            ],
            center: Alignment.topCenter,
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Text("SweepGradient Background "),
        ),
      ),
    );
  }
}
