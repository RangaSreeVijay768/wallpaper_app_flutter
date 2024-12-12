part of 'get_all_images_cubit.dart';

@freezed
class GetAllImagesState with _$GetAllImagesState {
  const factory GetAllImagesState.initial({
    GetAllImagesResponse? getAllImagesResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllImagesStatus,
    bool? loadingButton,
    @Default({}) Map<String, bool> favorites,
}) = _Initial;
}
