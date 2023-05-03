import 'package:fake_store_app/core/init/base/view/base_view.dart';
import 'package:flutter/material.dart';

import '../../../core/navigator/app_route.gr.dart';
import '../../../packages_shelf.dart';
import '../../../product/const/const_shelf.dart';
import '../../../product/enums/enums_shelf.dart';
import '../../../product/theme/colors.dart';
import '../../../product/widget/widget_shelf.dart';
import '../home_shelf.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => BaseView<AppController>(
      viewModel: AppController(),
      onInitState: (model) {
        model.setContext(context);
        model.init();
      },
      safeArea: true,
      onPageBuilder: (context, value) {
        final AppController appController = Get.find<AppController>();

        return Scaffold(
          drawer: const Drawer(),
          appBar: buildCustomAppBar(context, appController),
          body: Obx(
            () => appController.isLoading.value
                ? const LoadingView()
                : Padding(
                    padding: context.lowAllPadding,
                    child: buildScrollView(context, appController),
                  ),
          ),
        );
      });

  AppBar buildCustomAppBar(BuildContext context, AppController appController) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(
            Icons.settings,
            // color: AppColors.primarySwatch,
          ),
          onPressed: () {
            appController.changeTheme(context);
            // context.pushRoute(const SettingsRoute());
          },
        ),
      ],
    );
  }

  Widget buildScrollView(BuildContext context, AppController appController) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductText(text: AppText.helloUser),
          SizedBox(height: context.dynamicHeight(0.01)),
          buildSearchTextfield(appController),
          SizedBox(height: context.dynamicHeight(0.01)),
          SizedBox(
            height: context.dynamicHeight(0.75),
            child: buildListViewBody(appController),
          ),
        ],
      ),
    );
  }

  Widget buildSearchTextfield(AppController appController) {
    return SearchTextField(
      onChange: (value) => appController.setSearchQuery(value),
      controller: appController.searchController,
      icon: Icons.search_outlined,
    );
  }

  Widget buildListViewBody(AppController appController) {
    return ListView.builder(
      itemCount: appController.filteredProducts.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.pushRoute(HomeDetailRoute(
                detailList: appController.filteredProducts[index]));
          },
          child: buildMainProductField(context, appController, index),
        );
      },
    );
  }

  Widget buildMainProductField(
      BuildContext context, AppController appController, int index) {
    return Container(
      height: context.dynamicHeight(0.45),
      margin: context.extremeLowVertical,
      padding: context.extremeLowAllPadding,
      decoration: const BoxDecoration(
          color: AppColors.primarySwatch,
          borderRadius: BorderRadi.mediumCircular),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildImageField(context, appController, index),
          SizedBox(height: context.dynamicHeight(0.01)),
          buildTitleText(appController, context, index),
          SizedBox(height: context.dynamicHeight(0.01)),
          buildDescriptionText(appController, index, context),
          SizedBox(height: context.dynamicHeight(0.01)),
          buildBottomField(context, appController, index),
          SizedBox(height: context.dynamicHeight(0.001)),
        ],
      ),
    );
  }

  Widget buildImageField(
      BuildContext context, AppController appController, int index) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadi.lowCircular),
      margin: context.extremeLowAllPadding,
      child: buildNetworkImage(appController, index, context),
    );
  }

  Widget buildNetworkImage(
      AppController appController, int index, BuildContext context) {
    return Image.network(
        appController.filteredProducts[index].image ??
            ImageConst.instance.constImage,
        height: context.dynamicHeight(0.18),
        width: context.dynamicWidth(0.9));
  }

  Widget buildTitleText(
      AppController appController, BuildContext context, int index) {
    return Padding(
      padding: context.extremeLowAllPadding,
      child: ProductText(
        text: appController.filteredProducts[index].title,
        color: AppColors.button,
      ),
    );
  }

  Widget buildDescriptionText(
      AppController appController, int index, BuildContext context) {
    return Padding(
      padding: context.extremeLowAllPadding,
      child: ProductText(
        text: appController.filteredProducts[index].description,
        style: context.textTheme.titleSmall,
        overflow: TextOverflow.ellipsis,
        maxLine: 2,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget buildBottomField(
      BuildContext context, AppController appController, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPriceField(context, appController, index),
        buildRateField(context, appController, index),
      ],
    );
  }

  Widget buildPriceField(
      BuildContext context, AppController appController, int index) {
    return Row(
      children: [
        ImagePath.price.toPng(context),
        ProductText(
          text: appController.filteredProducts[index].price.toString(),
        )
      ],
    );
  }

  Widget buildRateField(
      BuildContext context, AppController appController, int index) {
    return Row(
      children: [
        ImagePath.rate.toPng(context),
        ProductText(
            text:
                appController.filteredProducts[index].rating["rate"].toString())
      ],
    );
  }
}
