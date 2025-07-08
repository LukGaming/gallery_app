import 'package:flutter/material.dart';
import 'package:gallery_app/domain/models/album_model.dart';
import 'package:gallery_app/views/album_form/album_form.dart';
import 'package:gallery_app/views/albums/albums_page.dart';
import 'package:gallery_app/views/home_page/top_menu.dart';
import 'package:gallery_app/views/photos/photos_grid_view.dart';

final List<AlbumModel> albums = [
  AlbumModel(
    id: "1",
    title: "Férias de verão",
    numberOfPhotos: 34,
    createdAt: DateTime(2023, 6, 1),
    favorite: true,
  ),
  AlbumModel(
    id: "2",
    title: "Aniversário da Maria",
    numberOfPhotos: 25,
    createdAt: DateTime(2023, 7, 15),
    favorite: false,
  ),
  AlbumModel(
    id: "3",
    title: "Viagem à praia",
    numberOfPhotos: 18,
    createdAt: DateTime(2023, 8, 20),
    favorite: true,
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          size: 40,
          color: Colors.greenAccent,
        ),
        elevation: 16,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library_rounded),
            label: "Albuns",
          ),
          BottomNavigationBarItem(
            label: "Fotos",
            icon: Icon(Icons.photo),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TopMenu(),
            currentIndex == 0
                ? Expanded(
                    child: AlbumList(),
                  )
                : PhotosGridView(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: newAlbum,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> newAlbum() async {
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
}
