import 'package:basic/app/core/models/image_models.dart';
import 'package:basic/app/core/models/profile_models.dart';
import 'package:basic/app/images/widgets/get_all_images_by_category/get_all_images_by_category_cubit.dart';
import 'package:basic/app/profile/widgets/get_all_profile_images/get_all_profile_images_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_profile_pic_screen_state.dart';

part 'wallpapers_profile_pic_screen_cubit.freezed.dart';

class WallpapersProfilePicScreenCubit
    extends BaseCubit<WallpapersProfilePicScreenState> {
  WallpapersProfilePicScreenCubit({required super.context})
      : super(initialState: WallpapersProfilePicScreenState.initial());
}
