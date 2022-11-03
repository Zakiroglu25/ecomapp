class CategoryTree {
  String? guid;
  String? name;
  List<Subcategories>? subcategories;

  CategoryTree({this.guid, this.name, this.subcategories});

  CategoryTree.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    // if (this.subcategories != null) {
    //   data['subcategories'] =
    //       this.subcategories!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Subcategories {
  String? guid;
  String? name;

  // List<Null>? subcategories;

  Subcategories({
    this.guid,
    this.name,
    // this.subcategories,
  });

  Subcategories.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    // if (json['subcategories'] != null) {
    //   subcategories = <Null>[];
    //   json['subcategories'].forEach((v) {
    //     subcategories!.add(new Null.fromJson(v));
    //   });
  }
}

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['guid'] = this.guid;
//   data['name'] = this.name;
//   // if (this.subcategories != null) {
//   //   data['subcategories'] =
//   //       this.subcategories!.map((v) => v.toJson()).toList();
//   // }
//   return data;
// }
// }
