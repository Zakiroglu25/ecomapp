class CartOrdersData {
  List<CartOrder>? data;
  int? page;
  int? pageSize;
  int? totalItems;
  int? totalPages;

  CartOrdersData(
      {this.data, this.page, this.pageSize, this.totalItems, this.totalPages});

  CartOrdersData.fromJson(Map<String, dynamic> json) {
    data = <CartOrder>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add(new CartOrder.fromJson(v));
      });
    }
    page = json['page'];
    pageSize = json['pageSize'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    data['totalItems'] = this.totalItems;
    data['totalPages'] = this.totalPages;
    return data;
  }

  @override
  String toString() {
    return 'OrdersData{data: $data, page: $page, pageSize: $pageSize, totalItems: $totalItems, totalPages: $totalPages}';
  }
}

class CartOrder {
  String? guid;
  int? orderNumber;
  int? totalStockItemsOrdered;
  double? price;
  double? totalPrice;
  double? discountedPrice;
  String? paymentType;
  String? deliveryType;
  String? status;
  String? createdAt;

  CartOrder(
      {this.guid,
      this.orderNumber,
      this.totalStockItemsOrdered,
      this.price,
      this.totalPrice,
      this.discountedPrice,
      this.paymentType,
      this.deliveryType,
      this.status,
      this.createdAt});

  CartOrder.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    orderNumber = json['orderNumber'] ?? 0;
    totalStockItemsOrdered = json['totalStockItemsOrdered'];
    price = json['price'];
    totalPrice = json['totalPrice'];
    discountedPrice = json['discountedPrice'];
    paymentType = json['paymentType'];
    deliveryType = json['deliveryType'] ?? 'COURIER';
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['orderNumber'] = this.orderNumber;
    data['totalStockItemsOrdered'] = this.totalStockItemsOrdered;
    data['price'] = this.price;
    data['totalPrice'] = this.totalPrice;
    data['discountedPrice'] = this.discountedPrice;
    data['paymentType'] = this.paymentType;
    data['deliveryType'] = this.deliveryType;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    return data;
  }

  @override
  String toString() {
    return 'CartOrder{guid: $guid, orderNumber: $orderNumber, totalStockItemsOrdered: $totalStockItemsOrdered, price: $price, totalPrice: $totalPrice, discountedPrice: $discountedPrice, paymentType: $paymentType, deliveryType: $deliveryType, status: $status, createdAt: $createdAt}';
  }
}
