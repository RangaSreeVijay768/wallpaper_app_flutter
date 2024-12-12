part of 'get_all_images_by_category_cubit.dart';

@freezed
class GetAllImagesByCategoryState with _$GetAllImagesByCategoryState {
  const factory GetAllImagesByCategoryState.initial({
    required String slug,
    GetAllImagesByCategoryResponse? getAllImagesByCategoryResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllImagesByCategoryStatus,
}) = _Initial;
}
