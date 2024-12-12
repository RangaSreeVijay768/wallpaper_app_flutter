import 'package:basic/app/categories/repos/get_all_categories/get_all_categories_response.dart';
import 'package:basic/app/categories/services/categories_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../repos/get_all_categories/get_all_categories_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_all_categories_state.dart';

part 'get_all_categories_cubit.freezed.dart';

class GetAllCategoriesCubit extends BaseCubit<GetAllCategoriesState> {
  late CategoriesService categoriesService;
  GetAllCategoriesCubit({required super.context})
      : super(initialState: GetAllCategoriesState.initial()){
    categoriesService=GetIt.instance<CategoriesService>();
    getAllCategories(createRequestData());
  }


    GetAllCategoriesRequest createRequestData() {
        final request = GetAllCategoriesRequest();
        return request;
      }

    Future<GetAllCategoriesResponse> getAllCategories(
          GetAllCategoriesRequest request) async {
        return categoriesService.getAllCategories(request).then((value) {
          emit(state.copyWith(
              getAllCategoriesResponse: value,
              getAllCategoriesStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getAllCategoriesStatus: BooleanStatus.error));
          throw error;
        });
      }

}
