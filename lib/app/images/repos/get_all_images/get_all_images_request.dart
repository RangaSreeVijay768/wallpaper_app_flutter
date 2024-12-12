import 'package:json_annotation/json_annotation.dart';

part 'get_all_images_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllImagesRequest {

  factory GetAllImagesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllImagesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllImagesRequestToJson(this);

  GetAllImagesRequest();
}
