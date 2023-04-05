import '../../const/const_shelf.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

enum ImagePath {
  price,
  rate;

  String get rawValue => "asset/png/$name.png";
  Widget toPng(BuildContext context) {
    return Image.asset(
      rawValue,
      color: AppColors.button,
      height: context.dynamicHeight(0.03),
      width: context.dynamicWidth(0.1),
    );
  }
}
