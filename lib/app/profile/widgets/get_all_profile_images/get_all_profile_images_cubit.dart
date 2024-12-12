import 'package:basic/app/profile/repos/get_all_profile_images/get_all_profile_images_response.dart';
import 'package:basic/app/profile/services/profile_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../repos/get_all_profile_images/get_all_profile_images_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_all_profile_images_state.dart';

part 'get_all_profile_images_cubit.freezed.dart';

class GetAllProfileImagesCubit extends BaseCubit<GetAllProfileImagesState> {
  late ProfileService profileService;
  GetAllProfileImagesCubit({required super.context})
      : super(initialState: GetAllProfileImagesState.initial()){
    profileService=GetIt.instance<ProfileService>();
    getAllProfileImages(createRequestData());
  }


    GetAllProfileImagesRequest createRequestData() {
        final request = GetAllProfileImagesRequest();
        return request;
      }

    Future<GetAllProfileImagesResponse> getAllProfileImages(
          GetAllProfileImagesRequest request) async {
        return profileService.getAllProfileImages(request).then((value) {
          emit(state.copyWith(
              getAllProfileImagesResponse: value,
              getAllProfileImagesStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getAllProfileImagesStatus: BooleanStatus.error));
          throw error;
        });
      }
}
