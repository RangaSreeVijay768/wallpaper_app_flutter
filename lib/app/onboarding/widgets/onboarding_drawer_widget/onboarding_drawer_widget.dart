import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/buttons.dart';
import '../../../themes/fonts.dart';
import '../../../themes/shadows.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'onboarding_drawer_widget_controller.dart';
import 'onboarding_drawer_widget_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class OnboardingDrawerWidget
    extends BaseStatelessWidget<OnboardingDrawerWidgetController,
        OnboardingDrawerWidgetCubit,
        OnboardingDrawerWidgetState> {
  OnboardingDrawerWidget({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingDrawerWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          OnboardingDrawerWidgetCubit,
          OnboardingDrawerWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          final landScape = MediaQuery.of(context).orientation == Orientation.landscape;
          return Drawer(
            shape: const RoundedRectangleBorder(),
            backgroundColor: AppColors.dark,
            // surfaceTintColor: AppColors.white,
            width: largeScreen
                ? 300
                : MediaQuery.sizeOf(context).width / 1.3,
            child: SingleChildScrollView(
              child: Container(
                height: landScape? null : MediaQuery.sizeOf(context).height,
                margin: edge_insets_x_16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: edge_insets_t_16,
                          margin: edge_insets_y_16,
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: AppColors.grey2),
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.textHeading,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration:
                          const BoxDecoration(boxShadow: [shadows.bs_grey]),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                    style: Buttons.sideMenuButton,
                                    onPressed: () {
                                      context.go('/');
                                    },
                                    child: const Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Icon(
                                          Icons.home_sharp,
                                          color: AppColors.textHeading,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          "Home",
                                          style: TextStyle(
                                              color: AppColors.textHeading,
                                              fontSize: Fonts.fontSize16,
                                              fontWeight: Fonts.f400),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration:
                          const BoxDecoration(boxShadow: [shadows.bs_grey]),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                    style: Buttons.sideMenuButton,
                                    onPressed: () {
                                      context.push('/settings');
                                    },
                                    child: const Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Icon(
                                          Icons.settings,
                                          color: AppColors.textHeading,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          "Settings",
                                          style: TextStyle(
                                              color: AppColors.textHeading,
                                              fontSize: Fonts.fontSize16,
                                              fontWeight: Fonts.f400),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),

                        // SizedBox(
                        //   height: 16,
                        // ),
                        // Container(
                        //   decoration:
                        //   const BoxDecoration(boxShadow: [shadows.bs_grey]),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //           child: TextButton(
                        //             style: Buttons.sideMenuButton,
                        //             onPressed: () {
                        //               context.push('/categories');
                        //             },
                        //             child: const Row(
                        //               children: [
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Icon(
                        //                   Icons.category_outlined,
                        //                   color: AppColors.textHeading,
                        //                 ),
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Text(
                        //                   "Categories",
                        //                   style: TextStyle(
                        //                       color: AppColors.textHeading,
                        //                       fontSize: Fonts.fontSize16,
                        //                       fontWeight: Fonts.f400),
                        //                 )
                        //               ],
                        //             ),
                        //           ))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 16,
                        // ),
                        // Container(
                        //   decoration:
                        //   const BoxDecoration(boxShadow: [shadows.bs_grey]),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //           child: TextButton(
                        //             style: Buttons.sideMenuButton,
                        //             onPressed: () {
                        //               context.push('/wallpapers');
                        //             },
                        //             child: const Row(
                        //               children: [
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Icon(
                        //                   Icons.wallpaper_outlined,
                        //                   color: AppColors.textHeading,
                        //                 ),
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Text(
                        //                   "Wallpapers",
                        //                   style: TextStyle(
                        //                       color: AppColors.textHeading,
                        //                       fontSize: Fonts.fontSize16,
                        //                       fontWeight: Fonts.f400),
                        //                 )
                        //               ],
                        //             ),
                        //           ))
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    Container(
                      padding: edge_insets_b_24,
                      alignment: Alignment.center,
                      child: Text("version: 1.0.0", style: TextStyle(
                        fontSize: Fonts.fontSize16,
                        fontWeight: Fonts.f500,
                        color: AppColors.grey3
                      ),),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  OnboardingDrawerWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingDrawerWidgetCubit cubit = OnboardingDrawerWidgetCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
