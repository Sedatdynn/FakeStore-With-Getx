import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/init/base/model/base_error.dart';
import '../../../product/enums/requests/requests.dart';
import '../home_shelf.dart';

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);

  @override
  Future<List<dynamic>?> fetchProductItems() async {
    try {
      final response = await dio.get(RequestPath.products.rawValue);
      if (response.statusCode == HttpStatus.ok) {
        final resData = response.data;
        if (resData is List) {
          final products =
              resData.map((item) => Products().fromJson(item)).toList();
          return products;
        }
      }
    } catch (e) {
      throw BaseError(e.toString());
    }
    return null;
  }
}
