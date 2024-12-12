// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllImagesResponse _$GetAllImagesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllImagesResponse()
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..images = (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetAllImagesResponseToJson(
        GetAllImagesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'images': instance.images?.map((e) => e.toJson()).toList(),
    };
