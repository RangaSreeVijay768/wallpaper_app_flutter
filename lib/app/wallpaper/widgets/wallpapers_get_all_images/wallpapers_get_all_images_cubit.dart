import 'dart:math';

import 'package:basic/app/core/logger/log.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/models/image_models.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_get_all_images_state.dart';

part 'wallpapers_get_all_images_cubit.freezed.dart';


class WallpapersGetAllImagesCubit extends BaseCubit<WallpapersGetAllImagesState> {
  WallpapersGetAllImagesCubit({required super.context, required List<Images> imagesData})
      : super(initialState: WallpapersGetAllImagesState.initial()) {
    saveRandomFileIds(imagesData);
  }


  Future<void> saveRandomFileIds(List<Images> imagesData) async {
    final prefs = await SharedPreferences.getInstance();
    final random = Random();

    final fileIds = imagesData
        .map((image) => image.fileId)
        .whereType<String>()
        .toList()
      ..shuffle(random);

    final selectedFileIds = fileIds.take(150).toList();
    await prefs.remove('autoset');

    await prefs.setStringList('autoset', selectedFileIds).then((_) {
      logger.d('New file IDs saved: $selectedFileIds');
    });
  }
}
