import 'package:flutter/material.dart';
import 'package:gallery_app/views/home_page/photo_album_widget.dart';

class PhotosGridView extends StatelessWidget {
  const PhotosGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isLandScape ? 4 : 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return AlbumCard();
        },
      ),
    );
  }
}
