class AlbumModel {
  final String id;
  final String title;
  final bool favorite;
  final DateTime createdAt;
  final DateTime updatedAt;

  AlbumModel({
    required this.id,
    required this.title,
    required this.favorite,
    required this.createdAt,
    required this.updatedAt,
  });
}
