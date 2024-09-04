import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  Future<void> _requestPermission() async {
    if (await Permission.camera.request().isGranted) {
      print('Permission is granted.');
    } else {
      print('permission is denied.');
    }
  }

  void _takePicture() async {
    final imagePicker = ImagePicker();

    try {
      final pickedImage = await imagePicker.pickImage(
          source: ImageSource.camera, maxWidth: 600);
      if (pickedImage == null) {
        return;
      }
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    } catch (error) {
      print('Error picking image: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      label: const Text('Take Picture'),
      icon: const Icon(Icons.camera),
    );

    if (_selectedImage != null) {
      content = Image.file(
        _selectedImage!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
        alignment: Alignment.center,
        height: 250,
        width: double.infinity,
        child: content);
  }
}
