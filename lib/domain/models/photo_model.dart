class PhotoModel {
  final String id;
  final String? title;
  final String path;
  final DateTime createdAt;
  final DateTime updatedAt;

  PhotoModel({
    required this.id,
    this.title,
    required this.path,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}
