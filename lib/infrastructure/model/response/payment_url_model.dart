class PaymentUrlModel {
  String? url;

  PaymentUrlModel({this.url});

  PaymentUrlModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }

  @override
  String toString() {
    return 'PaymentUrlModel{url: $url}';
  }
}
