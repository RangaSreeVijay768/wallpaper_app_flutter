import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_support_us_screen_controller.dart';
import 'wallpapers_support_us_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersSupportUsScreen
    extends BaseStatelessWidget<WallpapersSupportUsScreenController,
        WallpapersSupportUsScreenCubit,
        WallpapersSupportUsScreenState> {
  WallpapersSupportUsScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WallpapersSupportUsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          WallpapersSupportUsScreenCubit,
          WallpapersSupportUsScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  getCubit(context).generateUPILink(
                    '9908351768@ptsbi',
                    'Paytm',
                    150.0,
                    'Support our work',
                  );
                },
                child: Text('Pay via UPI'),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  WallpapersSupportUsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersSupportUsScreenCubit cubit = WallpapersSupportUsScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
