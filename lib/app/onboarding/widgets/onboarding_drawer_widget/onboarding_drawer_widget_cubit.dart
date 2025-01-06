import 'dart:io';

import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/themes/toast.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import 'package:share_plus/share_plus.dart';

part 'onboarding_drawer_widget_state.dart';

part 'onboarding_drawer_widget_cubit.freezed.dart';

class OnboardingDrawerWidgetCubit
    extends BaseCubit<OnboardingDrawerWidgetState> {
  OnboardingDrawerWidgetCubit({required super.context})
      : super(initialState: OnboardingDrawerWidgetState.initial());
  static String appId = "com.ranga.wallpaper2k25";

  rateApp() async {
    final Uri rateUri = Uri.parse("https://play.google.com/store/apps/details?id=$appId");

    if (await canLaunchUrl(rateUri)) {
      await launchUrl(rateUri);
    } else {
      ShowToast.toast('No supported app found to handle this action.', Colors.redAccent);
    }
  }

  sendFeedback() async {
    final Uri emailUri = Uri.parse("mailto:ranga.wallpaperapp@gmail.com?subject=Feedback%20for%20Your%20App");

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ShowToast.toast('No email app found to handle this action.', Colors.redAccent);
    }
  }
  
  shareApp() async{
    await Share.shareUri(Uri.parse("https://play.google.com/store/apps/details?id=$appId"));
  }
}
