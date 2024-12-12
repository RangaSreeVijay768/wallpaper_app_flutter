import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

part 'set_wallpaper_modal_content_state.dart';

part 'set_wallpaper_modal_content_cubit.freezed.dart';

class SetWallpaperModalContentCubit
    extends BaseCubit<SetWallpaperModalContentState> {
  SetWallpaperModalContentCubit({required super.context})
      : super(initialState: SetWallpaperModalContentState.initial());

  Future<void> setWallpaper(String imageUrl, int location, BuildContext context) async {
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

      final resizedImage = img.copyResize(
        originalImage,
        width: screenWidth,
        height: screenHeight,
      );

      final resizedImageBytes = Uint8List.fromList(img.encodePng(resizedImage));
      final resizedImageFile = File(filePath);
      await resizedImageFile.writeAsBytes(resizedImageBytes);

      bool result = await WallpaperManager.setWallpaperFromFile(filePath, location);

      if (!result) {
        throw Exception("Failed to set wallpaper.");
      }

      // Step 6: Show success message
      showSuccessMessage('Wallpaper set successfully!');

      // Step 7: Delete the temporary directory after setting the wallpaper
      if (await dir.exists()) {
        await dir.delete(recursive: true);
      }
    } catch (e) {
      showErrorMessage('Error: $e');
    }
  }

}
