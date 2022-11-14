class ProductOptionDetailsModel {
  String? guid;
  int? publicId;
  String? title;
  String? slug;
  bool? prescriptionRequired;
  String? manufacturedIn;
  String? description;
  String? substances;
  String? excipients;
  String? dosage;
  String? packaging;
  String? packagingAmount;
  String? pharmaceuticalForm;
  String? registrationDate;
  Manufacturer? manufacturer;
  List<Categories>? categories;
  List<Images>? images;
  List<StockItems>? stockItems;

  ProductOptionDetailsModel(
      {this.guid,
        this.publicId,
        this.title,
        this.slug,
        this.prescriptionRequired,
        this.manufacturedIn,
        this.description,
        this.substances,
        this.excipients,
        this.dosage,
        this.packaging,
        this.packagingAmount,
        this.pharmaceuticalForm,
        this.registrationDate,
        this.manufacturer,
        this.categories,
        this.images,
        this.stockItems});

  ProductOptionDetailsModel.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    publicId = json['publicId'];
    title = json['title'];
    slug = json['slug'];
    prescriptionRequired = json['prescriptionRequired'];
    manufacturedIn = json['manufacturedIn'];
    description = json['description'];
    substances = json['substances'];
    excipients = json['excipients'];
    dosage = json['dosage'];
    packaging = json['packaging'];
    packagingAmount = json['packagingAmount'];
    pharmaceuticalForm = json['pharmaceuticalForm'];
    registrationDate = json['registrationDate'];
    manufacturer = json['manufacturer'] != null
        ? new Manufacturer.fromJson(json['manufacturer'])
        : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['stockItems'] != null) {
      stockItems = <StockItems>[];
      json['stockItems'].forEach((v) {
        stockItems!.add(new StockItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['publicId'] = this.publicId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['prescriptionRequired'] = this.prescriptionRequired;
    data['manufacturedIn'] = this.manufacturedIn;
    data['description'] = this.description;
    data['substances'] = this.substances;
    data['excipients'] = this.excipients;
    data['dosage'] = this.dosage;
    data['packaging'] = this.packaging;
    data['packagingAmount'] = this.packagingAmount;
    data['pharmaceuticalForm'] = this.pharmaceuticalForm;
    data['registrationDate'] = this.registrationDate;
    if (this.manufacturer != null) {
      data['manufacturer'] = this.manufacturer!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.stockItems != null) {
      data['stockItems'] = this.stockItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Manufacturer {
  String? guid;
  String? name;

  Manufacturer({this.guid, this.name});

  Manufacturer.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    return data;
  }
}

class Categories {
  String? guid;
  String? name;
  String? slug;

  Categories({this.guid, this.name, this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class StockItems {
  String? guid;
  double? price;
  double? discountedPrice;
  Store? store;

  StockItems({this.guid, this.price, this.discountedPrice, this.store});

  StockItems.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    price = json['price'];
    discountedPrice = json['discountedPrice'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['price'] = this.price;
    data['discountedPrice'] = this.discountedPrice;
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

class Store {
  String? guid;
  String? name;
  String? slug;
  Null? website;
  bool? worksWithInsurance;
  int? opensAtHour;
  int? closesAtHour;
  int? opensAtMinutes;
  int? closesAtMinutes;
  bool? open;

  Store(
      {this.guid,
        this.name,
        this.slug,
        this.website,
        this.worksWithInsurance,
        this.opensAtHour,
        this.closesAtHour,
        this.opensAtMinutes,
        this.closesAtMinutes,
        this.open});

  Store.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    slug = json['slug'];
    website = json['website'];
    worksWithInsurance = json['worksWithInsurance'];
    opensAtHour = json['opensAtHour'];
    closesAtHour = json['closesAtHour'];
    opensAtMinutes = json['opensAtMinutes'];
    closesAtMinutes = json['closesAtMinutes'];
    open = json['open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['website'] = this.website;
    data['worksWithInsurance'] = this.worksWithInsurance;
    data['opensAtHour'] = this.opensAtHour;
    data['closesAtHour'] = this.closesAtHour;
    data['opensAtMinutes'] = this.opensAtMinutes;
    data['closesAtMinutes'] = this.closesAtMinutes;
    data['open'] = this.open;
    return data;
  }
}
class Images {
  String? url;


  Images({this.url});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}