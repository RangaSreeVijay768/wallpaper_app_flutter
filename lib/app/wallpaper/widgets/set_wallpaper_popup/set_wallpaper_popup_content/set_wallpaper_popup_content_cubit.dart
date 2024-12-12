import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../themes/toast.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

part 'set_wallpaper_popup_content_state.dart';

part 'set_wallpaper_popup_content_cubit.freezed.dart';

class SetWallpaperPopupContentCubit
    extends BaseCubit<SetWallpaperPopupContentState> {
  SetWallpaperPopupContentCubit({required super.context}) : super(
      initialState: SetWallpaperPopupContentState.initial(
          loadingButton: false));


  setLoadingButtonStatus(bool? val) {
    emit(state.copyWith(loadingButton: val));
  }

  setScreenType(String? value){
    emit(state.copyWith(screenType: value));
  }

  Future<void> setWallpaper(String imageUrl, BuildContext context, int location) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final dir = Directory(tempDir.path);

      if (!await dir.exists()) {
        await dir.create();
      }

      final filePath = '${tempDir.path}/resized_wallpaper.png';

      final response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      final originalImage = img.decodeImage(response.data);
      if (originalImage == null) {
        throw Exception("Failed to decode image");
      }

      final screenHeight = MediaQuery.of(context).size.height.toInt();
      final screenWidth = MediaQuery.of(context).size.width.toInt();

      int portraitWidth = screenWidth < screenHeight ? screenWidth : screenHeight;
      int portraitHeight = screenHeight > screenWidth ? screenHeight : screenWidth;

      final resizedImage = img.copyResize(
        originalImage,
        width: portraitWidth,
        height: portraitHeight,
      );

      final resizedImageBytes = Uint8List.fromList(img.encodePng(resizedImage));
      final resizedImageFile = File(filePath);
      await resizedImageFile.writeAsBytes(resizedImageBytes);

      bool result = await WallpaperManager.setWallpaperFromFile(filePath, location);

      if (!result) {
        throw Exception("Failed to set wallpaper.");
      }

      showSuccessMessage('Wallpaper set successfully!');

      if (await dir.exists()) {
        await dir.delete(recursive: true);
      }
    } catch (e) {
      showErrorMessage('Error: $e');
    }
  }


  Future<void> setWallpaperBackground(String imageUrl, int location) async {
    final tempDir = await getTemporaryDirectory();

    final filePath = '${tempDir.path}/temp_wallpaper_background.png';

    final response = await Dio().get(
      imageUrl,
      options: Options(responseType: ResponseType.bytes),
    );

    final file = File(filePath);
    await file.writeAsBytes(response.data);

    await WallpaperManager.setWallpaperFromFile(filePath, location);
    ShowToast.toast("set wallpaper in background", Colors.greenAccent);
  }


}
