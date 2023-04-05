import 'package:dio/dio.dart';

import '../../../product/enums/enums_shelf.dart';

abstract class IHomeService {
  IHomeService(this.dio);
  final Dio dio;
  final homePath = RequestPath.products.rawValue;

  Future<List<dynamic>?> fetchProductItems();
}
