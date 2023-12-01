import 'dart:io';

import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

const _filename = "image_picker.dart";

class UserImagePickerDemo extends ConsumerStatefulWidget {
  const UserImagePickerDemo({
    super.key,
    required this.onPickImage,
    this.onPickMultiImage,
    this.onPickVideo,
    this.onPickFile,
    this.onPickMultipleFiles,
  });

  final void Function(File pickedImage) onPickImage;
  final void Function(File pickedVideo)? onPickVideo;
  final void Function(List<File> pickedMultiImage)? onPickMultiImage;
  final void Function(File pickedMedia)? onPickFile;
  final void Function(List<File> pickedMultipleMedia)? onPickMultipleFiles;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserImagePickerDemoState();
}

class _UserImagePickerDemoState extends ConsumerState<UserImagePickerDemo> {
  File? _pickedImageFile;
  File? _pickedVideoFile;
  final List<File> _pickedMultiImageFiles = [];
  File? _pickedMediaFile;
  final List<File> _pickedMultipleMediaFiles = [];

  void _pickImage() async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Select Photo from Camera or Gallery'),
        // content: const Text('Photo from Camera or Gallery'),
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
      imageQuality: 100,
      maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    widget.onPickImage(_pickedImageFile!);
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  void _pickMultiImage() async {
    final pickedImage = await ImagePicker().pickMultiImage(
      imageQuality: 100,
      maxWidth: 150,
    );

    if (pickedImage.isEmpty) {
      return;
    }

    for (var file in pickedImage) {
      setState(() {
        _pickedMultiImageFiles.add(File(file.path));
      });
    }
    if (widget.onPickMultiImage != null) {
      widget.onPickMultiImage!(_pickedMultiImageFiles);
    }
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  void _pickVideo() async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Select Video from Camera or Gallery'),
        // content: const Text('Photo from Camera or Gallery'),
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
    dPrint(filename: _filename, msg: imageSource, tag: "alert");
    if (imageSource == null) return;

    final pickedVideo = await ImagePicker().pickVideo(source: imageSource);

    if (pickedVideo == null) {
      return;
    }

    setState(() {
      _pickedVideoFile = File(pickedVideo.path);
    });

    widget.onPickImage(_pickedVideoFile!);
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  void _pickFile() async {
    final pickedMedia = await ImagePicker().pickMedia();

    if (pickedMedia == null) {
      return;
    }

    setState(() {
      _pickedMediaFile = File(pickedMedia.path);
    });

    if (widget.onPickFile != null) {
      widget.onPickFile!(_pickedMediaFile!);
    }
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  void _pickMultipleFiles() async {
    final pickedMultiMedia = await ImagePicker().pickMultipleMedia();

    if (pickedMultiMedia.isEmpty) {
      return;
    }

    for (var file in pickedMultiMedia) {
      setState(() {
        _pickedMultipleMediaFiles.add(File(file.path));
      });
    }
    if (widget.onPickMultipleFiles != null) {
      widget.onPickMultipleFiles!(_pickedMultipleMediaFiles);
    }

    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);
    return Scaffold(
      backgroundColor: theme.subtleBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //   CircleAvatar(
                  //     radius: 40,
                  //     backgroundColor: Colors.grey,
                  //     foregroundImage: _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
                  //   ),
                  TextButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.image),
                    label: Text(
                      'Take or Add Image',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _pickMultiImage,
                icon: const Icon(Icons.perm_media),
                label: Text(
                  'Pick Multiple Image Files',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _pickVideo,
                icon: const Icon(Icons.videocam),
                label: Text(
                  'Take or Add Video',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _pickFile,
                icon: const Icon(Icons.file_open),
                label: Text(
                  'Pick Any Single File',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _pickMultipleFiles,
                icon: const Icon(Icons.file_copy),
                label: Text(
                  'Pick Any Multiple Files',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
