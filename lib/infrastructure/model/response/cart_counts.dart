class TabCounts {
  int? inCart;
  int? inProcessing;
  int? inDelivery;
  int? delivered;

  TabCounts({this.inCart, this.inProcessing, this.inDelivery, this.delivered});

  TabCounts.fromJson(Map<String, dynamic> json) {
    inCart = json['inCart'];
    inProcessing = json['inProcessing'];
    inDelivery = json['inDelivery'];
    delivered = json['delivered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inCart'] = this.inCart ?? 0;
    data['inProcessing'] = this.inProcessing ?? 0;
    data['inDelivery'] = this.inDelivery ?? 0;
    data['delivered'] = this.delivered ?? 0;
    return data;
  }

  @override
  String toString() {
    return 'CartCounts{inCart: $inCart, inProcessing: $inProcessing, inDelivery: $inDelivery, delivered: $delivered}';
  }
}
