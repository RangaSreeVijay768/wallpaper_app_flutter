import 'package:basic/app/ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import 'package:basic/app/ads/widgets/ads_native_ad/ads_native_ad.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/modals/modal_data.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import '/app/core/modals/base_modal_content/base_modal_content_widget.dart';
import '../autoset_rules_modal_data.dart';
import 'autoset_rules_modal_content_controller.dart';
import 'autoset_rules_modal_content_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class AutosetRulesModalContent
    extends BaseModalContent<
        AutosetRulesModalContentController,
        AutosetRulesModalContentCubit,
        AutosetRulesModalContentState,
        AutosetRulesModalData> {

  AutosetRulesModalContent({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AutosetRulesModalContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          AutosetRulesModalContentCubit,
          AutosetRulesModalContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.68,
            decoration: BoxDecoration(
              border: borders.b_1px_grey4,
              borderRadius: borderRadius.br_t_20
            ),
            child: Column(
              children: [
                Container(
                  padding: edge_insets_x_16_y_10,
                  decoration: BoxDecoration(
                      border: borders.bb_1px_grey4
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rules and Regulations", style: TextStyle(
                          color: AppColors.grey3,
                          fontSize: Fonts.fontSize16,
                          fontWeight: Fonts.f500
                      ),),
                      IconButton(
                          onPressed: (){
                            closeModal(context, ModalData(status: BooleanStatus.closed));
                          },
                          icon: Icon(Icons.close, color: AppColors.grey3,)
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: edge_insets_16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1. Activate a Screen\n"
                                  "   Select a screen to enable the auto wallpaper switch.",
                              style: TextStyle(
                                fontSize: Fonts.fontSize14,
                                color: AppColors.grey3,
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text(
                              "2. Service Initialization\n"
                                  "   Once the switch is turned on, the service will start and continue to run until you manually stop it.",
                              style: TextStyle(
                                fontSize: Fonts.fontSize14,
                                color: AppColors.grey3,
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text(
                              "3. Ensure Network Connectivity\n"
                                  "   To keep the service running without interruptions, make sure mobile data is turned on.",
                              style: TextStyle(
                                fontSize: Fonts.fontSize14,
                                color: AppColors.grey3,
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text(
                              "4. Default Timer Setting\n"
                                  "   By default, the timer is set to 30 minutes, changing the wallpaper seamlessly at this interval.",
                              style: TextStyle(
                                fontSize: Fonts.fontSize14,
                                color: AppColors.grey3,
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text(
                              "5. Customizable Timer\n"
                                  "   You can adjust the timer settings as per your preference.",
                              style: TextStyle(
                                fontSize: Fonts.fontSize14,
                                color: AppColors.grey3,
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text(
                              "6. Update Images\n"
                                  "   You need to restart the service to update images. Everytime you restart the service, images will be updated",
                              style: TextStyle(
                                fontSize: Fonts.fontSize14,
                                color: AppColors.grey3,
                              ),
                            ),
                            SizedBox(height: 12,),
                            Row(
                              children: [
                                Expanded(
                                    child: AdsNativeAd(templateType: TemplateType.medium)
                                ),
                                largeScreen
                                    ? Expanded(child: AdsNativeAd(templateType: TemplateType.medium))
                                    : SizedBox()
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                ),
                Container(
                  height: 60,
                  child: AdsBannerAdWidget(),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  AutosetRulesModalContentCubit createCubitAndAssignToController(
      BuildContext context) {
    AutosetRulesModalContentCubit cubit = AutosetRulesModalContentCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
