
class NotificationModel {
  List<Notificationse> data = [];

  NotificationModel(this.data);

  NotificationModel.fromJson(List json) {
    for (int i = 0; i < json.length; i++) {
      data.add(Notificationse.fromJson(json[i]));
    }
  }
}
class Notificationse {
  String? guid;
  String? title;
  String? body;
  Metadata? metadata;
  String? createdAt;

  Notificationse(
      {this.guid, this.title, this.body, this.metadata, this.createdAt});

  Notificationse.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    title = json['title'];
    body = json['body'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['title'] = this.title;
    data['body'] = this.body;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Metadata {
  String? type;

  Metadata({this.type});

  Metadata.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}