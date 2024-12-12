import 'package:basic/app/core/models/category_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_categories_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllCategoriesResponse extends CategoryModels{

  factory GetAllCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCategoriesResponseToJson(this);

  GetAllCategoriesResponse();
}
