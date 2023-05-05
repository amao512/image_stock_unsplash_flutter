import 'package:image_stock_unsplash_flutter/core/utils/extensions/string_ext.dart';
import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesPhotoDatabase {
  static final FavoritesPhotoDatabase instance = FavoritesPhotoDatabase._init();

  Database? _database;
  final favoritesKey = "favorites";
  final imageId = "imageId";
  final imageUrl = "imageUrl";

  FavoritesPhotoDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb("favorites.db");
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $favoritesKey (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        $imageId TEXT,
        $imageUrl TEXT
      )
    ''');
  }

  Future<int> addToFavorite(PhotoEntity photo) async {
    final db = await instance.database;

    return await db.insert(
      favoritesKey,
      {imageId: photo.id.orEmpty(), imageUrl: photo.urls?.regular.orEmpty()},
    );
  }

  Future<List<PhotoEntity>> getFavorites() async {
    final db = await instance.database;
    final favorites = await db.query(favoritesKey);

    return favorites.map((json) {
      return fromJson(json);
    }).toList();
  }

  Future<PhotoEntity?> getFavoriteById(String id) async {
    final db = await instance.database;
    final favorites = await db
        .query(favoritesKey, where: '$imageId = ?', whereArgs: [id]);

    if (favorites.isNotEmpty) {
      return fromJson(favorites[0]);
    }

    return null;
  }

  Future<int> deleteFromFavorites(String photoId) async {
    final db = await instance.database;

    return await db
        .delete(favoritesKey, where: '$imageId = ?', whereArgs: [photoId]);
  }

  PhotoEntity fromJson(Map<String, dynamic> json) => PhotoEntity(
        id: json[imageId] as String?,
        urls: PhotoUrlEntity(
          regular: (json[imageUrl] as String?).orEmpty(),
          raw: '',
          full: '',
        ),
        user: null,
        tags: null,
        collections: null,
      );
}
