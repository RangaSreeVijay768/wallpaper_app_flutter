import 'package:basic/app/wallpaper/screens/wallpapers_main_screen/wallpapers_main_screen.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_settings_screen/wallpapers_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../core/logger/log.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return WallpapersMainScreen();
      }),

  GoRoute(
      path: '/settings',
      builder: (context, state) {
        return WallpapersSettingsScreen();
      }),
  // GoRoute(
  //     path: '/wallpaper/:id',
  //     builder: (context, state) {
  //       String wallpaperId = state.pathParameters['id']!;
  //       final images = state.extra as List<Images>;
  //       return OnboardingWallpaperViewScreen(
  //         wallpaperId: wallpaperId,
  //         images: images,
  //       );
  //     }),
]);
