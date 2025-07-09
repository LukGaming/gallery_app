class AlbumModel {
  final String id;
  final String title;
  final bool favorite;
  final int numberOfPhotos;
  final String? titlePhoto;
  final DateTime createdAt;
  final DateTime updatedAt;

  AlbumModel({
    required this.id,
    required this.title,
    this.favorite = false,
    this.numberOfPhotos = 0,
    this.titlePhoto,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}
