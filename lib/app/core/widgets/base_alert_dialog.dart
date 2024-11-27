import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../themes/app_colors.dart';
import '../../themes/borders.dart';
import '../../themes/edge_insets.dart';
import '../../themes/fonts.dart';
import '../database/boolean_status.dart';
import '../modals/popup_data.dart';

class BaseAlertDialog extends StatelessWidget {
  String title;
  dynamic onSubmit;
  VoidCallback onClosed;
  Widget body;
  bool loadingButton;
  String? submitButtonTitle;
  Color? submitButtonTitleColor;
  ButtonStyle? submitButtonStyle;

  BaseAlertDialog(
      {super.key,
      required this.title,
      required this.onSubmit,
      required this.onClosed,
      required this.body,
      required this.loadingButton,
      this.submitButtonTitle,
        this.submitButtonTitleColor,
      this.submitButtonStyle});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isLargeScreen = screenWidth > 600;

    return AlertDialog(
      insetPadding: edge_insets_0,
      backgroundColor: AppColors.white,
      titlePadding: edge_insets_0,
      actionsPadding: edge_insets_0,
      shape: RoundedRectangleBorder(borderRadius: borderRadius.br_10),
      contentPadding: edge_insets_0,
      title: Container(
        padding: edge_insets_10,
        decoration: BoxDecoration(border: borders.bb_1px_grey4),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: Fonts.f700,
              color: AppColors.primary,
            ),
          ),
          IconButton(
              onPressed: onClosed,
              style: IconButton.styleFrom(padding: edge_insets_0),
              icon: const Icon(Icons.clear))
        ]),
      ),
      content: Container(
        width: isLargeScreen ? screenWidth * 0.6 : screenWidth * 0.95,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: screenHeight * 0.7),
          child: SingleChildScrollView(
            child: body,
          ),
        ),
      ),
      actions: [
        Container(
          padding: edge_insets_10,
          decoration: BoxDecoration(border: borders.bt_1px_grey4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape:
                      RoundedRectangleBorder(borderRadius: borderRadius.br_5),
                  padding: edge_insets_x_30,
                  side: const BorderSide(width: 2, color: AppColors.bgPrimary),
                ),
                onPressed: onClosed,
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontWeight: Fonts.f500),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextButton(
                  style: submitButtonStyle ?? TextButton.styleFrom(
                      backgroundColor: AppColors.bgPrimary,
                      disabledBackgroundColor: AppColors.grey1,
                      shape: RoundedRectangleBorder(
                          borderRadius: borderRadius.br_5),
                      padding: edge_insets_x_8),
                  onPressed: onSubmit,
                  child: loadingButton
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: submitButtonStyle != null ? AppColors.bgRed : AppColors.white),
                        )
                      : Text(
                          submitButtonTitle ?? 'Submit',
                          style: TextStyle(
                              fontWeight: Fonts.f500, color: submitButtonTitleColor ?? AppColors.white),
                        ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
