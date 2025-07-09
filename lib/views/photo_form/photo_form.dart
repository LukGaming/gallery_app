import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_app/domain/models/photo_model.dart';
import 'package:gallery_app/views/widgets/icon_dialog_button.dart';
import 'package:image_picker/image_picker.dart';

class PhotoForm extends StatefulWidget {
  const PhotoForm({super.key});

  @override
  State<PhotoForm> createState() => _PhotoFormState();
}

class _PhotoFormState extends State<PhotoForm> {
  final ImagePicker _picker = ImagePicker();
  final _titleController = TextEditingController();
  File? _selectedImage;

  @override
  void dispose() {
    _titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
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
              TextFormField(
                decoration: const InputDecoration(labelText: "Título"),
                controller: _titleController,
                textCapitalization: TextCapitalization.words,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Informe um título'
                    : null,
              ),
              OverflowBar(
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  IconDialogButton(
                    iconData: Icons.photo_library,
                    text: 'Galeria',
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                  IconDialogButton(
                    iconData: Icons.camera_alt,
                    text: 'Câmera',
                    onPressed: () => _pickImage(ImageSource.camera),
                  ),
                  IconDialogButton(
                    iconData: _selectedImage == null
                        ? Icons.close
                        : Icons.save_rounded,
                    text: _selectedImage == null ? 'Fechar' : 'Salvar',
                    onPressed: _savePhoto,
                  ),
                ],
              ),
            ],
          ),
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

  void _savePhoto() {
    if (_selectedImage == null) {
      Navigator.of(context).pop();
      return;
    }

    final newPhoto = PhotoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      path: _selectedImage!.path,
    );

    // Here you would typically save the photo to a database or file system.
    // For this example, we will just return it to the previous screen.
    Navigator.of(context).pop(newPhoto);
  }
}
