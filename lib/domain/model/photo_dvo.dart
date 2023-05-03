class PhotoDvo {
  final String id;
  final PhotoUrlDvo urls;

  PhotoDvo({
    required this.id,
    required this.urls,
  });
}

class PhotoUrlDvo {
  final String raw;
  final String full;
  final String regular;

  PhotoUrlDvo({
    required this.raw,
    required this.full,
    required this.regular,
  });
}
