class ProductList {
  ProductList({
      int? id, 
      String? name, 
      String? slug, 
      String? permalink, 
      String? dateCreated, 
      String? dateCreatedGmt, 
      String? dateModified, 
      String? dateModifiedGmt, 
      String? type, 
      String? status, 
      bool? featured, 
      String? catalogVisibility, 
      String? description, 
      String? shortDescription, 
      String? sku, 
      String? price, 
      String? regularPrice, 
      String? salePrice, 
      dynamic dateOnSaleFrom, 
      dynamic dateOnSaleFromGmt, 
      dynamic dateOnSaleTo, 
      dynamic dateOnSaleToGmt, 
      bool? onSale, 
      bool? purchasable, 
      int? totalSales, 
      String? taxStatus, 
      String? taxClass, 
      bool? manageStock, 
      dynamic stockQuantity, 
      dynamic lowStockAmount, 
      bool? soldIndividually, 
      bool? shippingRequired, 
      bool? shippingTaxable, 
      String? shippingClass, 
      int? shippingClassId, 
      bool? reviewsAllowed, 
      String? averageRating, 
      int? ratingCount, 
      int? parentId, 
      String? purchaseNote, 
      List<Categories>? categories, 
      List<ProductImages>? images,
      List<Attributes>? attributes, 
      int? menuOrder, 
      String? priceHtml, 
      String? stockStatus,}){
    _id = id;
    _name = name;
    _slug = slug;
    _permalink = permalink;
    _dateCreated = dateCreated;
    _dateCreatedGmt = dateCreatedGmt;
    _dateModified = dateModified;
    _dateModifiedGmt = dateModifiedGmt;
    _type = type;
    _status = status;
    _featured = featured;
    _catalogVisibility = catalogVisibility;
    _description = description;
    _shortDescription = shortDescription;
    _sku = sku;
    _price = price;
    _regularPrice = regularPrice;
    _salePrice = salePrice;
    _dateOnSaleFrom = dateOnSaleFrom;
    _dateOnSaleFromGmt = dateOnSaleFromGmt;
    _dateOnSaleTo = dateOnSaleTo;
    _dateOnSaleToGmt = dateOnSaleToGmt;
    _onSale = onSale;
    _purchasable = purchasable;
    _totalSales = totalSales;
    _taxStatus = taxStatus;
    _taxClass = taxClass;
    _manageStock = manageStock;
    _stockQuantity = stockQuantity;
    _lowStockAmount = lowStockAmount;
    _soldIndividually = soldIndividually;
    _shippingRequired = shippingRequired;
    _shippingTaxable = shippingTaxable;
    _shippingClass = shippingClass;
    _shippingClassId = shippingClassId;
    _reviewsAllowed = reviewsAllowed;
    _averageRating = averageRating;
    _ratingCount = ratingCount;
    _parentId = parentId;
    _purchaseNote = purchaseNote;
    _categories = categories;
    _images = images;
    _attributes = attributes;
    _menuOrder = menuOrder;
    _priceHtml = priceHtml;
    _stockStatus = stockStatus;
}

