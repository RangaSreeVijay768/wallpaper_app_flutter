part of 'wallpapers_profile_pic_screen_cubit.dart';

@freezed
class WallpapersProfilePicScreenState with _$WallpapersProfilePicScreenState {
  const factory WallpapersProfilePicScreenState.initial({
    List<PImages>? imagesData,
    BooleanStatus? imageStatus,
    GetAllImagesByCategoryState? getAllImagesByCategoryState,
    GetAllProfileImagesState? getAllProfileImagesState
}) = _Initial;
}
