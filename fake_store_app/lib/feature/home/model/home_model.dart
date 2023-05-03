import 'package:json_annotation/json_annotation.dart';

import '../../../core/init/base/model/base_model.dart';

part 'home_model.g.dart';

@JsonSerializable()
class ProductModel extends BaseModel {
  List<dynamic>? products;

  ProductModel({this.products});

  @override
  Map<String, dynamic> toJson() {
    return _$ProductModelToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  @override
  createObject() {
    return ProductModel();
  }
}

@JsonSerializable()
class Products extends BaseModel {
  dynamic id;
  String? title;
  String? description;
  dynamic price;
  dynamic rating;
  String? category;
  String? image;

  Products({
    this.id,
    this.title,
    this.description,
    this.price,
    this.rating,
    this.category,
    this.image,
  });

  @override
  Map<String, dynamic> toJson() {
    return _$ProductsToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  @override
  createObject() {
    return ProductModel();
  }
}
