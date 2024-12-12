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

part 'wallpapers_view_screen_state.dart';

part 'wallpapers_view_screen_cubit.freezed.dart';

class WallpapersViewScreenCubit extends BaseCubit<WallpapersViewScreenState> {
  WallpapersViewScreenCubit({required super.context})
      : super(initialState: WallpapersViewScreenState.initial());
  ValueNotifier<bool> isSharingNotifier = ValueNotifier(false);
  ValueNotifier<bool> isDownloadingNotifier = ValueNotifier(false);

  Future<void> shareImage(String imageUrl, BuildContext context) async {
    try {
      isSharingNotifier.value = true;
      final response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      final originalImage = img.decodeImage(response.data);
      if (originalImage == null) {
        throw Exception("Failed to decode image");
      }

      final screenWidth = MediaQuery.of(context).size.width.toInt();
      final screenHeight = MediaQuery.of(context).size.height.toInt();

      int portraitWidth = screenWidth < screenHeight ? screenWidth : screenHeight;
      int portraitHeight = screenHeight > screenWidth ? screenHeight : screenWidth;


      final resizedImage = img.copyResize(
        originalImage,
        width: portraitWidth,
        height: portraitHeight,
      );

      final resizedImageBytes = Uint8List.fromList(img.encodePng(resizedImage));

      final directory = await getApplicationDocumentsDirectory();
      final fileName = 'wallpaper_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File('${directory.path}/$fileName');

      await file.writeAsBytes(resizedImageBytes);

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

      // Decode image from bytes
      final originalImage = img.decodeImage(response.data);
      if (originalImage == null) {
        throw Exception("Failed to decode image");
      }

      // Get the current screen dimensions (height and width)
      final screenHeight = MediaQuery.of(context).size.height.toInt();
      final screenWidth = MediaQuery.of(context).size.width.toInt();

      // Ensure the image is resized to portrait dimensions
      int portraitWidth = screenWidth < screenHeight ? screenWidth : screenHeight;
      int portraitHeight = screenHeight > screenWidth ? screenHeight : screenWidth;

      // Resize the image to match portrait dimensions (height > width)
      final resizedImage = img.copyResize(
        originalImage,
        width: portraitWidth,
        height: portraitHeight,
      );

      // Convert resized image to bytes
      final resizedImageBytes = Uint8List.fromList(img.encodePng(resizedImage));

      // Save image to gallery with a name based on the current timestamp
      await ImageGallerySaver.saveImage(
        resizedImageBytes,
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
