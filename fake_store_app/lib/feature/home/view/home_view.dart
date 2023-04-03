import 'package:fake_store_app/feature/home/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(),
      body: Obx(
        () => appController.isLoading.isTrue
            ? CircularProgressIndicator()
            : SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: appController.productModel.length,
                  itemBuilder: (context, index) {
                    return Text(
                        appController.productModel[index].title.toString());
                  },
                ),
              ),
      ),
    );
  }
}
