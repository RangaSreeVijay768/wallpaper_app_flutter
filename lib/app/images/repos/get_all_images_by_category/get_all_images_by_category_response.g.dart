// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_images_by_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllImagesByCategoryResponse _$GetAllImagesByCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllImagesByCategoryResponse()
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..images = (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetAllImagesByCategoryResponseToJson(
        GetAllImagesByCategoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'images': instance.images?.map((e) => e.toJson()).toList(),
    };
