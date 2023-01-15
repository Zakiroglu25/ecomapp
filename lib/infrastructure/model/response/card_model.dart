class CardModel {
  List<CardData> list = [];

  CardModel(this.list);

  CardModel.fromJson(List json) {
    for (int i = 0; i < json.length; i++) {
      list.add(CardData.fromJson(json[i]));
    }
  }
}

class CardData {
  String? guid;
  String? brand;
  String? pan;
  String? cardHolderName;

  CardData({this.guid, this.brand, this.pan, this.cardHolderName});

  CardData.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    brand = json['brand'];
    pan = json['pan'];
    cardHolderName = json['cardHolderName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['brand'] = this.brand;
    data['pan'] = this.pan;
    data['cardHolderName'] = this.cardHolderName;
    return data;
  }
}
