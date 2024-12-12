part of 'get_all_categories_cubit.dart';

@freezed
class GetAllCategoriesState with _$GetAllCategoriesState {
  const factory GetAllCategoriesState.initial({
    GetAllCategoriesResponse? getAllCategoriesResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllCategoriesStatus,
}) = _Initial;
}
