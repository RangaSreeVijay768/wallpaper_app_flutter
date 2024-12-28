import 'package:basic/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import 'app/ads/admob_ads_service.dart';
import 'app/core/blocs/app_bloc_observer.dart';
import 'app/core/dio/injection.dart';
import 'app/core/logger/log.dart';
import 'app/routes/routes.dart';
import 'app/wallpaper/screens/wallpapers_auto_set_screen/wallpapers_auto_set_screen_cubit.dart';

void main() async {
  Bloc.observer = const AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  AdmobAdsService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: FToastBuilder(),
      routerConfig: router,
      theme: Themes.lightTheme,
    );
  }


}
