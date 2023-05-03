import '../../packages_shelf.dart';
import '../../product/const/const_shelf.dart';

import 'package:flutter/material.dart';

import '../../product/enums/enums_shelf.dart';
import '../../product/theme/colors.dart';
import '../../product/widget/widget_shelf.dart';

@RoutePage()
class HomeDetailView extends StatelessWidget {
  final dynamic detailList;
  const HomeDetailView({Key? key, required this.detailList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildScaffoldBody(context);
  }

  Widget buildScaffoldBody(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: context.midAllPadding,
            child: buildListViewBody(context),
          )),
    );
  }

  Widget buildListViewBody(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            buildProductField(context),
            buildIconButton(context),
          ],
        ),
      ],
    );
  }

  Widget buildProductField(BuildContext context) {
    return Center(
      child: Container(
        width: context.dynamicWidth(0.9),
        decoration: const BoxDecoration(
            color: AppColors.mainPrimary, borderRadius: BorderRadi.lowCircular),
        padding: context.extremeLowVertical,
        child: Column(
          children: [
            buildImageField(context),
            Padding(
              padding: context.lowAllPadding,
              child: Column(
                children: [
                  buildTitleText,
                  SizedBox(
                    height: context.dynamicHeight(0.02),
                  ),
                  buildDescriptionText(context),
                  SizedBox(
                    height: context.dynamicHeight(0.01),
                  ),
                  buildBottomField(context),
                  buildCategoryField(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImageField(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadi.lowCircular),
      width: context.dynamicWidth(0.85),
      height: context.dynamicHeight(0.45),
      child: buildClipImage(context),
    );
  }

  Widget buildClipImage(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadi.medHighCircular,
        child: Image.network(
          detailList.image,
          height: context.dynamicHeight(0.5),
          width: context.dynamicWidth(0.8),
        ));
  }

  Widget get buildTitleText => ProductText(
        text: detailList.title,
        color: AppColors.button,
      );

  Widget buildDescriptionText(BuildContext context) {
    return ProductText(
      text: detailList.description,
      style: context.textTheme.titleMedium,
      textAlign: TextAlign.justify,
    );
  }

  Widget buildBottomField(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bodyChildren(context));
  }

  List<Widget> bodyChildren(BuildContext context) {
    return <Widget>[
      buildPriceField(context),
      SizedBox(
        height: context.dynamicHeight(0.1),
      ),
      buildRateField(context),
    ];
  }

  Widget buildPriceField(BuildContext context) {
    return Row(
      children: [
        ImagePath.price.toPng(context),
        ProductText(
          text: detailList.price.toString(),
        )
      ],
    );
  }

  Widget buildRateField(BuildContext context) {
    return Row(
      children: [
        ImagePath.rate.toPng(context),
        ProductText(text: detailList.rating["rate"].toString())
      ],
    );
  }

  Widget buildIconButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.chevron_left_sharp,
        size: context.dynamicHeight(0.07),
      ),
    );
  }

  Widget buildCategoryField(BuildContext context) {
    return Container(
        padding: context.lowAllPadding,
        decoration: const BoxDecoration(
            color: AppColors.button, borderRadius: BorderRadi.lowCircular),
        width: context.dynamicWidth(0.9),
        child: ProductText(
          text: AppText.category + detailList.category,
          color: AppColors.lightGrey,
        ));
  }
}
