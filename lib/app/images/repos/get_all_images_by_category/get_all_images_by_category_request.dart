import 'package:json_annotation/json_annotation.dart';

part 'get_all_images_by_category_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllImagesByCategoryRequest {
  String? slug;

  factory GetAllImagesByCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllImagesByCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllImagesByCategoryRequestToJson(this);

  GetAllImagesByCategoryRequest({this.slug});
}
