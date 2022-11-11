class CategoryTree {
  String? guid;
  String? name;
  List<CategoryTree>? subcategories;

  CategoryTree({this.guid, this.name, this.subcategories});

  CategoryTree.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    if (json['subcategories'] != null) {
      subcategories = <CategoryTree>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new CategoryTree.fromJson(v));
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

  @override
  String toString() {
    return 'CategoryTree{guid: $guid, name: $name, subcategories: $subcategories}';
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
