import 'package:flutter/material.dart';
import 'package:gallery_app/domain/models/album_model.dart';

class AlbumView extends StatefulWidget {
  final AlbumModel album;

  const AlbumView({
    super.key,
    required this.album,
  });

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.album.title),
      ),
      body: Center(
        child: Text('This is the Album View'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
