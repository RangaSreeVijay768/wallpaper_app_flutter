import 'package:basic/app/core/models/image_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_images_by_category_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllImagesByCategoryResponse extends ImageModels{

  factory GetAllImagesByCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllImagesByCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllImagesByCategoryResponseToJson(this);

  GetAllImagesByCategoryResponse();
}
