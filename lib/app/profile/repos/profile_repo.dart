import 'package:basic/app/core/network/dio_client.dart';
import 'package:basic/app/core/api_url/api_url.dart';
import 'package:basic/app/profile/repos/get_all_profile_images/get_all_profile_images_request.dart';
import 'package:basic/app/profile/repos/get_all_profile_images/get_all_profile_images_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';


part 'profile_repo.g.dart';


@RestApi()
abstract class ProfileRestClient {
  factory ProfileRestClient(Dio dio, {String baseUrl}) = _ProfileRestClient;

  @GET("/pimages")
  Future<GetAllProfileImagesResponse> getAllProfileImages(@Queries() Map<String, dynamic> queryMap);

}


@singleton
class ProfileRepo extends RestService {
  late ProfileRestClient profileRestClient;

  ProfileRepo() : super() {
    this.profileRestClient =
        ProfileRestClient(getDioClient(), baseUrl: ApiUrl.url);
  }

  Future<GetAllProfileImagesResponse> getAllProfileImages(GetAllProfileImagesRequest request){
    return profileRestClient.getAllProfileImages(request.toJson());
  }

}
