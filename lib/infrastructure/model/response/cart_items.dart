class CartItem {
  String? guid;
  String? stockItemGuid;
  String? productOptionGuid;
  String? title;
  String? storeName;
  String? productSlug;
  num? price;
  int? amount;
  double? discountedPrice;
  bool? prescriptionRequired;
  String? prescriptionImageGuid;
  String? prescriptionImage;
  List<String>? productOptionImages;

  CartItem(
      {this.guid,
      this.stockItemGuid,
      this.productOptionGuid,
      this.title,
      this.storeName,
      this.productSlug,
      this.price,
      this.amount,
      this.productOptionImages,
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
    amount = json['amount'] ?? 0;
    storeName = json['storeName'];
    discountedPrice = json['discountedPrice'];
    productOptionImages = json['productOptionImages'].cast<String>();
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
    data['amount'] = this.amount;
    data['storeName'] = this.storeName;
    data['discountedPrice'] = this.discountedPrice;
    data['productOptionImages'] = this.productOptionImages;
    data['prescriptionRequired'] = this.prescriptionRequired;
    data['prescriptionImageGuid'] = this.prescriptionImageGuid;
    data['prescriptionImage'] = this.prescriptionImage;
    return data;
  }

  @override
  String toString() {
    return 'CartItems{guid: $guid,productOptionImages: $productOptionImages, storeName: $storeName, stockItemGuid: $stockItemGuid, productOptionGuid: $productOptionGuid, productTitle: $title, productSlug: $productSlug, price: $price, amount: $amount, discountedPrice: $discountedPrice, prescriptionRequired: $prescriptionRequired, prescriptionImageGuid: $prescriptionImageGuid, prescriptionImage: $prescriptionImage}';
  }
}
