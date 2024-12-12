import 'package:json_annotation/json_annotation.dart';

part 'create_image_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateImageResponse {

  factory CreateImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateImageResponseToJson(this);

  CreateImageResponse();
}
