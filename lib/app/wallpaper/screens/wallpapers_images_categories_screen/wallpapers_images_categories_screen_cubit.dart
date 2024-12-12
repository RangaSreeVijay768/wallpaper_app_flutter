import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_images_categories_screen_state.dart';

part 'wallpapers_images_categories_screen_cubit.freezed.dart';

class WallpapersImagesCategoriesScreenCubit
    extends BaseCubit<WallpapersImagesCategoriesScreenState> {
  WallpapersImagesCategoriesScreenCubit({required super.context})
      : super(initialState: WallpapersImagesCategoriesScreenState.initial());
}
