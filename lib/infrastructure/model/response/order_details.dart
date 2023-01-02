class OrderDetails {
  String? guid;
  num? price;
  num? totalPrice;
  num? totalDiscountedPrice;
  String? paymentType;
  String? deliveryType;
  String? status;
  String? createdAt;
  List<OrderedItems>? orderedItems;

  OrderDetails(
      {this.guid,
      this.price,
      this.totalPrice,
      this.totalDiscountedPrice,
      this.paymentType,
      this.deliveryType,
      this.status,
      this.createdAt,
      this.orderedItems});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    price = json['price'];
    totalPrice = json['totalPrice'];
    totalDiscountedPrice = json['totalDiscountedPrice'];
    paymentType = json['paymentType'];
    deliveryType = json['deliveryType'];
    status = json['status'];
    createdAt = json['createdAt'];
    orderedItems = <OrderedItems>[];
    if (json['orderedItems'] != null) {
      json['orderedItems'].forEach((v) {
        orderedItems!.add(new OrderedItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['price'] = this.price;
    data['totalPrice'] = this.totalPrice;
    data['totalDiscountedPrice'] = this.totalDiscountedPrice;
    data['paymentType'] = this.paymentType;
    data['deliveryType'] = this.deliveryType;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    if (this.orderedItems != null) {
      data['orderedItems'] = this.orderedItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'OrderDetails{guid: $guid, price: $price, totalPrice: $totalPrice, totalDiscountedPrice: $totalDiscountedPrice, paymentType: $paymentType, deliveryType: $deliveryType, status: $status, createdAt: $createdAt, orderedItems: $orderedItems}';
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
  String? rejectReason;

  OrderedItems(
      {this.productOptionGuid,
      this.title,
      this.slug,
      this.price,
      this.amount,
      this.discountedPrice,
      this.isRejected,
      this.rejectReason});

  OrderedItems.fromJson(Map<String, dynamic> json) {
    productOptionGuid = json['productOptionGuid'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    amount = json['amount'];
    discountedPrice = json['discountedPrice'];
    isRejected = json['isRejected'];
    rejectReason = json['rejectReason'];
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
    data['rejectReason'] = this.rejectReason;
    return data;
  }

  @override
  String toString() {
    return 'OrderedItems{productOptionGuid: $productOptionGuid, title: $title, slug: $slug, price: $price, amount: $amount, discountedPrice: $discountedPrice, isRejected: $isRejected, rejectReason: $rejectReason}';
  }
}
