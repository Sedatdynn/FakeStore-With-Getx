import 'package:fake_store_app/product/theme/colors.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColors.loadingColor,
    ));
  }
}
