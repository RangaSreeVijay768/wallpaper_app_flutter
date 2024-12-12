// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoriesResponse _$GetAllCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesResponse()
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..categories = (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetAllCategoriesResponseToJson(
        GetAllCategoriesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
    };
