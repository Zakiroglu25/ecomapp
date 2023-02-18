class OrderDetails {
  String? guid;
  int? orderNumber;
  num? price;
  num? totalPrice;
  num? totalDiscountedPrice;
  num? notCoveredByInsuranceAmount;
  num? deliveryPrice;
  String? paymentType;
  String? deliveryType;
  String? storeGuid;
  String? storeName;
  String? storePhone;
  String? status;
  String? attachmentImageUrl;
  bool? payingForNotCovered;
  bool? insuranceRequested;
  String? createdAt;
  List<OrderedItems>? orderedItems;

  OrderDetails(
      {this.guid,
      this.orderNumber,
      this.price,
      this.totalPrice,
      this.totalDiscountedPrice,
      this.deliveryPrice,
      this.paymentType,
      this.deliveryType,
      this.notCoveredByInsuranceAmount,
      this.storeGuid,
      this.storeName,
      this.storePhone,
      this.attachmentImageUrl,
      this.payingForNotCovered,
      this.insuranceRequested,
      this.status,
      this.createdAt,
      this.orderedItems});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    orderNumber = json['orderNumber'];
    price = json['price'] ?? 0;
    totalPrice = json['totalPrice'] ?? 0;
    notCoveredByInsuranceAmount = json['notCoveredByInsuranceAmount'] ?? 0;
    totalDiscountedPrice = json['totalDiscountedPrice'];
    deliveryPrice = json['deliveryPrice'] ?? 0;
    paymentType = json['paymentType'];
    deliveryType = json['deliveryType'];
    storeGuid = json['storeGuid'];
    storeName = json['storeName'];
    storePhone = json['storePhone'];
    attachmentImageUrl = json['attachmentImageUrl'];
    payingForNotCovered = json['payingForNotCovered'] ?? false;
    insuranceRequested = json['insuranceRequested'];

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
    data['orderNumber'] = this.orderNumber;
    data['price'] = this.price;
    data['totalPrice'] = this.totalPrice;
    data['totalDiscountedPrice'] = this.totalDiscountedPrice;
    data['paymentType'] = this.paymentType;
    data['deliveryType'] = this.deliveryType;
    data['deliveryPrice'] = this.deliveryPrice;
    data['storeGuid'] = this.storeGuid;
    data['storeName'] = this.storeName;
    data['attachmentImageUrl'] = this.attachmentImageUrl;
    data['notCoveredByInsuranceAmount'] = this.notCoveredByInsuranceAmount;
    data['payingForNotCovered'] = this.payingForNotCovered;
    data['insuranceRequested'] = this.insuranceRequested;
    data['storePhone'] = this.storePhone;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    if (this.orderedItems != null) {
      data['orderedItems'] = this.orderedItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'OrderDetails{guid: $guid, notCoveredByInsuranceAmount: $notCoveredByInsuranceAmount, orderNumber: $orderNumber, deliveryPrice: $deliveryPrice, price: $price, totalPrice: $totalPrice, totalDiscountedPrice: $totalDiscountedPrice, paymentType: $paymentType, deliveryType: $deliveryType, storeGuid: $storeGuid, storeName: $storeName, storePhone: $storePhone, status: $status, attachmentImageUrl: $attachmentImageUrl, payingForNotCovered: $payingForNotCovered, insuranceRequested: $insuranceRequested, createdAt: $createdAt, orderedItems: $orderedItems}';
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
  bool? isIncludedInOrder;

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
      this.isIncludedInOrder,
      this.isCoveredByInsurance});

  OrderedItems.fromJson(Map<String, dynamic> json) {
    productOptionGuid = json['productOptionGuid'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    amount = json['amount'];
    discountedPrice = json['discountedPrice'];
    isIncludedInOrder = json['isIncludedInOrder'];
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
    data['isIncludedInOrder'] = this.isIncludedInOrder;
    data['rejectReason'] = this.rejectReason;
    data['isCoveredByInsurance'] = this.isCoveredByInsurance;
    return data;
  }

  @override
  String toString() {
    return 'OrderedItems{productOptionGuid: $productOptionGuid, title: $title,  isIncludedInOrder: $isIncludedInOrder, slug: $slug, price: $price, amount: $amount, discountedPrice: $discountedPrice, isRejected: $isRejected, images: $images, rejectReason: $rejectReason, isCoveredByInsurance: $isCoveredByInsurance}';
  }
}
