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
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}
