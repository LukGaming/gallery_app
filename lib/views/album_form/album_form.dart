import 'package:flutter/material.dart';
import 'package:gallery_app/domain/models/album_model.dart';
import 'package:gallery_app/views/widgets/icon_dialog_button.dart';

class AlbumForm extends StatefulWidget {
  const AlbumForm({super.key});

  @override
  State<AlbumForm> createState() => _AlbumFormState();
}

class _AlbumFormState extends State<AlbumForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

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
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newAlbum = AlbumModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          title: _titleController.text,
                          createdAt: DateTime.now(),
                        );

                        Navigator.of(context).pop(newAlbum);
                      }
                    },
                    iconData: Icons.save_rounded,
                    text: "Salvar",
                  ),
                  IconDialogButton(
                    onPressed: () => Navigator.of(context).pop(),
                    iconData: Icons.close_rounded,
                    text: "Fechar",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
