import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../product/widget/appBar/custom_app_bar.dart';

class BaseView<T extends GetxController> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    required this.onInitState,
    this.onDispose,
    this.appBar,
    required this.safeArea,
  }) : super(key: key);

  final T viewModel;
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final Function(T model) onInitState;
  final VoidCallback? onDispose;
  final CustomAppBar? appBar;
  final bool safeArea;

  @override
  State<BaseView<T>> createState() => BaseViewState<T>();
}

class BaseViewState<T extends GetxController> extends State<BaseView<T>> {
  late T model = Get.find<T>();

  @override
  void initState() {
    model = widget.viewModel;
    widget.onInitState(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.safeArea
        ? SafeArea(child: widget.onPageBuilder(context, model))
        : widget.onPageBuilder(context, model);
    //
  }
}
