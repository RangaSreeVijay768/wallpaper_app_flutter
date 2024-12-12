import 'package:basic/app/core/api_url/api_url.dart';
import 'package:basic/app/core/network/dio_client.dart';
import 'package:basic/app/images/repos/create_image/create_image_request.dart';
import 'package:basic/app/images/repos/create_image/create_image_response.dart';
import 'package:basic/app/images/repos/get_all_images/get_all_images_request.dart';
import 'package:basic/app/images/repos/get_all_images/get_all_images_response.dart';
import 'package:basic/app/images/repos/get_all_images_by_category/get_all_images_by_category_request.dart';
import 'package:basic/app/images/repos/get_all_images_by_category/get_all_images_by_category_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';


part 'images_repo.g.dart';


@RestApi()
abstract class ImagesRestClient {
  factory ImagesRestClient(Dio dio, {String baseUrl}) = _ImagesRestClient;

  @GET("/images")
  Future<GetAllImagesResponse> getAllImages(@Queries() Map<String, dynamic> queryMap);

  @GET("/images/{slug}")
  Future<GetAllImagesByCategoryResponse> getAllImagesByCategory(@Path('slug') String slug);

}


@singleton
class ImagesRepo extends RestService {
  late ImagesRestClient imagesRestClient;

  ImagesRepo() : super() {
    this.imagesRestClient =
        ImagesRestClient(getDioClient(), baseUrl: ApiUrl.url);
  }

  Future<GetAllImagesResponse> getAllImages(GetAllImagesRequest request){
    return imagesRestClient.getAllImages(request.toJson());
  }

  Future<GetAllImagesByCategoryResponse> getAllImagesByCategory(GetAllImagesByCategoryRequest request){
    return imagesRestClient.getAllImagesByCategory(request.slug.toString());
  }

}
