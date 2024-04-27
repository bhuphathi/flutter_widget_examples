import 'dart:io';

import 'package:flutter_widget_examples/controller/providers/userinfo_model_provider.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter_widget_examples/presentation/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "user_profile_panel.dart";

class UserProfilePanel extends ConsumerStatefulWidget {
  const UserProfilePanel({super.key, required this.toggleUserPanel});

  final void Function() toggleUserPanel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserProfilePanelState();
}

class _UserProfilePanelState extends ConsumerState<UserProfilePanel> {
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    final authUser = ref.watch(authUserProvider);
    final theme = ref.watch(radixThemeProvider);
    dPrint(filename: _filename, msg: "User profile panel Widget build...");

    return Container(
      color: theme.base.step2,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [theme.base.step2, theme.base.step4],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (authUser.displayName != null) Text(authUser.displayName!),
                      const SizedBox(height: 12),
                      if (authUser.phoneNumber != null) Text(authUser.phoneNumber!),
                      Text(authUser.email ?? ""),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await userImagePicker(
                        context: context, onPickImage: (pickedImage) => profileImage = pickedImage);
                    if (profileImage != null && authUser.uid != null) {
                      dPrint(
                          filename: _filename, msg: profileImage, tag: "${authUser.uid} profileImage");
                    }
                  },
                  child: CircleAvatar(
                    backgroundImage: authUser.photoURL != null ? NetworkImage(authUser.photoURL!) : null,
                    backgroundColor: theme.secondary.step5,
                    foregroundColor: theme.secondary.step9,
                    radius: 36,
                    child: authUser.email == null ? const Icon(Icons.person_outline, size: 20) : null,
                  ),
                ),
              ],
            ),
          ),
          Divider(indent: 8, endIndent: 8, color: theme.outline),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            minLeadingWidth: 0,
            horizontalTitleGap: 10,
            dense: true,
            leading: const Icon(Icons.logout_outlined),
            title: const Text("Sign out"),
            onTap: () {
              widget.toggleUserPanel();
            },
          )
        ],
      ),
    );
  }
}
