import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  void _takePicture(String choice) {
    final imagePicker = ImagePicker();
    if (choice == 'camera') {
      imagePicker.pickImage(source: ImageSource.camera);
    } else if (choice == 'gallery') {
      imagePicker.pickImage(source: ImageSource.gallery);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(2))),
      alignment: Alignment.center,
      height: 250,
      width: double.infinity,
      child: Row(
        children: [
          TextButton.icon(
            onPressed: () {
              _takePicture('camera');
            },
            label: const Text('Take Picture'),
            icon: const Icon(Icons.camera),
          ),
          const SizedBox(
            width: 16,
          ),
          TextButton.icon(
            onPressed: () {
              _takePicture('gallery');
            },
            label: const Text('Choose from gallery'),
            icon: const Icon(Icons.photo),
          ),
        ],
      ),
    );
  }
}
