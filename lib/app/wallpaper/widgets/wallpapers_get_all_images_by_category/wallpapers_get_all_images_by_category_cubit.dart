import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'wallpapers_get_all_images_by_category_state.dart';

part 'wallpapers_get_all_images_by_category_cubit.freezed.dart';

class WallpapersGetAllImagesByCategoryCubit
    extends BaseCubit<WallpapersGetAllImagesByCategoryState> {
  WallpapersGetAllImagesByCategoryCubit({required super.context})
      : super(initialState: WallpapersGetAllImagesByCategoryState.initial());
}
