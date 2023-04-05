import 'package:auto_route/auto_route.dart';
import 'package:fake_store_app/product/const/responsive/responsive.dart';
import 'package:fake_store_app/product/const/text/app_text.dart';
import 'package:fake_store_app/product/widget/text/product_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../product/const/border/border_radi.dart';
import '../../product/enums/images/png_enums.dart';
import '../../product/theme/colors.dart';

@RoutePage()
class HomeDetailView extends StatefulWidget {
  final dynamic detailList;
  const HomeDetailView({Key? key, required this.detailList}) : super(key: key);
  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  @override
  Widget build(BuildContext context) {
    return buildScaffoldBody(context);
  }

  Scaffold buildScaffoldBody(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: context.midAllPadding,
          child: buildListViewBody(context),
        ));
  }

  ListView buildListViewBody(BuildContext context) {
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

  Center buildProductField(BuildContext context) {
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
                  buildTitleText(),
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

  Container buildImageField(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadi.lowCircular),
      width: context.dynamicWidth(0.85),
      height: context.dynamicHeight(0.45),
      child: buildClipImage(context),
    );
  }

  ClipRRect buildClipImage(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadi.medHighCircular,
        child: Image.network(
          widget.detailList.images,
          height: context.dynamicHeight(0.5),
          width: context.dynamicWidth(0.8),
        ));
  }

  ProductText buildTitleText() {
    return ProductText(
      text: widget.detailList.title,
      color: AppColors.button,
    );
  }

  ProductText buildDescriptionText(BuildContext context) {
    return ProductText(
      text: widget.detailList.description,
      style: context.textTheme.titleMedium,
      textAlign: TextAlign.justify,
    );
  }

  Row buildBottomField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPriceField(context),
        SizedBox(
          height: context.dynamicHeight(0.1),
        ),
        buildRateField(context),
      ],
    );
  }

  Row buildPriceField(BuildContext context) {
    return Row(
      children: [
        ImagePath.price.toPng(context),
        ProductText(
          text: widget.detailList.price.toString(),
        )
      ],
    );
  }

  Row buildRateField(BuildContext context) {
    return Row(
      children: [
        ImagePath.rate.toPng(context),
        ProductText(text: widget.detailList.rating["rate"].toString())
      ],
    );
  }

  IconButton buildIconButton(BuildContext context) {
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

  Container buildCategoryField(BuildContext context) {
    return Container(
        padding: context.lowAllPadding,
        decoration: const BoxDecoration(
            color: AppColors.button, borderRadius: BorderRadi.lowCircular),
        width: context.dynamicWidth(0.9),
        child: ProductText(
          text: AppText.category + widget.detailList.category,
          color: AppColors.lightGrey,
        ));
  }
}
