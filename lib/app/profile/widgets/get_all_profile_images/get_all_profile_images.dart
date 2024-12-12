import 'package:basic/app/profile/repos/get_all_profile_images/get_all_profile_images_response.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/database/boolean_status.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'get_all_profile_images_controller.dart';
import 'get_all_profile_images_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetAllProfileImages
    extends BaseStatelessWidget<GetAllProfileImagesController,
        GetAllProfileImagesCubit,
        GetAllProfileImagesState> {
  GetAllProfileImages({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllProfileImagesCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllProfileImagesCubit, GetAllProfileImagesState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container();
        },
      ),
    );
  }

  @override
  GetAllProfileImagesCubit createCubitAndAssignToController(
      BuildContext context) {
    GetAllProfileImagesCubit cubit = GetAllProfileImagesCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}


class GetAllProfileImagesNoTemplate extends GetAllProfileImages{
  final Function(GetAllProfileImagesResponse) onImagesLoaded;
  final Function(BooleanStatus) imagesStatus;
  GetAllProfileImagesNoTemplate({super.key, super.controller, super.onStateChanged, required this.onImagesLoaded, required this.imagesStatus});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllProfileImagesCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllProfileImagesCubit, GetAllProfileImagesState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
          if (state.getAllProfileImagesResponse != null) {
            onImagesLoaded(state.getAllProfileImagesResponse!);
          }
          imagesStatus(state.getAllProfileImagesStatus);
        },
        builder: (context, state) {
          initializeController(context);
          return Container();
        },
      ),
    );
  }

}
