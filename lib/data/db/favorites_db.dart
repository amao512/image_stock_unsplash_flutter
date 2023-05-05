import 'package:image_stock_unsplash_flutter/data/models/photo_entity.dart';
import 'package:localstorage/localstorage.dart';

class FavoritesPhotoDataSource {
  final favoritesKey = "FAVOURITES";
  final LocalStorage localStorage = LocalStorage("favorites.json");

  void savePhoto(PhotoEntity photo) {
    List<Map<String, dynamic>> items = [...localStorage.getItem(favoritesKey)];
    localStorage.clear();

    items.add(PhotoEntity.toJson(photo));
    localStorage.setItem(favoritesKey, items);
  }

  List<PhotoEntity> getPhotos() {
    List<Map<String, dynamic>> photos = localStorage.getItem(favoritesKey);
    print("FAVORITES = $photos");
    return photos.map((json) => PhotoEntity.fromJson(json)).toList();
  }

  void removePhoto(String photoId) {
    List<Map<String, dynamic>> items = [...localStorage.getItem(favoritesKey)];
    items.removeWhere((element) => PhotoEntity.fromJson(element).id == photoId);
  }
}