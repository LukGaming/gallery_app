class AlbumPhotoRelationModel {
  final String idPhoto;
  final String idAlbum;
  final DateTime createdAt;
  final DateTime updatedAt;

  AlbumPhotoRelationModel({
    required this.idPhoto,
    required this.idAlbum,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}
