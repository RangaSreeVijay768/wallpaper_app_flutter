import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:basic/app/images/repos/get_all_images/get_all_images_response.dart';
import 'package:basic/app/images/services/images_service.dart';
import 'package:basic/app/themes/toast.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/logger/log.dart';
import '../../../core/models/image_models.dart';
import '../../../images/repos/get_all_images/get_all_images_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

part 'wallpapers_main_screen_state.dart';
part 'wallpapers_main_screen_cubit.freezed.dart';

class WallpapersMainScreenCubit extends BaseCubit<WallpapersMainScreenState> {

  WallpapersMainScreenCubit({required super.context})
      : super(
    initialState: WallpapersMainScreenState.initial(selectedWidgetName: "HOME",),
  );

  selectWidget(String value) {
    emit(state.copyWith(selectedWidgetName: value));
  }


  void selectNextWidget() {
    final currentIndex = _getWidgetIndex(state.selectedWidgetName);
    final nextIndex = (currentIndex + 1) % _widgetNames.length;
    selectWidget(_widgetNames[nextIndex]);
  }

  void selectPreviousWidget() {
    final currentIndex = _getWidgetIndex(state.selectedWidgetName);
    final previousIndex = (currentIndex - 1 + _widgetNames.length) % _widgetNames.length;
    selectWidget(_widgetNames[previousIndex]);
  }

  int _getWidgetIndex(String widgetName) {
    return _widgetNames.indexOf(widgetName);
  }

  final List<String> _widgetNames = [
    'HOME', 'CATEGORIES', 'FAVOURITES', 'AUTOSET', 'WHATSAPP'
  ];
}




