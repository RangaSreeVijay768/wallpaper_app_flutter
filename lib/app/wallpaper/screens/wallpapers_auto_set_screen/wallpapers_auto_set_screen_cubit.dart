import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:basic/app/images/services/images_service.dart';
import 'package:basic/app/images/widgets/get_all_images/get_all_images_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/logger/log.dart';
import '../../../core/models/image_models.dart';
import '../../../images/repos/get_all_images/get_all_images_request.dart';
import '../../../images/repos/get_all_images/get_all_images_response.dart';
import '../../../themes/toast.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

part 'wallpapers_auto_set_screen_state.dart';

part 'wallpapers_auto_set_screen_cubit.freezed.dart';

class WallpapersAutoSetScreenCubit
    extends BaseCubit<WallpapersAutoSetScreenState> {
  late ImagesService imagesService;

  WallpapersAutoSetScreenCubit({required super.context})
      : super(
            initialState: WallpapersAutoSetScreenState.initial(
                selectedScreens: [], isTimerEnabled: false)) {
    loadSwitchState();
    saveScreenDimensions();
  }

  Future<void> initializeBackgroundService() async {
    final service = FlutterBackgroundService();

    final isRunning = await service.isRunning();
    if (isRunning) {
      logger.d("Stopping existing service before reinitialization");
      try {
        service.invoke("stop");
      } finally {
        logger.d("stopped existing service");
      }
    }

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: onStart,
        onBackground: null,
      ),
    );

    // Start the service
    final started = await service.startService();
    if (started) {
      logger.d("Service started successfully");
    } else {
      logger.e("Failed to start the service");
    }
  }

  Future<void> saveScreenDimensions() async {
    final prefs = await SharedPreferences.getInstance();
    final screenHeight = MediaQuery.of(context).size.height.toInt();
    final screenWidth = MediaQuery.of(context).size.width.toInt();

    await prefs.setInt('screenHeight', screenHeight);
    await prefs.setInt('screenWidth', screenWidth);
  }

  Future<void> loadSwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    final isTimerEnabled = prefs.getBool('isTimerEnabled') ?? false;
    final selectedScreens =
        prefs.getStringList('selectedScreens') ?? <String>[];
    emitState(state.copyWith(
        isTimerEnabled: isTimerEnabled, selectedScreens: selectedScreens));
  }

  Future<void> setSelectedScreen(String screen) async {
    final prefs = await SharedPreferences.getInstance();
    final selectedScreens =
        prefs.getStringList('selectedScreens') ?? <String>[];

    if (selectedScreens.contains(screen)) {
      selectedScreens.remove(screen);
    } else {
      selectedScreens.add(screen);
    }

    await prefs.setStringList('selectedScreens', selectedScreens);
    emitState(state.copyWith(selectedScreens: selectedScreens));
  }
}







Future<List<String>> getAutoSettingImages() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('autoset') ?? [];
}


@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  logger.d('onstart starting');
  service.on("stop").listen((event) {
    service.stopSelf();
    logger.d("background process is now stopped");
  });
  if (service is AndroidServiceInstance) {
    service.setForegroundNotificationInfo(
      title: "Wallpaper Service",
      content: "Running wallpaper updates in the background",
    );
  }

  final prefs = await SharedPreferences.getInstance();
  final interval = prefs.getInt('wallpaper_interval') ?? 30;
  final isTimerEnabled = prefs.getBool('isTimerEnabled') ?? false;
  final imagesData = await getAutoSettingImages();
  final selectedScreens = prefs.getStringList('selectedScreens') ?? <String>[];

  logger.d(interval);
  logger.d(isTimerEnabled);
  logger.d(selectedScreens);
  logger.d(imagesData);

  if (isTimerEnabled != false && imagesData.isNotEmpty && selectedScreens.isNotEmpty) {
    logger.d('timer initialized');
    ShowToast.toast('Auto wallpaper service initialized', Colors.greenAccent);
    final initialImageUrl = 'https://drive.google.com/uc?export=view&id=${imagesData[0]}';
    if (selectedScreens.contains('HOME')) {
      await setWallpaperBackground(initialImageUrl, WallpaperManager.HOME_SCREEN);
    }
    if (selectedScreens.contains('LOCK')) {
      await setWallpaperBackground(initialImageUrl, WallpaperManager.LOCK_SCREEN);
    }
    int currentIndex = 1;
    Timer.periodic(Duration(minutes: interval), (timer) async {
      ShowToast.toast('Auto setting wallpaper', Colors.greenAccent);

      if (currentIndex >= imagesData.length) {
        currentIndex = 0;
      }
      final imageId = imagesData[currentIndex];
      final imageUrl = 'https://drive.google.com/uc?export=view&id=$imageId';
      logger.d(imageUrl);

      if (selectedScreens.contains('HOME')) {
        await setWallpaperBackground(imageUrl, WallpaperManager.HOME_SCREEN);
      }
      if (selectedScreens.contains('LOCK')) {
        await setWallpaperBackground(imageUrl, WallpaperManager.LOCK_SCREEN);
      }
      currentIndex++;
    });
    return;
  } else {
    logger.d('timer cancelled');
    ShowToast.toast('Auto wallpaper service stopped', Colors.redAccent);
  }
}


Future<void> setWallpaperBackground(String imageUrl, int location) async {
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

    final prefs = await SharedPreferences.getInstance();
    final screenHeight = prefs.getInt('screenHeight') ?? 1920;
    final screenWidth = prefs.getInt('screenWidth') ?? 1080;

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
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
    ShowToast.toast("Set wallpaper in background", Colors.greenAccent);
  } catch (e) {
  }
}
