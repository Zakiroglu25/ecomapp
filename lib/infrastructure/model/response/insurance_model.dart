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

  Insurance(
      {this.guid,
      this.customerGuid,
      this.phoneNumber,
      this.policyNumber,
      this.isValidated,
      this.createdAt});

  Insurance.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    customerGuid = json['customerGuid'];
    phoneNumber = json['phoneNumber'];
    policyNumber = json['policyNumber'];
    isValidated = json['isValidated'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['customerGuid'] = this.customerGuid;
    data['phoneNumber'] = this.phoneNumber;
    data['policyNumber'] = this.policyNumber;
    data['isValidated'] = this.isValidated;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
