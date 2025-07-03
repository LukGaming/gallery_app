class AlbumPhotoRelationModel {
  final String idPhoto;
  final String idAlbum;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AlbumPhotoRelationModel({
    required this.idPhoto,
    required this.idAlbum,
    required this.createdAt,
    required this.updatedAt,
  });
}
