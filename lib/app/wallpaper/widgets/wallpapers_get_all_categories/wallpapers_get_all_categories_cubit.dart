import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_get_all_categories_state.dart';

part 'wallpapers_get_all_categories_cubit.freezed.dart';

class WallpapersGetAllCategoriesCubit
    extends BaseCubit<WallpapersGetAllCategoriesState> {
  WallpapersGetAllCategoriesCubit({required super.context})
      : super(initialState: WallpapersGetAllCategoriesState.initial());
}
