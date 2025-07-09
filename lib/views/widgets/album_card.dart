import 'package:flutter/material.dart';
import 'package:gallery_app/domain/models/album_model.dart';
import 'package:intl/intl.dart';

class AlbumCard extends StatelessWidget {
  final AlbumModel album;

  const AlbumCard({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat("d 'de' MMMM 'de' y", "pt_BR");

    return Container(
      width: 45,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 30, 112, 102),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "Summer vacation",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              border: Border(
                bottom: BorderSide(width: 0.5),
                left: BorderSide(width: 0.5),
                right: BorderSide(width: 0.5),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    album.title,
                    style: TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${album.numberOfPhotos} Fotos",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    formatter.format(album.createdAt),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
