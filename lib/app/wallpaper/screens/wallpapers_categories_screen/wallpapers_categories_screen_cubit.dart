import 'package:basic/app/categories/repos/get_all_categories/get_all_categories_response.dart';
import 'package:basic/app/core/models/category_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_categories_screen_state.dart';

part 'wallpapers_categories_screen_cubit.freezed.dart';

class WallpapersCategoriesScreenCubit
    extends BaseCubit<WallpapersCategoriesScreenState> {
  WallpapersCategoriesScreenCubit({required super.context})
      : super(initialState: WallpapersCategoriesScreenState.initial());
}
