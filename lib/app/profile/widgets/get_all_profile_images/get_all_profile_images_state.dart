part of 'get_all_profile_images_cubit.dart';

@freezed
class GetAllProfileImagesState with _$GetAllProfileImagesState {
  const factory GetAllProfileImagesState.initial({
    GetAllProfileImagesResponse? getAllProfileImagesResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllProfileImagesStatus,
}) = _Initial;
}
