
class NotificationModel {
  List<Notifications> data = [];

  NotificationModel(this.data);

  NotificationModel.fromJson(List json) {
    for (int i = 0; i < json.length; i++) {
      data.add(Notifications.fromJson(json[i]));
    }
  }
}
class Notifications {
  String? guid;
  String? title;
  String? body;
  Metatdata? metatdata;
  String? createdAt;

  Notifications({this.guid, this.title, this.body, this.metatdata, this.createdAt});

  Notifications.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    title = json['title'];
    body = json['body'];
    metatdata = json['metatdata'] != null ? new Metatdata.fromJson(json['metatdata']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['title'] = this.title;
    data['body'] = this.body;
    if (this.metatdata != null) {
      data['metatdata'] = this.metatdata!.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Metatdata {



Metatdata.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}

// class Notifications {
//   String? guid;
//   String? title;
//   String? body;
//   String? createdAt;
//
//   Notifications({this.guid, this.title, this.body, this.createdAt});
//
//   Notifications.fromJson(Map<String, dynamic> json) {
//     guid = json['guid'];
//     title = json['title'];
//     body = json['body'];
//     createdAt = json['createdAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['guid'] = this.guid;
//     data['title'] = this.title;
//     data['body'] = this.body;
//     data['createdAt'] = this.createdAt;
//     return data;
//   }
// }


// class Metadata {
//   String? title;
//   Metadata({this.title});
//
//   Metadata.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     return data;
//   }
// }