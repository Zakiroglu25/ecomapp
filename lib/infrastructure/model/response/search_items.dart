class SearchItems {
  List<SimpleProduct>? products;
  int? page;
  int? pageSize;
  int? totalItems;
  int? totalPages;

  SearchItems(
      {this.products,
      this.page,
      this.pageSize,
      this.totalItems,
      this.totalPages});

  SearchItems.fromJson(Map<String, dynamic> json) {
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
    return 'SearchItems{data: $products, page: $page, pageSize: $pageSize, totalItems: $totalItems, totalPages: $totalPages}';
  }
}

class SimpleProduct {
  String? guid;
  String? storeGuid;
  String? storeName;
  String? productOptionGuid;
  String? title;
  double? price;
  String? imageUrl;
  bool? isFavorite;
  bool? isInCart;

  SimpleProduct(
      {this.guid,
      this.storeGuid,
      this.storeName,
      this.productOptionGuid,
      this.title,
      this.price,
      this.isInCart,
      this.imageUrl,
      this.isFavorite});

  SimpleProduct.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    storeGuid = json['storeGuid'];
    storeName = json['storeName'];
    productOptionGuid = json['productOptionGuid'];
    title = json['title'];
    isInCart = json['isInCart'] ?? false;
    price = json['price'];
    imageUrl = json['imageUrl'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['storeGuid'] = this.storeGuid;
    data['storeName'] = this.storeName;
    data['isInCart'] = this.isInCart;
    data['productOptionGuid'] = this.productOptionGuid;
    data['title'] = this.title;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['isFavorite'] = this.isFavorite;
    return data;
  }

  @override
  String toString() {
    return 'Data{guid: $guid, storeGuid: $storeGuid, isInCart: $isInCart, storeName: $storeName, productOptionGuid: $productOptionGuid, title: $title, price: $price, imageUrl: $imageUrl, isFavorite: $isFavorite}';
  }
}
