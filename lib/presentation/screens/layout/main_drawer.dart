import 'package:flutter_widget_examples/controller/role_controller.dart';
import 'package:flutter_widget_examples/controller/screen_controller.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/app_bar.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/bottom_status_bar.dart';

const _filename = "main_drawer.dart";

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainDrawerState();
}

class _MainDrawerState extends ConsumerState<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);
    // final role = ref.watch(roleControllerProvider);
    final screenController = ref.watch(screenControllerProvider);
    final screenControllerNotifier = ref.watch(screenControllerProvider.notifier);
    dPrint(filename: _filename, msg: "Main drawer widget build...");

    return Drawer(
      backgroundColor: theme.base.step2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.base.step3,
                  theme.base.step6,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.monitor_weight_rounded,
                    size: 48,
                    color: theme.base.step12,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "MBF Weighment",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: theme.base.step12, fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(children: [
              ListTile(
                selected: screenController.screenName == Screens.home,
                hoverColor: theme.base.step4,
                selectedTileColor: theme.base.step5,
                leading: Icon(
                  Icons.home,
                  size: 20,
                  color: theme.base.step12,
                ),
                title: Text(
                  "Home",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: theme.base.step12,
                        fontSize: 18,
                      ),
                ),
                onTap: () {
                  if (Navigator.of(context).canPop()) {
                    pushScreen(context, Screens.home);
                  } else {
                    Navigator.pop(context);
                    screenControllerNotifier.switchScreen(screen: Screens.home);
                  }
                },
              ),
              // if (role.isAdmin() || role.isSystemAdmin())
              ExpansionTile(
                iconColor: theme.base.step11,
                //   initiallyExpanded:
                //       screen.toString() == "TestScreen" || screen.toString() == "RadixTestScreen",
                initiallyExpanded: true,
                title: Text("Admin",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: theme.base.step12, fontSize: 18)),
                collapsedIconColor: theme.primary.step11,
                children: <Widget>[
                  ListTile(
                    selected: screenController.screenName == Screens.screens,
                    hoverColor: theme.base.step4,
                    selectedTileColor: theme.base.step5,
                    leading: Icon(Icons.person_add, size: 20, color: theme.base.step12),
                    title: Text("Screens",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: theme.base.step12, fontSize: 18)),
                    onTap: () {
                      pushScreen(context, Screens.screens);
                    },
                  ),
                ],
              ),
              ExpansionTile(
                iconColor: theme.base.step11,
                //   initiallyExpanded:
                //       screen.toString() == "TestScreen" || screen.toString() == "RadixTestScreen",
                initiallyExpanded: true,
                title: Text("Test Pages",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: theme.base.step12, fontSize: 18)),
                collapsedIconColor: theme.primary.step11,
                children: <Widget>[
                  ListTile(
                    selected: screenController.screenName == Screens.materialThemeDemo,
                    hoverColor: theme.base.step4,
                    selectedTileColor: theme.base.step5,
                    leading: Icon(Icons.line_weight, size: 20, color: theme.base.step12),
                    title: Text("MaterialTheme Demo",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: theme.base.step12, fontSize: 18)),
                    onTap: () {
                      pushScreen(context, Screens.materialThemeDemo);
                    },
                  ),
                  ListTile(
                    selected: screenController.screenName == Screens.customMaterialTheme,
                    hoverColor: theme.base.step4,
                    selectedTileColor: theme.base.step5,
                    leading: Icon(Icons.line_weight, size: 20, color: theme.base.step12),
                    title: Text("Custom MaterialTheme",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: theme.base.step12, fontSize: 18)),
                    onTap: () {
                      pushScreen(context, Screens.customMaterialTheme);
                    },
                  ),
                  ListTile(
                    selected: screenController.screenName == Screens.radixTestScreenDemo,
                    hoverColor: theme.base.step4,
                    selectedTileColor: theme.base.step5,
                    leading: Icon(Icons.settings, size: 20, color: theme.base.step12),
                    title: Text("Test Screen - RadixTheme",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: theme.base.step12, fontSize: 18)),
                    onTap: () {
                      pushScreen(context, Screens.radixTestScreenDemo);
                    },
                  ),
                  ListTile(
                      selected: screenController.screenName == Screens.sidePanelExample,
                      hoverColor: theme.base.step4,
                      selectedTileColor: theme.base.step5,
                      leading: Icon(Icons.settings, size: 20, color: theme.base.step12),
                      title: Text("Side Panel",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: theme.base.step12, fontSize: 18)),
                      onTap: () {
                        pushScreen(context, Screens.sidePanelExample);
                      }),
                  ListTile(
                    selected: screenController.screenName == Screens.gradientBgDemo,
                    hoverColor: theme.base.step4,
                    selectedTileColor: theme.base.step5,
                    leading: Icon(Icons.settings, size: 20, color: theme.base.step12),
                    title: Text("Gradient Background",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: theme.base.step12, fontSize: 18)),
                    onTap: () {
                      pushScreen(context, Screens.gradientBgDemo);
                    },
                  ),
                  ListTile(
                    selected: screenController.screenName == Screens.readWriteDemo,
                    hoverColor: theme.base.step4,
                    selectedTileColor: theme.base.step5,
                    leading: Icon(Icons.settings, size: 20, color: theme.base.step12),
                    title: Text("Read and Write files",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: theme.base.step12, fontSize: 18)),
                    onTap: () {
                      pushScreen(context, Screens.readWriteDemo);
                    },
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void pushScreen(BuildContext context, Screens screen) {
    Navigator.pop(context); //close main drawer
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Scaffold(
            appBar: const AppBarWidget(),
            drawer: const MainDrawer(),
            bottomNavigationBar: const BottomStatusBar(),
            body: ScreenController.getScreen(screen));
      }),
    );
  }
}
