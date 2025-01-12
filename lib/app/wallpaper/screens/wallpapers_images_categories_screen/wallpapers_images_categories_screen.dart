import 'package:basic/app/ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import 'package:basic/app/core/models/category_models.dart';
import 'package:basic/app/images/widgets/get_all_images_by_category/get_all_images_by_category.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_images_categories_screen_controller.dart';
import 'wallpapers_images_categories_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersImagesCategoriesScreen
    extends BaseStatelessWidget<WallpapersImagesCategoriesScreenController,
        WallpapersImagesCategoriesScreenCubit,
        WallpapersImagesCategoriesScreenState> {
  Categories selectedCategory;

  WallpapersImagesCategoriesScreen(
      {Key? key, super.controller, super.onStateChanged, required this.selectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersImagesCategoriesScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          WallpapersImagesCategoriesScreenCubit,
          WallpapersImagesCategoriesScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            backgroundColor: AppColors.dark,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: AppBar(
                  backgroundColor: AppColors.dark,
                  centerTitle: true,
                  title: Text(selectedCategory.name.toString(), style: TextStyle(
                      color: AppColors.grey3
                  ),),
                  leading: IconButton(
                    style: ElevatedButton.styleFrom(
                      padding: edge_insets_5,
                      elevation: 5,
                      shadowColor: AppColors.bgPrimary2,
                      backgroundColor: AppColors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, size: 25,),
                  ),
                )
            ),
            body: Container(
              padding: edge_insets_x_8,
              child: Column(
                children: [
                  Expanded(
                      child: GetAllImagesByCategory(
                          slug: selectedCategory.slug!
                      )
                  )
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 60,
              child: AdsBannerAdWidget(),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersImagesCategoriesScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersImagesCategoriesScreenCubit cubit = WallpapersImagesCategoriesScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
