import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoForm extends StatefulWidget {
  const PhotoForm({super.key});

  @override
  State<PhotoForm> createState() => _PhotoFormState();
}

class _PhotoFormState extends State<PhotoForm> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedImage != null)
              Image.file(
                _selectedImage!,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              )
            else
              Icon(
                Icons.image,
                size: 100,
                color: Colors.grey[400],
              ),
            const SizedBox(height: 20),
            OverflowBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.photo_library),
                  tooltip: 'Galeria',
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  tooltip: 'Câmera',
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  tooltip: 'Fechar',
                  onPressed: () => Navigator.of(context).pop(_selectedImage),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 600,
      imageQuality: 80,
    );
    if (pickedFile == null) return;
    setState(() {
      _selectedImage = File(pickedFile.path);
    });
  }
}
