class ProductModel {
  List<Products>? products;

  ProductModel({this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Products {
  dynamic id;
  String? title;
  String? description;
  dynamic price;
  dynamic rating;
  String? category;
  String? images;

  Products({
    this.id,
    this.title,
    this.description,
    this.price,
    this.rating,
    this.category,
    this.images,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    rating = json['rating'];
    category = json['category'];
    images = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['rating'] = rating;
    data['category'] = category;
    data['images'] = images;
    return data;
  }
}
