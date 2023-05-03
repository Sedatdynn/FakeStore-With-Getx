import 'package:dio/dio.dart';

abstract class IHomeService {
  IHomeService(this.dio);
  final Dio dio;

  Future<List<dynamic>?> fetchProductItems();
}
