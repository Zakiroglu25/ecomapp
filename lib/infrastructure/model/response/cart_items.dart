class CartInfo {
  num? totalOrderPrice;
  num? totalDeliveryPrice;
  num? totalPrice;
  List<CartItem>? items;

  CartInfo(
      {this.totalOrderPrice,
      this.totalDeliveryPrice,
      this.totalPrice,
      this.items});

  CartInfo.fromJson(Map<String, dynamic> json) {
    totalOrderPrice = json['totalOrderPrice'] ?? 0;
    totalDeliveryPrice = json['totalDeliveryPrice'] ?? 0;
    totalPrice = json['totalPrice'] ?? 0;
    items = <CartItem>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items!.add(new CartItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalOrderPrice'] = this.totalOrderPrice;
    data['totalDeliveryPrice'] = this.totalDeliveryPrice;
    data['totalPrice'] = this.totalPrice;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItem {
  String? guid;
  String? stockItemGuid;
  String? productOptionGuid;
  String? storeGuid;
  String? storeName;
  String? title;
  num? price;
  int? amount;
  num? discountedPrice;
  bool? prescriptionRequired;
  String? prescriptionImageGuid;
  String? prescriptionImage;
  List<String>? productOptionImages;

  CartItem(
      {this.guid,
      this.stockItemGuid,
      this.productOptionGuid,
      this.storeGuid,
      this.storeName,
      this.title,
      this.price,
      this.amount,
      this.discountedPrice,
      this.prescriptionRequired,
      this.prescriptionImageGuid,
      this.prescriptionImage,
      this.productOptionImages});

  CartItem.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    stockItemGuid = json['stockItemGuid'];
    productOptionGuid = json['productOptionGuid'];
    storeGuid = json['storeGuid'];
    storeName = json['storeName'];
    title = json['title'];
    price = json['price'];
    amount = json['amount'];
    discountedPrice = json['discountedPrice'];
    prescriptionRequired = json['prescriptionRequired'];
    prescriptionImageGuid = json['prescriptionImageGuid'];
    prescriptionImage = json['prescriptionImage'];
    productOptionImages = json['productOptionImages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['stockItemGuid'] = this.stockItemGuid;
    data['productOptionGuid'] = this.productOptionGuid;
    data['storeGuid'] = this.storeGuid;
    data['storeName'] = this.storeName;
    data['title'] = this.title;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['discountedPrice'] = this.discountedPrice;
    data['prescriptionRequired'] = this.prescriptionRequired;
    data['prescriptionImageGuid'] = this.prescriptionImageGuid;
    data['prescriptionImage'] = this.prescriptionImage;
    data['productOptionImages'] = this.productOptionImages;
    return data;
  }

  @override
  String toString() {
    return 'CartItem{guid: $guid, stockItemGuid: $stockItemGuid, productOptionGuid: $productOptionGuid, storeGuid: $storeGuid, storeName: $storeName, title: $title, price: $price, amount: $amount, discountedPrice: $discountedPrice, prescriptionRequired: $prescriptionRequired, prescriptionImageGuid: $prescriptionImageGuid, prescriptionImage: $prescriptionImage, productOptionImages: $productOptionImages}';
  }
}
