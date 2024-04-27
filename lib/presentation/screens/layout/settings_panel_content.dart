import 'package:flutter_widget_examples/controller/theme_controller.dart';
import 'package:flutter_widget_examples/core/providers/brightness_provider.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/presentation/widgets/color_swatch.dart';
import 'package:flutter_widget_examples/controller/role_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPanelContent extends ConsumerStatefulWidget {
  const SettingsPanelContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPanelContentState();
}

class _SettingsPanelContentState extends ConsumerState<SettingsPanelContent> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);
    final role = ref.watch(roleControllerProvider);
    final brightness = ref.watch(brightnessProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ListTile(
            title: Text('Bluetooth:'),
            visualDensity: VisualDensity(vertical: -4),
          ),
          Divider(color: theme.outline, indent: 8, endIndent: 8),
          ListTile(
            title: const Text('Theme:'),
            visualDensity: const VisualDensity(vertical: -4),
            trailing: Text(theme.themeName),
          ),
          SwitchListTile(
            title: Text(brightness == Brightness.light ? "Set Dark Theme" : "Set Light Theme"),
            activeColor: theme.primary.step11,
            value: brightness == Brightness.dark,
            onChanged: (bool value) {
              ref.read(themeControllerProvider).toggleDarkTheme();
            },
            visualDensity: const VisualDensity(vertical: -4),
          ),
          Divider(color: theme.outline, indent: 8, endIndent: 8),
          const ColorSwatchWidget(),
          Divider(color: theme.outline, indent: 8, endIndent: 8),
          // if (role.isSystemAdmin())
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Card(
                        color: theme.primary,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                          child: Text("PR"),
                        )),
                    Card(
                        color: theme.secondary,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Text("SE"),
                        )),
                    Card(
                        color: theme.accent,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Text("AC"),
                        )),
                    Card(
                        color: theme.info,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Text("IN"),
                        )),
                    Card(
                        color: theme.success,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Text("SU"),
                        )),
                    Card(
                        color: theme.warning,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Text("WA"),
                        )),
                    Card(
                        color: theme.error,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Text("ER"),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Card(
                        color: theme.surface,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Text("SF"),
                        )),
                    Card(
                        color: theme.surfaceVariant,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                          child: Text("SFV"),
                        )),
                    Card(
                        color: theme.outline,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                          child: Text("OU"),
                        )),
                    Card(
                        color: theme.hlInfo,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Text("HI"),
                        )),
                    Card(
                        color: theme.hlSuccess,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Text("HS"),
                        )),
                    Card(
                        color: theme.hlWarning,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Text("HW"),
                        )),
                    Card(
                        color: theme.hlError,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Text("HE"),
                        )),
                  ],
                ),
              ),
              Divider(color: theme.outline, indent: 8, endIndent: 8),
            ],
          ),
        ],
      ),
    );
  }
}
