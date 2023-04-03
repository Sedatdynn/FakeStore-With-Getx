import 'package:dio/dio.dart';

import '../model/home_model.dart';

abstract class IHomeService {
  IHomeService(this.dio, this.item);
  final Dio dio;
  String item;

  Future<List<dynamic>?> fetchProductItems();
}
