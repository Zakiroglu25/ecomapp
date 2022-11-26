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
        products!.add(SimpleProduct.fromJson(v));
      });
    }
    page = json['page'];
    pageSize = json['pageSize'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (products != null) {
      data['data'] = products!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['totalItems'] = totalItems;
    data['totalPages'] = totalPages;
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
  bool? isFavorite;


  SimpleProduct({this.guid, this.title, this.minPrice, this.imageUrl,this.isFavorite});

  SimpleProduct.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    title = json['title'];
    minPrice = json['minPrice'];
    imageUrl = json['imageUrl'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['guid'] = guid;
    data['title'] = title;
    data['minPrice'] = minPrice;
    data['imageUrl'] = imageUrl;
    data['isFavorite'] = isFavorite;
    return data;
  }

  @override
  String toString() {
    return 'SimpleProduct{guid: $guid, title: $title, minPrice: $minPrice, imageUrl: $imageUrl, product: $product}';
  }
}
