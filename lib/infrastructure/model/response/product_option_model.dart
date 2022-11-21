import 'favorite_model.dart';

class FavResult {
  List<SimpleProduct>? products;
  int? page;
  int? pageSize;
  int? totalItems;
  int? totalPages;

  FavResult(
      {this.products,
      this.page,
      this.pageSize,
      this.totalItems,
      this.totalPages});

  FavResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      products = <SimpleProduct>[];
      json['data'].forEach((v) {
        products!.add(new SimpleProduct.fromJson(v));
      });
    }
    page = json['page'];
    pageSize = json['pageSize'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['data'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    data['totalItems'] = this.totalItems;
    data['totalPages'] = this.totalPages;
    return data;
  }

  @override
  String toString() {
    return 'ProductOptionModel{data: $products, page: $page, pageSize: $pageSize, totalItems: $totalItems, totalPages: $totalPages}';
  }
}

class SimpleProduct {
  String? guid;
  String? title;
  double? minPrice;
  String? imageUrl;
  Product? product;

  SimpleProduct({this.guid, this.title, this.minPrice, this.imageUrl});

  SimpleProduct.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    title = json['title'];
    minPrice = json['minPrice'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['title'] = this.title;
    data['minPrice'] = this.minPrice;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  @override
  String toString() {
    return 'SimpleProduct{guid: $guid, title: $title, minPrice: $minPrice, imageUrl: $imageUrl, product: $product}';
  }
}
