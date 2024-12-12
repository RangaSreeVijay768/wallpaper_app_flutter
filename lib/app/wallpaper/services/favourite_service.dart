import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


@singleton
class FavoritesService {
  static const _favoritesKey = 'favorites';

  Future<void> addFavorite(String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    if (!favorites.contains(imageUrl)) {
      favorites.add(imageUrl);
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }

  Future<void> removeFavorite(String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    favorites.remove(imageUrl);
    await prefs.setStringList(_favoritesKey, favorites);
  }

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  Future<bool> isFavorite(String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    return favorites.contains(imageUrl);
  }
}
