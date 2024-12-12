import 'package:basic/app/core/models/image_models.dart';
import 'package:basic/app/images/widgets/get_all_images/get_all_images_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../categories/repos/get_all_categories/get_all_categories_response.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_home_screen_state.dart';

part 'wallpapers_home_screen_cubit.freezed.dart';

class WallpapersHomeScreenCubit extends BaseCubit<WallpapersHomeScreenState> {
  WallpapersHomeScreenCubit({required super.context})
      : super(initialState: WallpapersHomeScreenState.initial());
}
