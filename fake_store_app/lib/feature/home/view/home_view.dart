import 'package:fake_store_app/product/const/responsive/responsive.dart';
import 'package:fake_store_app/product/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/const/border/border_radi.dart';
import '../controller/controller.dart';

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
      body: Obx(
        () => appController.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: context.midAllPadding,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        // controller: searchController,
                        onChanged: (query) {
                          // appController.filterProducts(query);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search products...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(
                        height: context.dynamicHeight(0.85),
                        child: ListView.builder(
                          itemCount: appController.productModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: context.dynamicHeight(0.5),
                              margin: context.lowAllPadding,
                              decoration: const BoxDecoration(
                                  color: AppColors.button,
                                  borderRadius: BorderRadi.mediumCircular),
                              child: Column(
                                children: [
                                  Image.network(
                                    appController.productModel[index].images ??
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTREP28kiUI2Dha8oALRNBzTliKfvj6SUvtafsxlxZ4&s",
                                    height: context.dynamicHeight(0.3),
                                  ),
                                  Text(
                                    appController.productModel[index].title,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    appController
                                        .productModel[index].description,
                                    maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        appController.productModel[index].price
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Text(
                                        appController.productModel[index].rating
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                ],
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
