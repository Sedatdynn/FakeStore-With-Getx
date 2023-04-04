import 'package:auto_route/auto_route.dart';
import 'package:fake_store_app/core/navigator/app_route.gr.dart';
import 'package:fake_store_app/product/const/responsive/responsive.dart';
import 'package:fake_store_app/product/enums/images/png_enums.dart';
import 'package:fake_store_app/product/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/const/border/border_radi.dart';
import '../../../product/const/image/image.dart';
import '../../../product/widget/text/product_text.dart';
import '../../detail/home_detail.dart';
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
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(
        () => appController.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: context.lowAllPadding,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProductText(text: "Hello Username"),
                      SizedBox(height: context.dynamicHeight(0.01)),
                      TextField(
                        controller: appController.searchController,
                        onChanged: (value) =>
                            appController.setSearchQuery(value),
                        decoration: InputDecoration(
                          hintText: 'Search products...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: context.dynamicHeight(0.01)),
                      SizedBox(
                        height: context.dynamicHeight(0.72),
                        child: ListView.builder(
                          itemCount: appController.filteredProducts.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context.pushRoute(HomeDetailRoute(
                                    detailList:
                                        appController.filteredProducts[index]));
                              },
                              child: Container(
                                height: context.dynamicHeight(0.55),
                                margin: context.extremeLowVertical,
                                decoration: const BoxDecoration(
                                    color: AppColors.primarySwatch,
                                    borderRadius: BorderRadi.mediumCircular),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadi.lowCircular),
                                      margin: context.extremeLowAllPadding,
                                      child: Image.network(
                                          appController.filteredProducts[index]
                                                  .images ??
                                              ImageConst.instance.constImage,
                                          height: context.dynamicHeight(0.3),
                                          width: context.dynamicWidth(0.9)),
                                    ),
                                    SizedBox(
                                        height: context.dynamicHeight(0.01)),
                                    ProductText(
                                        text: appController
                                            .filteredProducts[index].title),
                                    SizedBox(
                                        height: context.dynamicHeight(0.01)),
                                    ProductText(
                                        text: appController
                                            .filteredProducts[index]
                                            .description,
                                        style: context.textTheme.titleMedium),
                                    SizedBox(
                                        height: context.dynamicHeight(0.01)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            ImagePath.price.toPng(context),
                                            ProductText(
                                              text: appController
                                                  .filteredProducts[index].price
                                                  .toString(),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            ImagePath.rate.toPng(context),
                                            ProductText(
                                                text: appController
                                                    .filteredProducts[index]
                                                    .rating["rate"]
                                                    .toString())
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: context.dynamicHeight(0.002)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
