import 'package:basic/app/categories/repos/create_category/create_category_request.dart';
import 'package:basic/app/categories/repos/create_category/create_category_response.dart';
import 'package:basic/app/categories/repos/get_all_categories/get_all_categories_request.dart';
import 'package:basic/app/categories/repos/get_all_categories/get_all_categories_response.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../repos/categories_repo.dart';


@singleton
class CategoriesService {
  late CategoriesRepo categoriesRepo;

  CategoriesService() {
    categoriesRepo = GetIt.instance<CategoriesRepo>();
  }

  Future<CreateCategoryResponse> createCategory(CreateCategoryRequest request) {
    return categoriesRepo.createCategory(request);
  }

  Future<GetAllCategoriesResponse> getAllCategories(GetAllCategoriesRequest request) {
    return categoriesRepo.getAllCategories(request);
  }

}