  ProductList.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _permalink = json['permalink'];
    _dateCreated = json['date_created'];
    _dateCreatedGmt = json['date_created_gmt'];
    _dateModified = json['date_modified'];
    _dateModifiedGmt = json['date_modified_gmt'];
    _type = json['type'];
    _status = json['status'];
    _featured = json['featured'];
    _catalogVisibility = json['catalog_visibility'];
    _description = json['description'];
    _shortDescription = json['short_description'];
    _sku = json['sku'];
    _price = json['price'];
    _regularPrice = json['regular_price'];
    _salePrice = json['sale_price'];
    _dateOnSaleFrom = json['date_on_sale_from'];
    _dateOnSaleFromGmt = json['date_on_sale_from_gmt'];
    _dateOnSaleTo = json['date_on_sale_to'];
    _dateOnSaleToGmt = json['date_on_sale_to_gmt'];
    _onSale = json['on_sale'];
    _purchasable = json['purchasable'];
    _totalSales = json['total_sales'];
    _taxStatus = json['tax_status'];
    _taxClass = json['tax_class'];
    _manageStock = json['manage_stock'];
    _stockQuantity = json['stock_quantity'];
    _lowStockAmount = json['low_stock_amount'];
    _soldIndividually = json['sold_individually'];
    _shippingRequired = json['shipping_required'];
    _shippingTaxable = json['shipping_taxable'];
    _shippingClass = json['shipping_class'];
    _shippingClassId = json['shipping_class_id'];
    _reviewsAllowed = json['reviews_allowed'];
    _averageRating = json['average_rating'];
    _ratingCount = json['rating_count'];
    _parentId = json['parent_id'];
    _purchaseNote = json['purchase_note'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(ProductImages.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
    _menuOrder = json['menu_order'];
    _priceHtml = json['price_html'];
    _stockStatus = json['stock_status'];
  }
  int? _id;
  String? _name;
  String? _slug;
  String? _permalink;
  String? _dateCreated;
  String? _dateCreatedGmt;
  String? _dateModified;
  String? _dateModifiedGmt;
  String? _type;
  String? _status;
  bool? _featured;
  String? _catalogVisibility;
  String? _description;
  String? _shortDescription;
  String? _sku;
  String? _price;
  String? _regularPrice;
  String? _salePrice;
  dynamic _dateOnSaleFrom;
  dynamic _dateOnSaleFromGmt;
  dynamic _dateOnSaleTo;
  dynamic _dateOnSaleToGmt;
  bool? _onSale;
  bool? _purchasable;
  int? _totalSales;
  String? _taxStatus;
  String? _taxClass;
  bool? _manageStock;
  dynamic _stockQuantity;
  dynamic _lowStockAmount;
  bool? _soldIndividually;
  bool? _shippingRequired;
  bool? _shippingTaxable;
  String? _shippingClass;
  int? _shippingClassId;
  bool? _reviewsAllowed;
  String? _averageRating;
  int? _ratingCount;
  int? _parentId;
  String? _purchaseNote;
  List<Categories>? _categories;
  List<ProductImages>? _images;
  List<Attributes>? _attributes;
  int? _menuOrder;
  String? _priceHtml;
  String? _stockStatus;

  int? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get permalink => _permalink;
  String? get dateCreated => _dateCreated;
  String? get dateCreatedGmt => _dateCreatedGmt;
  String? get dateModified => _dateModified;
  String? get dateModifiedGmt => _dateModifiedGmt;
  String? get type => _type;
  String? get status => _status;
  bool? get featured => _featured;
  String? get catalogVisibility => _catalogVisibility;
  String? get description => _description;
  String? get shortDescription => _shortDescription;
  String? get sku => _sku;
  String? get price => _price;
  String? get regularPrice => _regularPrice;
  String? get salePrice => _salePrice;
  dynamic get dateOnSaleFrom => _dateOnSaleFrom;
  dynamic get dateOnSaleFromGmt => _dateOnSaleFromGmt;
  dynamic get dateOnSaleTo => _dateOnSaleTo;
  dynamic get dateOnSaleToGmt => _dateOnSaleToGmt;
  bool? get onSale => _onSale;
  bool? get purchasable => _purchasable;
  int? get totalSales => _totalSales;
  String? get taxStatus => _taxStatus;
  String? get taxClass => _taxClass;
  bool? get manageStock => _manageStock;
  dynamic get stockQuantity => _stockQuantity;
  dynamic get lowStockAmount => _lowStockAmount;
  bool? get soldIndividually => _soldIndividually;
  bool? get shippingRequired => _shippingRequired;
  bool? get shippingTaxable => _shippingTaxable;
  String? get shippingClass => _shippingClass;
  int? get shippingClassId => _shippingClassId;
  bool? get reviewsAllowed => _reviewsAllowed;
  String? get averageRating => _averageRating;
  int? get ratingCount => _ratingCount;
  int? get parentId => _parentId;
  String? get purchaseNote => _purchaseNote;
  List<Categories>? get categories => _categories;
  List<ProductImages>? get images => _images;
  List<Attributes>? get attributes => _attributes;
  int? get menuOrder => _menuOrder;
  String? get priceHtml => _priceHtml;
  String? get stockStatus => _stockStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['permalink'] = _permalink;
    map['date_created'] = _dateCreated;
    map['date_created_gmt'] = _dateCreatedGmt;
    map['date_modified'] = _dateModified;
    map['date_modified_gmt'] = _dateModifiedGmt;
    map['type'] = _type;
    map['status'] = _status;
    map['featured'] = _featured;
    map['catalog_visibility'] = _catalogVisibility;
    map['description'] = _description;
    map['short_description'] = _shortDescription;
    map['sku'] = _sku;
    map['price'] = _price;
    map['regular_price'] = _regularPrice;
    map['sale_price'] = _salePrice;
    map['date_on_sale_from'] = _dateOnSaleFrom;
    map['date_on_sale_from_gmt'] = _dateOnSaleFromGmt;
    map['date_on_sale_to'] = _dateOnSaleTo;
    map['date_on_sale_to_gmt'] = _dateOnSaleToGmt;
    map['on_sale'] = _onSale;
    map['purchasable'] = _purchasable;
    map['total_sales'] = _totalSales;
    map['tax_status'] = _taxStatus;
    map['tax_class'] = _taxClass;
    map['manage_stock'] = _manageStock;
    map['stock_quantity'] = _stockQuantity;
    map['low_stock_amount'] = _lowStockAmount;
    map['sold_individually'] = _soldIndividually;
    map['shipping_required'] = _shippingRequired;
    map['shipping_taxable'] = _shippingTaxable;
    map['shipping_class'] = _shippingClass;
    map['shipping_class_id'] = _shippingClassId;
    map['reviews_allowed'] = _reviewsAllowed;
    map['average_rating'] = _averageRating;
    map['rating_count'] = _ratingCount;
    map['parent_id'] = _parentId;
    map['purchase_note'] = _purchaseNote;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    map['menu_order'] = _menuOrder;
    map['price_html'] = _priceHtml;
    map['stock_status'] = _stockStatus;
    return map;
  }

}

