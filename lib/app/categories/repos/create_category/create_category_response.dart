import 'package:json_annotation/json_annotation.dart';

part 'create_category_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateCategoryResponse {

  factory CreateCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCategoryResponseToJson(this);

  CreateCategoryResponse();
}
