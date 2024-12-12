import 'package:basic/app/images/repos/get_all_images/get_all_images_request.dart';
import 'package:basic/app/images/repos/get_all_images/get_all_images_response.dart';
import 'package:basic/app/images/repos/get_all_images_by_category/get_all_images_by_category_request.dart';
import 'package:basic/app/images/repos/get_all_images_by_category/get_all_images_by_category_response.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../repos/images_repo.dart';


@singleton
class ImagesService {
  late ImagesRepo imagesRepo;

  ImagesService() {
    imagesRepo = GetIt.instance<ImagesRepo>();
  }

  Future<GetAllImagesResponse> getAllImages(GetAllImagesRequest request){
    return imagesRepo.getAllImages(request);
  }

  Future<GetAllImagesByCategoryResponse> getAllImagesByCategory(GetAllImagesByCategoryRequest request){
    return imagesRepo.getAllImagesByCategory(request);
  }

}
