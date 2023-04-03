import 'package:dio/dio.dart';

import '../../../product/enums/requests/requests.dart';

abstract class IHomeService {
  IHomeService(this.dio);
  final Dio dio;
  final homePath = RequestPath.products.rawValue;

  Future<List<dynamic>?> fetchProductItems();
}
