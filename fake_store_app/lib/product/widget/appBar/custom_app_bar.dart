import 'package:fake_store_app/product/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final double? size;

  const CustomAppBar({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size ?? 100);
}
