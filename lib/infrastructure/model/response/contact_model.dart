class ContactModel {
  List<Contacts> data = [];

  ContactModel(this.data);

  ContactModel.fromJson(List json) {
    for (int i = 0; i < json.length; i++) {
      data.add(Contacts.fromJson(json[i]));
    }
  }
}

class Contacts {
  String? channel;
  String? type;
  String? contact;

  Contacts({this.channel, this.type, this.contact});

  Contacts.fromJson(Map<String, dynamic> json) {
    channel = json['channel'];
    type = json['type'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channel'] = this.channel;
    data['type'] = this.type;
    data['contact'] = this.contact;
    return data;
  }
}
