import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_models.g.dart';

@JsonSerializable()
class CategoryModels {
  bool? success;
  String? message;
  List<Categories>? categories;

  CategoryModels({this.success, this.message, this.categories});

  factory CategoryModels.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelsToJson(this);
}

@JsonSerializable()
class Categories {
  String? name;
  String? slug;
  String? fileId;
  String? id;

  Categories({this.name, this.slug, this.fileId, this.id});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
