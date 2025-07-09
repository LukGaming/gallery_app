import 'package:flutter/material.dart';
import 'package:gallery_app/data/lists_mock.dart';
import 'package:gallery_app/domain/models/album_model.dart';
import 'package:gallery_app/domain/models/photo_model.dart';
import 'package:gallery_app/views/album_form/album_form.dart';
import 'package:gallery_app/views/home_page/albums_grid/albums_grid_view.dart';
import 'package:gallery_app/views/widgets/top_menu.dart';
import 'package:gallery_app/views/home_page/photos_grid/photos_grid_view.dart';
import 'package:gallery_app/views/photo_form/photo_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          size: 40,
          color: Colors.greenAccent,
        ),
        elevation: 16,
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library_rounded),
            label: 'Albuns',
          ),
          BottomNavigationBarItem(
            label: 'Fotos',
            icon: Icon(Icons.photo),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TopMenu(),
            _currentIndex == 0
                ? Expanded(
                    child: AlbumGridView(),
                  )
                : PhotosGridView(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _processFloatActionButton,
        child: Icon(Icons.add),
      ),
    );
  }

  void _processFloatActionButton() {
    switch (_currentIndex) {
      case 0:
        _newAlbum();
        break;
      case 1:
        _addNewPhoto();
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ação desconhecida.')),
        );
        break;
    }
  }

  Future<void> _newAlbum() async {
    final albumTitle = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Criar novo álbum'),
        content: const AlbumForm(),
      ),
    );

    if (albumTitle == null || albumTitle!.trim().isEmpty) return;

    // Adding a new album to the list
    final newAlbum = AlbumModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: albumTitle,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    setState(() {
      albums.add(newAlbum);
    });
  }

  Future<void> _addNewPhoto() async {
    final newPhoto = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Adicionar Foto'),
        content: const PhotoForm(),
      ),
    );

    if (newPhoto == null) return;

    final photo = PhotoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      path: newPhoto.path,
    );

    debugPrint('Nova foto: ${photo.path}');
  }
}
