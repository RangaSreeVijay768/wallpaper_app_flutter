import 'package:basic/app/categories/repos/get_all_categories/get_all_categories_response.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:basic/app/themes/loading_indicator.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'get_all_categories_controller.dart';
import 'get_all_categories_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetAllCategories extends BaseStatelessWidget<GetAllCategoriesController,
    GetAllCategoriesCubit, GetAllCategoriesState> {
  GetAllCategories({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllCategoriesCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllCategoriesCubit, GetAllCategoriesState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          if(state.getAllCategoriesStatus == BooleanStatus.error){
            return Text("no network");
          }
          return state.getAllCategoriesResponse != null
              ? Container(
            child: GridView.builder(
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3),
                itemCount: state
                    .getAllCategoriesResponse!.categories!.length,
                itemBuilder: (context, index) {
                  final category = state
                      .getAllCategoriesResponse!.categories![index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: edge_insets_x_16_y_10,
                      decoration: BoxDecoration(
                          borderRadius: borderRadius.br_10,
                          border: borders.b_1px_bgPrimary),
                      child: Text(
                        category.name!,
                        style: TextStyle(
                            fontWeight: Fonts.f500,
                            fontSize: Fonts.fontSize16),
                      ),
                    ),
                  );
                }),
          )
              : Center(
            child: LoadingIndicator.loading(context),
          );
        },
      ),
    );
  }

  @override
  GetAllCategoriesCubit createCubitAndAssignToController(BuildContext context) {
    GetAllCategoriesCubit cubit = GetAllCategoriesCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}

class GetAllCategoriesNoTemplate extends GetAllCategories {
  final Function(GetAllCategoriesResponse) onCategoriesLoaded;
  final Function(BooleanStatus) categoriesStatus;

  GetAllCategoriesNoTemplate(
      {super.key,
      super.controller,
      super.onStateChanged,
      required this.onCategoriesLoaded, required this.categoriesStatus});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllCategoriesCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllCategoriesCubit, GetAllCategoriesState>(
        listener: (context, state) {
          if (state.getAllCategoriesResponse != null) {
            onCategoriesLoaded(state.getAllCategoriesResponse!);
          }
          categoriesStatus(state.getAllCategoriesStatus);
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container();
        },
      ),
    );
  }
}
