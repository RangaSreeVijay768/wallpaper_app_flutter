import 'package:basic/app/core/models/profile_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_profile_images_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllProfileImagesResponse extends ProfileModels{

  factory GetAllProfileImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProfileImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProfileImagesResponseToJson(this);

  GetAllProfileImagesResponse();
}
