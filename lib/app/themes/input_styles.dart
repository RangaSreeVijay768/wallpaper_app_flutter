import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'edge_insets.dart';

abstract class InputStyles {
  static InputDecoration formTemplateInput({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: AppColors.grey1,
        overflow: TextOverflow.ellipsis
      ),
      filled: true,
      fillColor: AppColors.white09,
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), // Reduced vertical padding
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.rainbow2, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.bgPrimary, width: 1),
      ),
      isDense: true,
    );
  }
}
