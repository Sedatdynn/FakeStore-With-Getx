import 'package:fake_store_app/product/const/responsive/responsive.dart';
import 'package:fake_store_app/product/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/const/border/border_radi.dart';
import '../../../product/const/image/image.dart';
import '../../detail/home_detail.dart';
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
                      SizedBox(
                        height: context.dynamicHeight(0.85),
                        child: ListView.builder(
                          itemCount: appController.filteredProducts.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeDetailView(
                                          detailList: appController
                                              .filteredProducts[index]),
                                    ));
                              },
                              child: Container(
                                height: context.dynamicHeight(0.5),
                                margin: context.lowAllPadding,
                                decoration: const BoxDecoration(
                                    color: AppColors.button,
                                    borderRadius: BorderRadi.mediumCircular),
                                child: Column(
                                  children: [
                                    Image.network(
                                      appController
                                              .filteredProducts[index].images ??
                                          ImageConst.instance.constImage,
                                      height: context.dynamicHeight(0.3),
                                    ),
                                    Text(
                                      appController
                                          .filteredProducts[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    Text(
                                      appController
                                          .filteredProducts[index].description,
                                      maxLines: 2,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          appController
                                              .filteredProducts[index].price
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        Text(
                                          appController
                                              .filteredProducts[index].rating
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ],
                                    ),
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
