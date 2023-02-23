
class ChatMessagesModel {
  List<Data> list = [];

  ChatMessagesModel(this.list);

  ChatMessagesModel.fromJson(List json) {
    for (int i = 0; i < json.length; i++) {
      list.add(Data.fromJson(json[i]));
    }
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