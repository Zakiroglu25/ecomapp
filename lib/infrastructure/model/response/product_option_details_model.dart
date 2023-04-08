class ProductDetails {
  String? guid;
  String? productOptionGuid;
  int? publicId;
  String? title;
  String? slug;
  num? discountedPrice;
  bool? prescriptionRequired;
  bool? isInCart;
  String? manufacturedIn;
  String? description;
  String? substances;
  String? excipients;
  String? dosage;
  String? packaging;
  String? packagingAmount;
  String? pharmaceuticalForm;
  String? registrationDate;
  num? price;
  Manufacturer? manufacturer;
  Store? store;
  List<Categories>? categories;
  List<String>? images;
  List<StockItems>? stockItems;

  ProductDetails(
      {this.guid,
      this.productOptionGuid,
      this.publicId,
      this.title,
      this.slug,
      this.discountedPrice,
      this.prescriptionRequired = false,
      this.manufacturedIn,
      this.description,
      this.substances,
      this.excipients,
      this.dosage,
      this.price,
      this.packaging,
      this.store,
      this.packagingAmount,
      this.pharmaceuticalForm,
      this.registrationDate,
      this.manufacturer,
      this.categories,
      this.images,
      this.stockItems});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    productOptionGuid = json['productOptionGuid'];
    publicId = json['publicId'];
    title = json['title'] ?? '';
    slug = json['slug'];
    discountedPrice = json['discountedPrice'] ?? 0;
    prescriptionRequired = json['prescriptionRequired'] ?? false;
    manufacturedIn = json['manufacturedIn'] ?? '';
    description = json['description'] ?? '';
    price = json['price'] ?? 0;
    substances = json['substances'];
    excipients = json['excipients'];
    dosage = json['dosage'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    packaging = json['packaging'];
    packagingAmount = json['packagingAmount'];
    isInCart = json['isInCart'] ?? false;
    pharmaceuticalForm = json['pharmaceuticalForm'];
    registrationDate = json['registrationDate'];
    manufacturer = json['manufacturer'] != null
        ? Manufacturer.fromJson(json['manufacturer'])
        : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    images = json['images'].cast<String>() ?? [];
    if (json['stockItems'] != null) {
      stockItems = <StockItems>[];
      json['stockItems'].forEach((v) {
        stockItems!.add(StockItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['guid'] = guid;
    data['productOptionGuid'] = productOptionGuid;
    data['publicId'] = publicId;
    data['title'] = title;
    data['slug'] = slug;
    data['discountedPrice'] = discountedPrice;
    data['isInCart'] = isInCart;
    data['prescriptionRequired'] = prescriptionRequired;
    data['manufacturedIn'] = manufacturedIn;
    data['description'] = description;
    data['substances'] = substances;
    data['excipients'] = excipients;
    data['dosage'] = dosage;
    data['price'] = price;
    data['packaging'] = packaging;
    data['packagingAmount'] = packagingAmount;
    data['pharmaceuticalForm'] = pharmaceuticalForm;
    data['registrationDate'] = registrationDate;
    if (manufacturer != null) {
      data['manufacturer'] = manufacturer!.toJson();
    }
    if (store != null) {
      data['store'] = store!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['images'] = images;
    if (stockItems != null) {
      data['stockItems'] = stockItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ProductDetails{guid: $guid,productOptionGuid: $productOptionGuid, store: $store, publicId: $publicId,price: $price, title: $title, slug: $slug, discountedPrice: $discountedPrice, prescriptionRequired: $prescriptionRequired, isInCart: $isInCart, manufacturedIn: $manufacturedIn, description: $description, substances: $substances, excipients: $excipients, dosage: $dosage, packaging: $packaging, packagingAmount: $packagingAmount, pharmaceuticalForm: $pharmaceuticalForm, registrationDate: $registrationDate, manufacturer: $manufacturer, categories: $categories, images: $images, stockItems: $stockItems}';
  }
}

class Manufacturer {
  String? guid;
  String? name;

  Manufacturer({this.guid, this.name});

  Manufacturer.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['guid'] = guid;
    data['name'] = name;
    return data;
  }

  @override
  String toString() {
    return 'Manufacturer{guid: $guid, name: $name}';
  }
}

class Categories {
  String? guid;
  String? name;
  String? slug;

  Categories({this.guid, this.name, this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'] ?? '';
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['guid'] = guid;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }

  @override
  String toString() {
    return 'Categories{guid: $guid, name: $name, slug: $slug}';
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
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['guid'] = guid;
    data['price'] = price;
    data['discountedPrice'] = discountedPrice;
    if (store != null) {
      data['store'] = store!.toJson();
    }
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    return data;
  }
}

class Store {
  String? guid;
  String? name;
  String? slug;
  String? website;
  bool? worksWithInsurance;
  String? image;
  bool? isOpen;
  int? opensAtHour;
  int? closesAtHour;
  int? opensAtMinutes;
  int? closesAtMinutes;

  Store(
      {this.guid,
      this.name,
      this.slug,
      this.website,
      this.worksWithInsurance,
      this.isOpen,
      this.image,
      this.opensAtHour,
      this.closesAtHour,
      this.opensAtMinutes,
      this.closesAtMinutes});

  Store.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'] ?? '';
    slug = json['slug'];
    website = json['website'];
    worksWithInsurance = json['worksWithInsurance'];
    image = json['image'];
    isOpen = json['isOpen'];
    opensAtHour = json['opensAtHour'];
    closesAtHour = json['closesAtHour'];
    opensAtMinutes = json['opensAtMinutes'];
    closesAtMinutes = json['closesAtMinutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['website'] = this.website;
    data['worksWithInsurance'] = this.worksWithInsurance;
    data['image'] = this.image;
    data['isOpen'] = this.isOpen;
    data['opensAtHour'] = this.opensAtHour;
    data['closesAtHour'] = this.closesAtHour;
    data['opensAtMinutes'] = this.opensAtMinutes;
    data['closesAtMinutes'] = this.closesAtMinutes;
    return data;
  }

  @override
  String toString() {
    return 'Store{guid: $guid, name: $name, slug: $slug, website: $website, worksWithInsurance: $worksWithInsurance, image: $image, isOpen: $isOpen, opensAtHour: $opensAtHour, closesAtHour: $closesAtHour, opensAtMinutes: $opensAtMinutes, closesAtMinutes: $closesAtMinutes}';
  }
}
