import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import '../../themes/input_styles.dart';

class BaseMultiDropdownWidget<T> extends StatelessWidget {
  List<T> items;
  List<T> selectedItems;
  String hintText;
  double? width;
  bool showSearchBox;
  Function(List<T>) onChanged;
  String Function(T) itemAsString;

  BaseMultiDropdownWidget({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.hintText,
    this.width,
    required this.showSearchBox,
    required this.onChanged,
    required this.itemAsString,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>.multiSelection(
      items: (filter, infiniteScrollProps) => items,
      selectedItems: selectedItems,
      autoValidateMode: AutovalidateMode.always,
      popupProps: PopupPropsMultiSelection.menu(
        showSearchBox: showSearchBox,
        menuProps: MenuProps(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.bgLightBlue, width: 2)),
        ),
        constraints: BoxConstraints(maxHeight: 320),
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
            color: AppColors.textHeading,
          ),
          decoration: InputStyles.formTemplateInput(hintText: 'Search'),
        ),
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
      ),
      dropdownBuilder: (context, selectedItems) => Container(
        width: width,
        child: Text(
          selectedItems.isNotEmpty
              ? selectedItems.map((item) => itemAsString(item)).join(', ')
              : '',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.textHeading,
            fontSize: Fonts.fontSize16,
            fontWeight: Fonts.f500,
          ),
        ),
      ),
      onChanged: onChanged,
      itemAsString: itemAsString,
      compareFn: (item1, item2) => item1 == item2,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputStyles.formTemplateInput(hintText: hintText),
      ),
    );
  }
}
