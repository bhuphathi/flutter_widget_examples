import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/controller/theme_controller.dart';
import 'package:flutter_widget_examples/core/providers/brightness_provider.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/check_platform.dart';
import 'package:flutter_widget_examples/presentation/screens/body_content.dart';
import 'package:flutter_widget_examples/presentation/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: FlutterWidgets()));
}

class FlutterWidgets extends ConsumerStatefulWidget {
  const FlutterWidgets({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _FlutterWidgetsState();
}

class _FlutterWidgetsState extends ConsumerState<FlutterWidgets> {
  @override
  void initState() {
    super.initState();

    ref.read(themeControllerProvider).init();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = ref.watch(brightnessProvider);
    final theme = ref.watch(radixThemeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark().copyWith(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: const Color.fromARGB(255, 147, 229, 250),
      //     brightness: Brightness.dark,
      //   ),
      // ),
      theme: ThemeData(
        brightness: brightness,
        textTheme: GoogleFonts.ubuntuTextTheme(TextTheme(bodyMedium: TextStyle(color: theme.black))),
        colorScheme: ColorScheme.fromSeed(seedColor: theme.primary, brightness: brightness),
        // canvasColor: theme.secondary.step2,
      ),
      home: const MainScreen(),
    );
  }
}
