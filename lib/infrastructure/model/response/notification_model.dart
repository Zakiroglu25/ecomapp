class NotificationModel {
  String? guid;
  String? title;
  String? body;
  Metadata? metadata;
  String? createdAt;

  NotificationModel(
      {this.guid, this.title, this.body, this.metadata, this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  String? title;

  Metadata({this.title});

  Metadata.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}