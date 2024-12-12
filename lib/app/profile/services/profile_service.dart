import 'package:basic/app/profile/repos/get_all_profile_images/get_all_profile_images_request.dart';
import 'package:basic/app/profile/repos/get_all_profile_images/get_all_profile_images_response.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../repos/profile_repo.dart';


@singleton
class ProfileService {
  late ProfileRepo profileRepo;

  ProfileService() {
    profileRepo = GetIt.instance<ProfileRepo>();
  }

  Future<GetAllProfileImagesResponse> getAllProfileImages(GetAllProfileImagesRequest request){
    return profileRepo.getAllProfileImages(request);
  }

}
