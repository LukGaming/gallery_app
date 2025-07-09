import 'package:flutter/material.dart';
import 'package:gallery_app/data/lists_mock.dart';
import 'package:gallery_app/views/widgets/album_card.dart';

class AlbumGridView extends StatefulWidget {
  const AlbumGridView({super.key});

  @override
  State<AlbumGridView> createState() => _AlbumGridViewState();
}

class _AlbumGridViewState extends State<AlbumGridView> {
  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isLandScape ? 4 : 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return AlbumCard(album: albums[index]);
      },
    );
  }
}
