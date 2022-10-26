class ProductOptionModel {
  List<Data>? data;
  int? page;
  int? pageSize;
  int? totalItems;
  int? totalPages;

  ProductOptionModel(
      {this.data, this.page, this.pageSize, this.totalItems, this.totalPages});

  ProductOptionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
}

class Data {
  String? guid;
  String? title;
  double? minPrice;
  String? imageUrl;

  Data({this.guid, this.title, this.minPrice, this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    title = json['title'];
    minPrice = json['minPrice'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['title'] = this.title;
    data['minPrice'] = this.minPrice;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}