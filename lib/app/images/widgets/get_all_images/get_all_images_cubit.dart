
import 'package:basic/app/images/repos/get_all_images/get_all_images_response.dart';
import 'package:basic/app/images/services/images_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/logger/log.dart';
import '../../../wallpaper/services/favourite_service.dart';
import '../../repos/get_all_images/get_all_images_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_all_images_state.dart';

part 'get_all_images_cubit.freezed.dart';

class GetAllImagesCubit extends BaseCubit<GetAllImagesState> {
  late FavoritesService favoritesService;
  late ImagesService imagesService;
  late ValueNotifier<bool> favouriteNotifier;

  GetAllImagesCubit({required super.context})
      : super(initialState: GetAllImagesState.initial(loadingButton: false)) {
    favoritesService=GetIt.instance<FavoritesService>();
    imagesService = GetIt.instance<ImagesService>();
    getAllImages(createRequestData());
  }

  void setLoadingButtonStatus(bool? val){
    emit(state.copyWith(loadingButton: val));
  }

  GetAllImagesRequest createRequestData() {
    final request = GetAllImagesRequest();
    return request;
  }

  Future<GetAllImagesResponse> getAllImages(GetAllImagesRequest request) async {
    return imagesService.getAllImages(request).then((value) {
      emit(state.copyWith(
          getAllImagesResponse: value,
          getAllImagesStatus: BooleanStatus.success));
      return Future.value(value);
    }).catchError((error) {
      emit(state.copyWith(getAllImagesStatus: BooleanStatus.error));
      showErrorMessage("Please connect to network");
      throw error;
    });
  }



  Future<void> getAllFavorites() async {
    logger.d("getting");
    return favoritesService.getFavorites().then((value){});
  }

  Future<void> addFavorite(String imageUrl) async {
    return favoritesService.addFavorite(imageUrl).then((value){
      showSuccessMessage("added to favorites");
      return Future.value();
    });
  }

  Future<bool> isFavourite(String imageUrl) async {
    return favoritesService.isFavorite(imageUrl);
  }


  Future<void> removeFavorite(String imageUrl) async {
    return favoritesService.removeFavorite(imageUrl).then((value){
      showSuccessMessage("removed from favorites");
      return Future.value();
    });
  }


}
