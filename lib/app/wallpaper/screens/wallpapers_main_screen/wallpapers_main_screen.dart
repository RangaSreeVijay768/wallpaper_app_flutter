import 'package:basic/app/ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/core/widgets/base_alert_dialog.dart';
import 'package:basic/app/onboarding/widgets/onboarding_drawer_widget/onboarding_drawer_widget.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_auto_set_screen/wallpapers_auto_set_screen.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_categories_screen/wallpapers_categories_screen.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_favourite_screen/wallpapers_favourite_screen.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_home_screen/wallpapers_home_screen.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_profile_pic_screen/wallpapers_profile_pic_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'wallpapers_main_screen_controller.dart';
import 'wallpapers_main_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersMainScreen extends BaseStatelessWidget<
    WallpapersMainScreenController,
    WallpapersMainScreenCubit,
    WallpapersMainScreenState> {
  late final Map<String, Widget> tabWidgets;
  WallpapersMainScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> showExitPopup(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return BaseAlertDialog(
            title: "Exit App",
            submitButtonTitle: "Exit",
            onSubmit: (){
              Navigator.of(context).pop(true); // Confirm exit
              Future.delayed(Duration.zero, () {
                SystemNavigator.pop(); // Close the app
              });
            },
            onClosed: (){
              Navigator.of(context).pop(false);
            },
            body: Container(
              padding: edge_insets_16,
              height: 100,
              child: Text("Are you sure you want to exit the app?", style: TextStyle(
                fontWeight: Fonts.f500,
                fontSize: Fonts.fontSize16
              ),),
            ),
            loadingButton: false,
          adShow: false,
        );
      },
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersMainScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersMainScreenCubit, WallpapersMainScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: PopScope(
              canPop: false,
              onPopInvokedWithResult: (didpop, result){
                logger.d(didpop);
                if(didpop){
                  return;
                }
                showExitPopup(context);
              },
              child: DefaultTabController(
                length: 5,
                initialIndex: 2,
                child: Scaffold(
                  key: scaffoldKey,
                  drawer: OnboardingDrawerWidget(),
                  body: Stack(
                    children: [
                      TabBarView(
                        children: [
                          WallpapersFavouriteScreen(),
                          WallpapersCategoriesScreen(),
                          WallpapersHomeScreen(),
                          WallpapersProfilePicScreen(),
                          WallpapersAutoSetScreen(),
                        ],
                      ),
                      Container(
                        margin: edge_insets_t_26,
                        child: IconButton(
                          padding: edge_insets_16,
                          onPressed: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: AppColors.grey3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: Container(
                    color: AppColors.dark2,
                    height: 110,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: false,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorWeight: 0,
                          indicatorColor: AppColors.bgLightBlue,
                          indicator: BoxDecoration(
                            color: AppColors.bgPrimary01,
                            border: borders.bt_6px_bgPrimary,
                            borderRadius: borderRadius.br_t_5,
                          ),
                          labelPadding: edge_insets_0,
                          indicatorPadding: edge_insets_0,
                          labelColor: AppColors.bgPrimary,
                          unselectedLabelColor: AppColors.grey3,
                          padding: edge_insets_0,
                          tabs: <Widget>[
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 5),
                                  Container(
                                    padding: edge_insets_5,
                                    child: Icon(
                                      Icons.favorite_outline,
                                    ),
                                  ),
                                  Text(
                                    "Favourites",
                                    style: TextStyle(fontSize: Fonts.fontSize12),
                                  ),
                                  Container()
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 5),
                                  Container(
                                    padding: edge_insets_5,
                                    child: Icon(
                                      Icons.dashboard_outlined,
                                    ),
                                  ),
                                  Text(
                                    "Categories",
                                    style: TextStyle(fontSize: Fonts.fontSize12),
                                  ),
                                  Container()
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 5),
                                  Container(
                                    padding: edge_insets_5,
                                    child: Icon(
                                      Icons.wallpaper_outlined,
                                    ),
                                  ),
                                  Text(
                                    "Wallpapers",
                                    style: TextStyle(fontSize: Fonts.fontSize12),
                                  ),
                                  Container()
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 5),
                                  Container(
                                    padding: edge_insets_5,
                                    child: FaIcon(FontAwesomeIcons.whatsapp),
                                  ),
                                  Text(
                                    "Profile pic",
                                    style: TextStyle(fontSize: Fonts.fontSize12),
                                  ),
                                  Container()
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 5),
                                  Container(
                                    padding: edge_insets_5,
                                    child: Icon(
                                      Icons.timer_outlined,
                                    ),
                                  ),
                                  Text(
                                    "AutoSet",
                                    style: TextStyle(fontSize: Fonts.fontSize12),
                                  ),
                                  Container()
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          child: AdsBannerAdWidget(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersMainScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersMainScreenCubit cubit =
    WallpapersMainScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
