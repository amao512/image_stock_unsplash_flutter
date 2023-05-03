class PhotoEntity {
  final String id;
  final PhotoUrlEntity urls;

  PhotoEntity({
    required this.id,
    required this.urls,
  });

  factory PhotoEntity.fromJson(Map<String, dynamic> json) {
    return PhotoEntity(
      id: json["id"] as String,
      urls: PhotoUrlEntity.fromJson(json["urls"]),
    );
  }
}

class PhotoUrlEntity {
  final String raw;
  final String full;
  final String regular;

  PhotoUrlEntity({
    required this.raw,
    required this.full,
    required this.regular,
  });

  factory PhotoUrlEntity.fromJson(Map<String, dynamic> json) {
    return PhotoUrlEntity(
      raw: json["raw"] as String,
      full: json["full"] as String,
      regular: json["regular"] as String,
    );
  }
}
