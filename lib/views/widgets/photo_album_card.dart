import 'package:flutter/material.dart';

class PhotoAlbumCard extends StatelessWidget {
  const PhotoAlbumCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Birthday Party",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "36 Photos",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text("January 2025", style: TextStyle(fontSize: 12)),
                    ],
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
