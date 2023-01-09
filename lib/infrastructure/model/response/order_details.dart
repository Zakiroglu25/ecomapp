class OrderDetails {
  String? guid;
  int? orderNumber;
  num? price;
  num? totalPrice;
  num? totalDiscountedPrice;
  String? paymentType;
  String? deliveryType;
  String? storeGuid;
  String? storeName;
  String? storePhone;
  String? status;
  String? createdAt;
  List<OrderedItems>? orderedItems;

  OrderDetails(
      {this.guid,
      this.orderNumber,
      this.price,
      this.totalPrice,
      this.totalDiscountedPrice,
      this.paymentType,
      this.deliveryType,
      this.storeGuid,
      this.storeName,
      this.storePhone,
      this.status,
      this.createdAt,
      this.orderedItems});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    orderNumber = json['orderNumber'];
    price = json['price'];
    totalPrice = json['totalPrice'];
    totalDiscountedPrice = json['totalDiscountedPrice'];
    paymentType = json['paymentType'];
    deliveryType = json['deliveryType'];
    storeGuid = json['storeGuid'];
    storeName = json['storeName'];
    storePhone = json['storePhone'];
    status = json['status'];
    createdAt = json['createdAt'];
    if (json['orderedItems'] != null) {
      orderedItems = <OrderedItems>[];
      json['orderedItems'].forEach((v) {
        orderedItems!.add(new OrderedItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['orderNumber'] = this.orderNumber;
    data['price'] = this.price;
    data['totalPrice'] = this.totalPrice;
    data['totalDiscountedPrice'] = this.totalDiscountedPrice;
    data['paymentType'] = this.paymentType;
    data['deliveryType'] = this.deliveryType;
    data['storeGuid'] = this.storeGuid;
    data['storeName'] = this.storeName;
    data['storePhone'] = this.storePhone;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    if (this.orderedItems != null) {
      data['orderedItems'] = this.orderedItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderedItems {
  String? productOptionGuid;
  String? title;
  String? slug;
  num? price;
  int? amount;
  num? discountedPrice;
  bool? isRejected;
  List<String>? images;
  String? rejectReason;
  bool? isCoveredByInsurance;

  OrderedItems(
      {this.productOptionGuid,
      this.title,
      this.slug,
      this.price,
      this.amount,
      this.discountedPrice,
      this.isRejected,
      this.images,
      this.rejectReason,
      this.isCoveredByInsurance});

  OrderedItems.fromJson(Map<String, dynamic> json) {
    productOptionGuid = json['productOptionGuid'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    amount = json['amount'];
    discountedPrice = json['discountedPrice'];
    isRejected = json['isRejected'];
    images = json['images'].cast<String>();
    rejectReason = json['rejectReason'];
    isCoveredByInsurance = json['isCoveredByInsurance'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productOptionGuid'] = this.productOptionGuid;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['discountedPrice'] = this.discountedPrice;
    data['isRejected'] = this.isRejected;
    data['images'] = this.images;
    data['rejectReason'] = this.rejectReason;
    data['isCoveredByInsurance'] = this.isCoveredByInsurance;
    return data;
  }

  @override
  String toString() {
    return 'OrderedItems{productOptionGuid: $productOptionGuid, title: $title, slug: $slug, price: $price, amount: $amount, discountedPrice: $discountedPrice, isRejected: $isRejected, images: $images, rejectReason: $rejectReason, isCoveredByInsurance: $isCoveredByInsurance}';
  }
}
