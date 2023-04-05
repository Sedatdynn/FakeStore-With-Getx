import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../const_shelf.dart';

class SearchTextFieldDecoration extends InputDecoration {
  SearchTextFieldDecoration(BuildContext context, IconData? icon)
      : super(
            contentPadding: context.lowAllPadding,
            enabledBorder: focusedBorderStyle(context),
            focusedBorder: focusedBorderStyle(context),
            border: standardBorder(context),
            hintText: AppText.search,
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.button),
            suffixIcon: Icon(icon, color: AppColors.button));

  static OutlineInputBorder focusedBorderStyle(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: AppColors.mainPrimary,
        width: context.dynamicWidth(0.005),
      ),
    );
  }

  static OutlineInputBorder standardBorder(BuildContext context) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: AppColors.lightGrey,
          width: context.dynamicWidth(0.1),
        ),
      );

  static BorderRadius get borderRadius => BorderRadi.lowMedCircular;
}
