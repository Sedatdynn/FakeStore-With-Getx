import 'package:fake_store_app/packages_shelf.dart';
import 'package:flutter/material.dart';

abstract class LoadingStateful<T extends StatefulWidget>
    extends GetxController {
  RxBool isLoading = false.obs;
  void get changeLoading => isLoading.toggle();
}
