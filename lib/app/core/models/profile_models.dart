import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_models.g.dart';

@JsonSerializable()
class ProfileModels {
  bool? success;
  String? message;
  List<PImages>? images;

  ProfileModels({this.success, this.message, this.images});

    factory ProfileModels.fromJson(Map<String, dynamic> json) =>
          _$ProfileModelsFromJson(json);

      Map<String, dynamic> toJson() => _$ProfileModelsToJson(this);

}

@JsonSerializable()
class PImages {
  String? fileId;
  String? id;

  PImages({this.fileId, this.id});

    factory PImages.fromJson(Map<String, dynamic> json) =>
          _$PImagesFromJson(json);

      Map<String, dynamic> toJson() => _$PImagesToJson(this);

}
