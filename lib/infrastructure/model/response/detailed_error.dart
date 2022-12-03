class DetailedError {
  String? time;
  String? message;
  String? details;
  int? status;

  DetailedError({this.time, this.message, this.details, this.status});

  DetailedError.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    message = json['message'];
    details = json['details'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['message'] = this.message;
    data['details'] = this.details;
    data['status'] = this.status;
    return data;
  }
}
