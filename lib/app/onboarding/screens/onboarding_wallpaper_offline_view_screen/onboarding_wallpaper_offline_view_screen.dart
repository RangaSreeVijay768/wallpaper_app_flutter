import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'onboarding_wallpaper_offline_view_screen_controller.dart';
import 'onboarding_wallpaper_offline_view_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class OnboardingWallpaperOfflineViewScreen
    extends BaseStatelessWidget<OnboardingWallpaperOfflineViewScreenController,
        OnboardingWallpaperOfflineViewScreenCubit,
        OnboardingWallpaperOfflineViewScreenState> {
  final String wallpaperId;
  final List<String> images;
  late ValueNotifier<bool> favouriteNotifier;

  OnboardingWallpaperOfflineViewScreen({
    Key? key,
    super.controller,
    super.onStateChanged,
    required this.images,
    required this.wallpaperId,
  }) : super(key: key){

  }

  @override
  Widget build(BuildContext context) {
    final int initialIndex = images.indexWhere((image) => image == wallpaperId);
    final PageController pageController = PageController(
      initialPage: initialIndex >= 0 ? initialIndex : 0,
    );
    final ValueNotifier<bool> buttonsVisible = ValueNotifier<bool>(true);

    return BlocProvider<OnboardingWallpaperOfflineViewScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          OnboardingWallpaperOfflineViewScreenCubit,
          OnboardingWallpaperOfflineViewScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            body: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta! > 10) {
                  Navigator.pop(context);
                }
              },
              onTap: () {
                buttonsVisible.value = !buttonsVisible.value;
              },
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  final currentImage = images[index];
                  return Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Image.asset(
                          currentImage, // Use local image path
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: buttonsVisible,
                        builder: (context, visible, child) {
                          return AnimatedOpacity(
                            opacity: visible ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: edge_insets_t_24,
                                  padding: edge_insets_16,
                                  child: IconButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: edge_insets_12,
                                      backgroundColor: AppColors.white,
                                      elevation: 10,
                                      shadowColor: AppColors.bgPrimary2,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back),
                                  ),
                                ),
                                Container(
                                  margin: edge_insets_b_24,
                                  padding: edge_insets_x_16,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.white,
                                            disabledBackgroundColor:
                                            AppColors.white,
                                            padding: edge_insets_12),
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.share,
                                          size: 30,
                                        ),
                                      ),
                                      IconButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.white,
                                          disabledBackgroundColor:
                                          AppColors.white,
                                          padding: edge_insets_12,
                                        ),
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.download_outlined,
                                          size: 40,
                                        ),
                                      ),
                                      IconButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.white,
                                            disabledBackgroundColor:
                                            AppColors.white,
                                            padding: edge_insets_12),
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.wallpaper,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  OnboardingWallpaperOfflineViewScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingWallpaperOfflineViewScreenCubit cubit =
    OnboardingWallpaperOfflineViewScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
