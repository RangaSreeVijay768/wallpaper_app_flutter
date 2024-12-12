// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModels _$CategoryModelsFromJson(Map<String, dynamic> json) =>
    CategoryModels(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelsToJson(CategoryModels instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'categories': instance.categories,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      fileId: json['fileId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'fileId': instance.fileId,
      'id': instance.id,
    };
