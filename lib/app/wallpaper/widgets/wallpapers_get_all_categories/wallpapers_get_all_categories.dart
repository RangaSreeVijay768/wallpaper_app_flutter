import 'package:basic/app/ads/widgets/ads_native_ad/ads_native_ad.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/models/category_models.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/wallpaper/screens/wallpapers_images_categories_screen/wallpapers_images_categories_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_indicator.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_get_all_categories_controller.dart';
import 'wallpapers_get_all_categories_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersGetAllCategories extends BaseStatelessWidget<
    WallpapersGetAllCategoriesController,
    WallpapersGetAllCategoriesCubit,
    WallpapersGetAllCategoriesState> {
  List<Categories> categories;
  BooleanStatus categoriesStatus;
  VoidCallback? getAllCategoriesCallback;

  WallpapersGetAllCategories(
      {Key? key,
      super.controller,
      super.onStateChanged,
      required this.categories,
      required this.categoriesStatus,
      this.getAllCategoriesCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersGetAllCategoriesCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersGetAllCategoriesCubit,
          WallpapersGetAllCategoriesState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          return Container(
            child: ListView.builder(
                key: PageStorageKey('categoriesGrid'),
                itemCount: categories.length + 1,
                itemBuilder: (context, index) {
                  if(index == categories.length){
                    return Row(
                      children: [
                        Expanded(
                            child: AdsNativeAd(templateType: TemplateType.medium)
                        ),
                        largeScreen?
                        Expanded(
                            child: AdsNativeAd(templateType: TemplateType.medium)
                        ) : SizedBox.shrink()
                      ],
                    );
                  }
                  final category = categories[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WallpapersImagesCategoriesScreen(
                          selectedCategory: category
                      )));
                    },
                    child: Card(
                      color: AppColors.dark2,
                      child: Container(
                        height: 130,
                        alignment: Alignment.center,
                        padding: edge_insets_x_16_y_10,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              "https://drive.google.com/uc?export=view&id=${category.fileId}",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: borderRadius.br_10,
                          // border: borders.b_1px_dark2
                        ),
                        child: Container(
                          padding: edge_insets_x_10_y_4,
                          decoration: BoxDecoration(
                              color: AppColors.bgPrimary08,
                            borderRadius: borderRadius.br_5
                          ),
                          child: Text(
                            category.name!,
                            style: TextStyle(
                                color: AppColors.dark2,
                                fontWeight: Fonts.f500,
                                fontSize: Fonts.fontSize18),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }

  @override
  WallpapersGetAllCategoriesCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersGetAllCategoriesCubit cubit =
        WallpapersGetAllCategoriesCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
