import 'package:json_annotation/json_annotation.dart';

part 'create_image_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateImageRequest {

  factory CreateImageRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateImageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateImageRequestToJson(this);

  CreateImageRequest();
}
