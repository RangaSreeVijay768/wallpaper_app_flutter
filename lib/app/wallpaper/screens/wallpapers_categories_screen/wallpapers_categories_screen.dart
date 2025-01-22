import 'package:basic/app/categories/widgets/get_all_categories/get_all_categories.dart';
import 'package:basic/app/categories/widgets/get_all_categories/get_all_categories_controller.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/models/category_models.dart';
import 'package:basic/app/core/widgets/app_scaffold_basic.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/wallpaper/widgets/wallpapers_get_all_categories/wallpapers_get_all_categories.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_indicator.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_categories_screen_controller.dart';
import 'wallpapers_categories_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersCategoriesScreen extends BaseStatelessWidget<
    WallpapersCategoriesScreenController,
    WallpapersCategoriesScreenCubit,
    WallpapersCategoriesScreenState> {
  WallpapersCategoriesScreen({Key? key, PageStorageKey? pageStorageKey, super.controller, super.onStateChanged, required this.categoriesData, required this.categoriesStatus, required this.onRefresh})
      : super(key: key);
  List<Categories> categoriesData;
  BooleanStatus categoriesStatus;
  GetAllCategoriesController getAllCategoriesController =
      GetAllCategoriesController();
  Future<void> Function() onRefresh;
  final ValueNotifier<bool> isRefreshing = ValueNotifier(false);
  ValueNotifier<int> rebuildNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersCategoriesScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<WallpapersCategoriesScreenCubit,
          WallpapersCategoriesScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return AppScaffoldBasic(
            appBarTitle: Text(
              "Categories",
              style: TextStyle(color: AppColors.grey3),
            ),
            appBarActionButton: Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: isRefreshing,
                  builder: (context, loading, _) {
                    return IconButton(
                      onPressed: loading
                          ? null
                          : () async {
                              try {
                                isRefreshing.value = true;
                                await onRefresh.call();
                                getCubit(context).emitState(state.copyWith(
                                    categoriesData: List.from(categoriesData)));
                                categoriesData = List.from(categoriesData);
                              } finally {
                                rebuildNotifier.value++;
                                isRefreshing.value = false;
                              }
                            },
                      icon: loading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: AppColors.grey3,
                              ),
                            )
                          : Icon(Icons.refresh),
                    );
                  },
                ),
                IconButton(
                    onPressed: () {
                      categoriesData.shuffle();
                      categoriesData = List.from(categoriesData);
                      getCubit(context).emitState(state.copyWith(
                          categoriesData: List.from(categoriesData)));
                    },
                    icon: Icon(Icons.shuffle)),
              ],
            ),
            body: Container(
              // padding: edge_insets_x_10,
              child: Column(
                children: [
                  // GetAllCategoriesNoTemplate(
                  //     controller: getAllCategoriesController,
                  //     categoriesStatus: (status) {
                  //       categoriesStatus = status;
                  //       getCubit(context).emitState(
                  //           state.copyWith(getAllCategoriesStatus: status));
                  //     },
                  //     onCategoriesLoaded: (categories) {
                  //       categoriesData = categories.categories!;
                  //       getCubit(context).emitState(state.copyWith(
                  //           categoriesData: categories.categories!));
                  //     }),
                  Expanded(
                      child: categoriesData.isNotEmpty
                          ? WallpapersGetAllCategories(
                              categories:
                                  state.categoriesData ?? categoriesData,
                              categoriesStatus: state.getAllCategoriesStatus ??
                                  categoriesStatus,
                              getAllCategoriesCallback: () async {
                                await getAllCategoriesController
                                    .getChildCubit()
                                    .getAllCategories(getAllCategoriesController
                                        .getChildCubit()
                                        .createRequestData());
                              },
                            )
                          : categoriesStatus == BooleanStatus.error
                              ? Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Can't reach to network",
                                        style: TextStyle(
                                            fontSize: Fonts.fontSize16,
                                            color: AppColors.grey3),
                                      ),
                                      Text(
                                        "Connect to network and reload",
                                        style:
                                            TextStyle(color: AppColors.grey3),
                                      ),
                                      OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  color: AppColors.bgPrimary)),
                                          onPressed: () async {
                                            getAllCategoriesController
                                                .getChildCubit()
                                                .getAllCategories(
                                                    getAllCategoriesController
                                                        .getChildCubit()
                                                        .createRequestData());
                                          },
                                          child: Text("Reload")),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: LoadingIndicator.loading(context),
                                ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersCategoriesScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersCategoriesScreenCubit cubit =
        WallpapersCategoriesScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
