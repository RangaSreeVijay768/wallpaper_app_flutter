import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../themes/toast.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_about_us_screen_state.dart';

part 'wallpapers_about_us_screen_cubit.freezed.dart';

class WallpapersAboutUsScreenCubit
    extends BaseCubit<WallpapersAboutUsScreenState> {
  WallpapersAboutUsScreenCubit({required super.context})
      : super(initialState: WallpapersAboutUsScreenState.initial());

  viewLinkedin() async {
    final Uri emailUri = Uri.parse("https://www.linkedin.com/in/ranga-sree-vijay-393b9a24b/");

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ShowToast.toast('No supported app found to handle this action.', Colors.redAccent);
    }
  }


  sendFeedback() async {
    final Uri emailUri = Uri.parse("mailto:ranga.sreevijay768@gmail.com?subject=Developer%20Contact");

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ShowToast.toast('No email app found to handle this action.', Colors.redAccent);
    }
  }


}
