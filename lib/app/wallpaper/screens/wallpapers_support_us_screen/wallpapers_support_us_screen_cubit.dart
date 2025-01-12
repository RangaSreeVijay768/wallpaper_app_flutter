import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

part 'wallpapers_support_us_screen_state.dart';

part 'wallpapers_support_us_screen_cubit.freezed.dart';

class WallpapersSupportUsScreenCubit
    extends BaseCubit<WallpapersSupportUsScreenState> {
  WallpapersSupportUsScreenCubit({required super.context})
      : super(initialState: WallpapersSupportUsScreenState.initial());


  void generateUPILink(String upiId, String name, double amount, String note) async {
    final upiUrl = Uri.parse(
      'upi://pay?pa=$upiId&pn=$name&am=${amount.toStringAsFixed(2)}&cu=INR&tn=${Uri.encodeComponent(note)}',
    );

    if (await canLaunchUrl(upiUrl)) {
      await launchUrl(upiUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch UPI link';
    }
  }

}
