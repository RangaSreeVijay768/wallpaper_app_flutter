import 'package:json_annotation/json_annotation.dart';

part 'get_all_categories_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllCategoriesRequest {

  factory GetAllCategoriesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCategoriesRequestToJson(this);

  GetAllCategoriesRequest();
}
