import 'package:flutter/material.dart';
import 'package:gallery_app/views/home_page/photo_album_widget.dart';
import 'package:gallery_app/views/home_page/top_menu.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TopMenu(),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 2,
                  ),

                  itemBuilder: (context, index) {
                    return PhotoAlbumCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