class Attributes {
  Attributes({
      int? id, 
      String? name, 
      int? position, 
      bool? visible, 
      bool? variation, 
      List<String>? options,}){
    _id = id;
    _name = name;
    _position = position;
    _visible = visible;
    _variation = variation;
    _options = options;
}

  Attributes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _position = json['position'];
    _visible = json['visible'];
    _variation = json['variation'];
    _options = json['options'] != null ? json['options'].cast<String>() : [];
  }
  int? _id;
  String? _name;
  int? _position;
  bool? _visible;
  bool? _variation;
  List<String>? _options;

  int? get id => _id;
  String? get name => _name;
  int? get position => _position;
  bool? get visible => _visible;
  bool? get variation => _variation;
  List<String>? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['position'] = _position;
    map['visible'] = _visible;
    map['variation'] = _variation;
    map['options'] = _options;
    return map;
  }

}

class ProductImages {
  ProductImages({
      int? id, 
      String? dateCreated, 
      String? dateCreatedGmt, 
      String? dateModified, 
      String? dateModifiedGmt, 
      String? src, 
      String? name, 
      String? alt,}){
    _id = id;
    _dateCreated = dateCreated;
    _dateCreatedGmt = dateCreatedGmt;
    _dateModified = dateModified;
    _dateModifiedGmt = dateModifiedGmt;
    _src = src;
    _name = name;
    _alt = alt;
}

  ProductImages.fromJson(dynamic json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateCreatedGmt = json['date_created_gmt'];
    _dateModified = json['date_modified'];
    _dateModifiedGmt = json['date_modified_gmt'];
    _src = json['src'];
    _name = json['name'];
    _alt = json['alt'];
  }
  int? _id;
  String? _dateCreated;
  String? _dateCreatedGmt;
  String? _dateModified;
  String? _dateModifiedGmt;
  String? _src;
  String? _name;
  String? _alt;

  int? get id => _id;
  String? get dateCreated => _dateCreated;
  String? get dateCreatedGmt => _dateCreatedGmt;
  String? get dateModified => _dateModified;
  String? get dateModifiedGmt => _dateModifiedGmt;
  String? get src => _src;
  String? get name => _name;
  String? get alt => _alt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date_created'] = _dateCreated;
    map['date_created_gmt'] = _dateCreatedGmt;
    map['date_modified'] = _dateModified;
    map['date_modified_gmt'] = _dateModifiedGmt;
    map['src'] = _src;
    map['name'] = _name;
    map['alt'] = _alt;
    return map;
  }

}

class Categories {
  Categories({
      int? id, 
      String? name, 
      String? slug,}){
    _id = id;
    _name = name;
    _slug = slug;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
  }
  int? _id;
  String? _name;
  String? _slug;

  int? get id => _id;
  String? get name => _name;
  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    return map;
  }

}