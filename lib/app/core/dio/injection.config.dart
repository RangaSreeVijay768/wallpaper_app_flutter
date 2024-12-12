// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:basic/app/categories/repos/categories_repo.dart' as _i467;
import 'package:basic/app/categories/services/categories_service.dart' as _i473;
import 'package:basic/app/core/network/dio_client.dart' as _i51;
import 'package:basic/app/images/repos/images_repo.dart' as _i485;
import 'package:basic/app/images/services/images_service.dart' as _i890;
import 'package:basic/app/profile/repos/profile_repo.dart' as _i771;
import 'package:basic/app/profile/services/profile_service.dart' as _i156;
import 'package:basic/app/wallpaper/services/favourite_service.dart' as _i462;
import 'package:basic/app/wallpaper/services/favourites_profile_service.dart'
    as _i560;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i51.DioClient>(() => _i51.DioClient());
    gh.singleton<_i467.CategoriesRepo>(() => _i467.CategoriesRepo());
    gh.singleton<_i473.CategoriesService>(() => _i473.CategoriesService());
    gh.singleton<_i485.ImagesRepo>(() => _i485.ImagesRepo());
    gh.singleton<_i890.ImagesService>(() => _i890.ImagesService());
    gh.singleton<_i771.ProfileRepo>(() => _i771.ProfileRepo());
    gh.singleton<_i156.ProfileService>(() => _i156.ProfileService());
    gh.singleton<_i560.FavoritesProfileService>(
        () => _i560.FavoritesProfileService());
    gh.singleton<_i462.FavoritesService>(() => _i462.FavoritesService());
    return this;
  }
}
