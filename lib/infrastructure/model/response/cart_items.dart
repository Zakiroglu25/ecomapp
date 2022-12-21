class CartItem {
  String? guid;
  String? stockItemGuid;
  String? productOptionGuid;
  String? title;
  String? storeName;
  String? productSlug;
  num? price;
  num? amount;
  double? discountedPrice;
  bool? prescriptionRequired;
  String? prescriptionImageGuid;
  String? prescriptionImage;
  String? productImage;

  CartItem(
      {this.guid,
      this.stockItemGuid,
      this.productOptionGuid,
      this.title,
      this.storeName,
      this.productSlug,
      this.price,
      this.amount,
      this.productImage,
      this.discountedPrice,
      this.prescriptionRequired,
      this.prescriptionImageGuid,
      this.prescriptionImage});

  CartItem.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    stockItemGuid = json['stockItemGuid'];
    productOptionGuid = json['productOptionGuid'];
    title = json['title'];
    productSlug = json['productSlug'];
    price = json['price'];
    amount = json['amount'];
    storeName = json['storeName'];
    discountedPrice = json['discountedPrice'];
    productImage = json['productImage'];
    prescriptionRequired = json['prescriptionRequired'];
    prescriptionImageGuid = json['prescriptionImageGuid'];
    prescriptionImage = json['prescriptionImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['stockItemGuid'] = this.stockItemGuid;
    data['productOptionGuid'] = this.productOptionGuid;
    data['title'] = this.title;
    data['productSlug'] = this.productSlug;
    data['price'] = this.price;
    data['productImage'] = this.productImage;
    data['amount'] = this.amount;
    data['storeName'] = this.storeName;
    data['discountedPrice'] = this.discountedPrice;
    data['prescriptionRequired'] = this.prescriptionRequired;
    data['prescriptionImageGuid'] = this.prescriptionImageGuid;
    data['prescriptionImage'] = this.prescriptionImage;
    return data;
  }

  @override
  String toString() {
    return 'CartItems{guid: $guid,productImage: $productImage, storeName: $storeName, stockItemGuid: $stockItemGuid, productOptionGuid: $productOptionGuid, productTitle: $title, productSlug: $productSlug, price: $price, amount: $amount, discountedPrice: $discountedPrice, prescriptionRequired: $prescriptionRequired, prescriptionImageGuid: $prescriptionImageGuid, prescriptionImage: $prescriptionImage}';
  }
}
