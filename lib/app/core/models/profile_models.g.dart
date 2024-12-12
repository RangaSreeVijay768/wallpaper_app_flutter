// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModels _$ProfileModelsFromJson(Map<String, dynamic> json) =>
    ProfileModels(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => PImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileModelsToJson(ProfileModels instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'images': instance.images,
    };

PImages _$PImagesFromJson(Map<String, dynamic> json) => PImages(
      fileId: json['fileId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PImagesToJson(PImages instance) => <String, dynamic>{
      'fileId': instance.fileId,
      'id': instance.id,
    };
