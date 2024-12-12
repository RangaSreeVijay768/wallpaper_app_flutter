import 'package:basic/app/core/models/image_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_images_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllImagesResponse extends ImageModels{

  factory GetAllImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllImagesResponseToJson(this);

  GetAllImagesResponse();
}
