class CartCounts {
  int? inCart;
  int? inProcessing;
  int? inDelivery;
  int? delivered;

  CartCounts({this.inCart, this.inProcessing, this.inDelivery, this.delivered});

  CartCounts.fromJson(Map<String, dynamic> json) {
    inCart = json['inCart'];
    inProcessing = json['inProcessing'];
    inDelivery = json['inDelivery'];
    delivered = json['delivered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inCart'] = this.inCart;
    data['inProcessing'] = this.inProcessing;
    data['inDelivery'] = this.inDelivery;
    data['delivered'] = this.delivered;
    return data;
  }

  @override
  String toString() {
    return 'CartCounts{inCart: $inCart, inProcessing: $inProcessing, inDelivery: $inDelivery, delivered: $delivered}';
  }
}
