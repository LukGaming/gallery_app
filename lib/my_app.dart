import 'package:flutter/material.dart';
import 'package:gallery_app/views/algums/albums_page.dart';
import 'package:gallery_app/views/home_page/top_menu.dart';
import 'package:gallery_app/views/photos/photos_grid_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
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
              icon: Icon(Icons.album),
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
      ),
    );
  }
}
