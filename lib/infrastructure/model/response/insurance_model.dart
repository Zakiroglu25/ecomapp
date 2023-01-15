class InsuranceModel {
  List<Insurance> data = [];

  InsuranceModel(this.data);

  InsuranceModel.fromJson(List json) {
    for (int i = 0; i < json.length; i++) {
      data.add(Insurance.fromJson(json[i]));
    }
  }
}

class Insurance {
  String? guid;
  String? customerGuid;
  String? phoneNumber;
  String? policyNumber;
  bool? isValidated;
  String? createdAt;
  Provider? provider;

  Insurance(
      {this.guid,
        this.customerGuid,
        this.phoneNumber,
        this.policyNumber,
        this.isValidated,
        this.createdAt,this.provider});

  Insurance.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    customerGuid = json['customerGuid'];
    phoneNumber = json['phoneNumber'];
    policyNumber = json['policyNumber'];
    isValidated = json['isValidated'];
    createdAt = json['createdAt'];
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['customerGuid'] = this.customerGuid;
    data['phoneNumber'] = this.phoneNumber;
    data['policyNumber'] = this.policyNumber;
    data['isValidated'] = this.isValidated;
    data['createdAt'] = this.createdAt;
    if (this.provider != null) {
      data['provider'] = this.provider!.toJson();
    }
    return data;
  }
}

class Provider {
  String? guid;
  String? title;
  String? imageUrl;
  Null? description;

  Provider({this.guid, this.title, this.imageUrl, this.description});

  Provider.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    return data;
  }
}