import 'package:json_annotation/json_annotation.dart';

part 'get_all_profile_images_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllProfileImagesRequest {

  factory GetAllProfileImagesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllProfileImagesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProfileImagesRequestToJson(this);

  GetAllProfileImagesRequest();
}
