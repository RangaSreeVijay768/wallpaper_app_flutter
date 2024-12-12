import 'package:basic/app/images/repos/get_all_images_by_category/get_all_images_by_category_response.dart';
import 'package:basic/app/images/services/images_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../repos/get_all_images_by_category/get_all_images_by_category_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_all_images_by_category_state.dart';

part 'get_all_images_by_category_cubit.freezed.dart';

class GetAllImagesByCategoryCubit
    extends BaseCubit<GetAllImagesByCategoryState> {
  late ImagesService imagesService;
  GetAllImagesByCategoryCubit({required super.context, required String slug})
      : super(initialState: GetAllImagesByCategoryState.initial(slug: slug)){
    imagesService=GetIt.instance<ImagesService>();
    getAllImagesByCategory(createRequestData());
  }

    GetAllImagesByCategoryRequest createRequestData({
      String? slug
      }) {
        final request = GetAllImagesByCategoryRequest(
          slug: slug ?? state.slug
        );
        return request;
      }

    Future<GetAllImagesByCategoryResponse> getAllImagesByCategory(
          GetAllImagesByCategoryRequest request) async {
        return imagesService.getAllImagesByCategory(request).then((value) {
          emit(state.copyWith(
              getAllImagesByCategoryResponse: value,
              getAllImagesByCategoryStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getAllImagesByCategoryStatus: BooleanStatus.error));
          throw error;
        });
      }
}
