import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class FavoritesProfileService {
  static const _favoritesProfileKey = 'favorite_profiles';

  Future<void> addFavoriteProfile(String profileId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteProfiles = prefs.getStringList(_favoritesProfileKey) ?? [];
    if (!favoriteProfiles.contains(profileId)) {
      favoriteProfiles.add(profileId);
      await prefs.setStringList(_favoritesProfileKey, favoriteProfiles);
    }
  }

  Future<void> removeFavoriteProfile(String profileId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteProfiles = prefs.getStringList(_favoritesProfileKey) ?? [];
    favoriteProfiles.remove(profileId);
    await prefs.setStringList(_favoritesProfileKey, favoriteProfiles);
  }

  Future<List<String>> getFavoriteProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesProfileKey) ?? [];
  }

  Future<bool> isFavoriteProfile(String profileId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteProfiles = prefs.getStringList(_favoritesProfileKey) ?? [];
    return favoriteProfiles.contains(profileId);
  }
}
