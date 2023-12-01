import 'package:flutter_widget_examples/controller/providers/userinfo_model_provider.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/check_platform.dart';
import 'package:flutter_widget_examples/presentation/screens/layout/user_profile_panel.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "user_profile.dart";

class UserProfileButton extends ConsumerStatefulWidget {
  const UserProfileButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserProfileButtonState();
}

class _UserProfileButtonState extends ConsumerState<UserProfileButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> offsetAnimation;
  late Animation<double> fadeAnimation;
  final OverlayPortalController userPanelOverlayController = OverlayPortalController();
  double animatedValue = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    offsetAnimation = Tween<Offset>(
      begin: const Offset(1.01, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));

    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
  }

  void toggleUserPanel() async {
    final currentUser = ref.read(authUserProvider);
    //if there is no user logged in will navigate to auth screen
    if (currentUser.email == null) {

      return;
    }

    //if about to show overlay (that is on hidden stage overlay can be turned on immediately, animation will work)
    if (!userPanelOverlayController.isShowing) {
      userPanelOverlayController.toggle();
      setState(() {
        animationController.reset();
        //wait for overlay to initialize
        Future.delayed(const Duration(milliseconds: 20), () {
          animationController.forward();
        });
      });
    } else {
      setState(() {
        animationController.reverse();
      });
      //after animation finished overlay will be hidden
      Future.delayed(const Duration(milliseconds: 400), () {
        userPanelOverlayController.toggle();
      });
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);
    final currentUser = ref.watch(authUserProvider);
    // FocusManager.instance.primaryFocus?.unfocus();
    dPrint(filename: _filename, msg: "User profile button widget build...");

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: theme.accent.step1,
        foregroundColor: theme.accent,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        minimumSize: const Size(40, 36),
      ),
      onPressed: toggleUserPanel,
      child: OverlayPortal(
        controller: userPanelOverlayController,
        overlayChildBuilder: (BuildContext context) {
          return Stack(children: [
            //transparent dismissable barrier background
            InkWell(
              onTap: toggleUserPanel,
              child: SizedBox.expand(
                child: Container(color: theme.secondaryA.step4),
              ),
            ),
            Positioned(
              right: 0,
              top: (CheckPlatform().isWeb || CheckPlatform().isDesktop) ? 40 : 79,
              child: SizedBox(
                width: 280,
                height: 500,
                child: SlideTransition(
                  position: offsetAnimation,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: theme.subtleBackground,
                    margin: const EdgeInsets.only(top: 8),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4), topLeft: Radius.circular(4))),
                    child: UserProfilePanel(toggleUserPanel: toggleUserPanel),
                  ),
                ),
              ),
            ),
          ]);
        },
        child: currentUser.photoURL != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(currentUser.photoURL!),
                backgroundColor: theme.secondaryA.step5,
                radius: 20)
            : Icon(currentUser.email != null ? Icons.person : Icons.person_outline, size: 20),
      ),
    );
  }
}
