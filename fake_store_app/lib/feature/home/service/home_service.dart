import 'dart:io';

import 'package:dio/dio.dart';

import '../model/home_model.dart';
import 'i_home_service.dart';

class HomeService extends IHomeService {
  HomeService(Dio dio, String item) : super(dio, item);

  @override
  Future<List<dynamic>> fetchProductItems() async {
    print("object");
    try {
      print("first TRYYYY");
      final response = await dio.get("products/");
      print("SECONMDSTRYYYY");
      print("response: $response");
      var resData = response.data;
      print("resdataaaaaaa:  $resData");
      if (response.statusCode == HttpStatus.ok) {
        var products = resData.map((item) => Products.fromJson(item)).toList();
        // List<Products>? products = ProductModel.fromJson(resData).products;
        print("prooooooooooooo $products");
        return products;
      }
    } catch (e) {
      throw e.toString();
    }

    throw "Something went wrong";
  }
}
