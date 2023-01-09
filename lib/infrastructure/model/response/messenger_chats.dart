class ChatMessagesModel {
  List<Data>? data;
  int? page;
  int? pageSize;
  int? totalItems;
  int? totalPages;

  ChatMessagesModel(
      {this.data, this.page, this.pageSize, this.totalItems, this.totalPages});

  ChatMessagesModel.fromJson(Map<String, dynamic> json) {
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
  String? message;
  bool? isByYou;
  String? sentAt;

  Data({this.guid, this.message, this.isByYou, this.sentAt});

  Data.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    message = json['message'];
    isByYou = json['isByYou'];
    sentAt = json['sentAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['message'] = this.message;
    data['isByYou'] = this.isByYou;
    data['sentAt'] = this.sentAt;
    return data;
  }
}