import 'package:basic/app/core/widgets/app_scaffold_basic.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_account_screen_controller.dart';
import 'wallpapers_account_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersAccountScreen
    extends BaseStatelessWidget<WallpapersAccountScreenController,
        WallpapersAccountScreenCubit,
        WallpapersAccountScreenState> {
  WallpapersAccountScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersAccountScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          WallpapersAccountScreenCubit,
          WallpapersAccountScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return AppScaffoldBasic(
            body: Center(
              child: Text("Account Screen", style: TextStyle(
                color: AppColors.grey3
              ),),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersAccountScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersAccountScreenCubit cubit = WallpapersAccountScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
