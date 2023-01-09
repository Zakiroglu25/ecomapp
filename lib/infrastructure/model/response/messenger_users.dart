class MessengerUser {
  List<Data>? data;
  int? page;
  int? pageSize;
  int? totalItems;
  int? totalPages;

  MessengerUser(
      {this.data, this.page, this.pageSize, this.totalItems, this.totalPages});

  MessengerUser.fromJson(Map<String, dynamic> json) {
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
  String? storeGuid;
  String? storeName;
  String? lastMessage;
  String? lastMessageSentAt;

  Data(
      {this.guid,
        this.storeGuid,
        this.storeName,
        this.lastMessage,
        this.lastMessageSentAt});

  Data.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    storeGuid = json['storeGuid'];
    storeName = json['storeName'];
    lastMessage = json['lastMessage'];
    lastMessageSentAt = json['lastMessageSentAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['storeGuid'] = this.storeGuid;
    data['storeName'] = this.storeName;
    data['lastMessage'] = this.lastMessage;
    data['lastMessageSentAt'] = this.lastMessageSentAt;
    return data;
  }
}