class PhotoUserDvo {
  final String id;
  final String name;
  final String username;
  final String firstName;
  final String lastName;
  final PhotoUserImageDvo image;

  PhotoUserDvo({
    required this.id,
    required this.name,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.image,
  });
}

class PhotoUserImageDvo {
  final String small;
  final String medium;
  final String large;

  PhotoUserImageDvo({
    required this.small,
    required this.medium,
    required this.large,
  });
}