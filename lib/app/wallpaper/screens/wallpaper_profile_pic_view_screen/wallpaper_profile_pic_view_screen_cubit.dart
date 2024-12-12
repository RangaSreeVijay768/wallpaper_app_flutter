import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

part 'wallpaper_profile_pic_view_screen_state.dart';

part 'wallpaper_profile_pic_view_screen_cubit.freezed.dart';

class WallpaperProfilePicViewScreenCubit
    extends BaseCubit<WallpaperProfilePicViewScreenState> {
  WallpaperProfilePicViewScreenCubit({required super.context})
      : super(initialState: WallpaperProfilePicViewScreenState.initial());

  ValueNotifier<bool> isSharingNotifier = ValueNotifier(false);
  ValueNotifier<bool> isDownloadingNotifier = ValueNotifier(false);

  Future<void> shareImage(String imageUrl, BuildContext context) async {
    try {
      isSharingNotifier.value = true;

      // Fetch image data from URL
      final response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      // Save the original image bytes to a temporary file
      final directory = await getApplicationDocumentsDirectory();
      final fileName = 'wallpaper_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File('${directory.path}/$fileName');

      await file.writeAsBytes(Uint8List.fromList(response.data));

      // Share the file
      await Share.shareXFiles([XFile(file.path)], subject: 'Check out this amazing wallpaper!');

      showSuccessMessage("Image shared successfully!");
      await file.delete();
      // showSuccessMessage("Temporary file cleared to save space.");
    } catch (e) {
      showErrorMessage("Failed to share image: $e");
    } finally {
      isSharingNotifier.value = false;
    }
  }



  Future<void> downloadImage(String imageUrl, BuildContext context) async {
    try {
      isDownloadingNotifier.value = true;

      // Fetch image data from URL
      final response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      // Save the image bytes directly to the gallery
      await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        name: 'wallpaper_${DateTime.now().millisecondsSinceEpoch}',
      );

      // Show success message
      showSuccessMessage("Image downloaded successfully");
    } catch (e) {
      // Show error message if any error occurs
      showErrorMessage("Failed to download image: $e");
    } finally {
      // Hide the progress indicator after download finishes
      isDownloadingNotifier.value = false;
    }
  }

}
