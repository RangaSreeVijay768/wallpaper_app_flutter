// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModels _$ImageModelsFromJson(Map<String, dynamic> json) => ImageModels(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageModelsToJson(ImageModels instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'images': instance.images,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      fileId: json['fileId'] as String?,
      category: json['category'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'fileId': instance.fileId,
      'category': instance.category,
      'id': instance.id,
    };
