import 'dart:io';

import 'package:dio/dio.dart';

import '../home_shelf.dart';

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);

  @override
  Future<List<dynamic>> fetchProductItems() async {
    try {
      final response = await dio.get(homePath);
      var resData = response.data;
      if (response.statusCode == HttpStatus.ok) {
        var products = resData.map((item) => Products.fromJson(item)).toList();
        return products;
      }
    } catch (e) {
      throw e.toString();
    }

    throw "Something went wrong";
  }
}
