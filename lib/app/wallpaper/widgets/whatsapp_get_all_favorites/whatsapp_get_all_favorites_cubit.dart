import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../services/favourite_service.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'whatsapp_get_all_favorites_state.dart';

part 'whatsapp_get_all_favorites_cubit.freezed.dart';

class WhatsappGetAllFavoritesCubit
    extends BaseCubit<WhatsappGetAllFavoritesState> {
  late FavoritesService favoritesService;
  WhatsappGetAllFavoritesCubit({required super.context})
      : super(initialState: WhatsappGetAllFavoritesState.initial()){
    favoritesService=GetIt.instance<FavoritesService>();
  }

  Future<void> deleteFavourite(String imageUrl) async {
    return favoritesService.removeFavorite(imageUrl);
  }

}
