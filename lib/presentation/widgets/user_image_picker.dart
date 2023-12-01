import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const _filename = "user_image_picker.dart";

Future<void> userImagePicker(
    {required BuildContext context, required Function(File pickedImage) onPickImage}) async {
  final imageSource = await showDialog<ImageSource>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Select Photo from Camera or Gallery'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, ImageSource.camera),
          child: const Text("Camera"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, ImageSource.gallery),
          child: const Text('Gallery'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
  if (imageSource == null) return;

  final pickedImage = await ImagePicker().pickImage(
    source: imageSource,
    preferredCameraDevice: CameraDevice.front,
    maxWidth: 800,
  );

  if (pickedImage == null) {
    return;
  }

  onPickImage(File(pickedImage.path));
}
