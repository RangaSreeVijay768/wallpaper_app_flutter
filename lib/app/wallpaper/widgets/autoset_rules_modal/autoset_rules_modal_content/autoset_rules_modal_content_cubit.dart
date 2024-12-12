import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'autoset_rules_modal_content_state.dart';

part 'autoset_rules_modal_content_cubit.freezed.dart';

class AutosetRulesModalContentCubit
    extends BaseCubit<AutosetRulesModalContentState> {
  AutosetRulesModalContentCubit({required super.context})
      : super(initialState: AutosetRulesModalContentState.initial());
}
