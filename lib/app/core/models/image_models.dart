import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_models.g.dart';

@JsonSerializable()
class ImageModels {
  bool? success;
  String? message;
  List<Images>? images;

  ImageModels({this.success, this.message, this.images});

    factory ImageModels.fromJson(Map<String, dynamic> json) =>
          _$ImageModelsFromJson(json);

      Map<String, dynamic> toJson() => _$ImageModelsToJson(this);

}

@JsonSerializable()
class Images {
  String? fileId;
  String? category;
  String? id;

  Images({this.fileId, this.category, this.id});

  factory Images.fromJson(Map<String, dynamic> json) =>
        _$ImagesFromJson(json);

    Map<String, dynamic> toJson() => _$ImagesToJson(this);
  }
