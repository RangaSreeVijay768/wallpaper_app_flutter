// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_profile_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProfileImagesResponse _$GetAllProfileImagesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllProfileImagesResponse()
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..images = (json['images'] as List<dynamic>?)
          ?.map((e) => PImages.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetAllProfileImagesResponseToJson(
        GetAllProfileImagesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'images': instance.images?.map((e) => e.toJson()).toList(),
    };
