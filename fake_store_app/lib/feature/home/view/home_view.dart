import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/navigator/app_route.gr.dart';
import '../../../product/const/border/border_radi.dart';
import '../../../product/const/image/image.dart';
import '../../../product/const/responsive/responsive.dart';
import '../../../product/const/text/app_text.dart';
import '../../../product/enums/images/png_enums.dart';
import '../../../product/theme/colors.dart';
import '../../../product/widget/loading/loading_view.dart';
import '../../../product/widget/text/product_text.dart';
import '../../../product/widget/textfield/search_textfield.dart';
import '../controller/controller.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    return buildScaffold(appController, context);
  }

  Scaffold buildScaffold(AppController appController, BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: buildCustomAppBar(),
      body: Obx(
        () => appController.isLoading.isTrue
            ? const LoadingView()
            : Padding(
                padding: context.lowAllPadding,
                child: buildScrollView(context, appController),
              ),
      ),
    );
  }

  AppBar buildCustomAppBar() {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {},
        ),
      ],
    );
  }

  SingleChildScrollView buildScrollView(
      BuildContext context, AppController appController) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductText(text: AppText.helloUser),
          SizedBox(height: context.dynamicHeight(0.01)),
          buildSearchTextfield(appController),
          SizedBox(height: context.dynamicHeight(0.01)),
          SizedBox(
            height: context.dynamicHeight(0.72),
            child: buildListViewBody(appController),
          ),
        ],
      ),
    );
  }

  SearchTextField buildSearchTextfield(AppController appController) {
    return SearchTextField(
      onChange: (value) => appController.setSearchQuery(value),
      controller: appController.searchController,
      icon: Icons.search_outlined,
    );
  }

  ListView buildListViewBody(AppController appController) {
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

  Container buildMainProductField(
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
          buildTitleText(appController, index),
          SizedBox(height: context.dynamicHeight(0.01)),
          buildDescriptionText(appController, index, context),
          SizedBox(height: context.dynamicHeight(0.01)),
          buildBottomField(context, appController, index),
          SizedBox(height: context.dynamicHeight(0.001)),
        ],
      ),
    );
  }

  Container buildImageField(
      BuildContext context, AppController appController, int index) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadi.lowCircular),
      margin: context.extremeLowAllPadding,
      child: buildNetworkImage(appController, index, context),
    );
  }

  buildNetworkImage(
      AppController appController, int index, BuildContext context) {
    return Image.network(
        appController.filteredProducts[index].images ??
            ImageConst.instance.constImage,
        height: context.dynamicHeight(0.18),
        width: context.dynamicWidth(0.9));
  }

  buildTitleText(AppController appController, int index) {
    return Padding(
      padding: context.extremeLowAllPadding,
      child: ProductText(
        text: appController.filteredProducts[index].title,
        color: AppColors.button,
      ),
    );
  }

  buildDescriptionText(
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

  Row buildBottomField(
      BuildContext context, AppController appController, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPriceField(context, appController, index),
        buildRateField(context, appController, index),
      ],
    );
  }

  Row buildPriceField(
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

  Row buildRateField(
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
