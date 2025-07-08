import 'package:flutter/material.dart';
import 'package:gallery_app/views/albums/albums_page.dart';
import 'package:gallery_app/views/home_page/top_menu.dart';
import 'package:gallery_app/views/photos/photos_grid_view.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
