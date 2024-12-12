import 'package:basic/app/categories/repos/create_category/create_category_request.dart';
import 'package:basic/app/categories/repos/create_category/create_category_response.dart';
import 'package:basic/app/categories/repos/get_all_categories/get_all_categories_request.dart';
import 'package:basic/app/categories/repos/get_all_categories/get_all_categories_response.dart';
import 'package:basic/app/core/api_url/api_url.dart';
import 'package:basic/app/core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'categories_repo.g.dart';


@RestApi()
abstract class CategoriesRestClient {
  factory CategoriesRestClient(Dio dio, {String baseUrl}) = _CategoriesRestClient;

  @GET("/category")
  Future<GetAllCategoriesResponse> getAllCategories(@Queries() Map<String, dynamic> queryMap);

  @POST("/category")
  Future<CreateCategoryResponse> createCategory(@Body() CreateCategoryRequest createCategoryRequest);

  
}


@singleton
class CategoriesRepo extends RestService{
  late CategoriesRestClient categoriesRestClient;

  CategoriesRepo() : super(){
    this.categoriesRestClient = CategoriesRestClient(getDioClient(), baseUrl: ApiUrl.url);
  }

  Future<CreateCategoryResponse> createCategory(CreateCategoryRequest request) {
    return categoriesRestClient.createCategory(request);
  }

  Future<GetAllCategoriesResponse> getAllCategories(GetAllCategoriesRequest request) {
    return categoriesRestClient.getAllCategories(request.toJson());
  }


}
