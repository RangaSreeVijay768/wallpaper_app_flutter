import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import '../../themes/input_styles.dart';

class BaseDropdownWidget<T> extends StatelessWidget {
  List<T> items;
  String hintText;
  double width;
  bool showSearchBox;
  Function(T?) onChanged;
  String Function(T) itemAsString;
  T? selectedItem;

  BaseDropdownWidget({
    super.key,
    this.selectedItem,
    required this.items,
    required this.hintText,
    required this.width,
    required this.showSearchBox,
    required this.onChanged,
    required this.itemAsString,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      items: (filter, infiniteScrollProps) => items,
      selectedItem: selectedItem,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputStyles.formTemplateInput(hintText: hintText),
      ),
      dropdownBuilder: (context, selectedItem) => Container(
        width: width,
        child: Text(
          selectedItem != null ? itemAsString(selectedItem) : '',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: AppColors.textHeading,
              fontSize: Fonts.fontSize16,
              fontWeight: Fonts.f500),
        ),
      ),
      popupProps: PopupProps.menu(
        fit: FlexFit.loose,
        menuProps: MenuProps(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.bgLightBlue, width: 2))),
        showSearchBox: showSearchBox,
        itemBuilder: (context, item, isDisabled, isSelected) {
          return Container(
            height: 45,
            alignment: Alignment.centerLeft,
            padding: edge_insets_x_16,
            decoration: BoxDecoration(border: borders.bt_1px_bgLightBlue),
            child: Text(
              itemAsString(item),
              style: TextStyle(
                fontSize: Fonts.fontSize16,
                fontWeight: Fonts.f500,
              ),
            ),
          );
        },
        constraints: BoxConstraints(maxHeight: 320, maxWidth: width),
        scrollbarProps: ScrollbarProps(
          radius: Radius.circular(40),
          thickness: 4,
          thumbVisibility: true,
        ),
        searchDelay: Duration(seconds: 0),
        searchFieldProps: TextFieldProps(
          style: TextStyle(
              fontSize: Fonts.fontSize14,
              fontWeight: Fonts.f400,
              color: AppColors.textHeading),
          decoration: InputStyles.formTemplateInput(hintText: 'search'),
        ),
      ),
      onChanged: onChanged,
      itemAsString: itemAsString,
      compareFn: (a, b) => a == b,
    );
  }
}

