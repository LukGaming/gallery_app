import 'package:flutter/material.dart';
import 'package:gallery_app/data/lists_mock.dart';
import 'package:gallery_app/views/widgets/photo_card.dart';

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
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return PhotoCard(
            photo: photos[index],
          );
        },
      ),
    );
  }
}
