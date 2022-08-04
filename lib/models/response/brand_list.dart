class BrandList {
  BrandList({
    int? termId,
    String? name,
    String? slug,
    int? termGroup,
    int? termTaxonomyId,
    String? taxonomy,
    String? description,
    int? parent,
    int? count,
    String? filter,
    List<String>? brandImage,
    bool? brandLogo,
  }) {
    _termId = termId;
    _name = name;
    _slug = slug;
    _termGroup = termGroup;
    _termTaxonomyId = termTaxonomyId;
    _taxonomy = taxonomy;
    _description = description;
    _parent = parent;
    _count = count;
    _filter = filter;
    _brandImage = brandImage;
    _brandLogo = brandLogo;
  }

  BrandList.fromJson(dynamic json) {
    _termId = json['term_id'];
    _name = json['name'];
    _slug = json['slug'];
    _termGroup = json['term_group'];
    _termTaxonomyId = json['term_taxonomy_id'];
    _taxonomy = json['taxonomy'];
    _description = json['description'];
    _parent = json['parent'];
    _count = json['count'];
    _filter = json['filter'];
    if (json['brand_image'] == true || json['brand_image'] == false) {
      _brandLogo = json['brand_image'];
    } else {
      _brandImage =
          json['brand_image'] != null ? json['brand_image'].cast<String>() : [];
    }
  }
  int? _termId;
  String? _name;
  String? _slug;
  int? _termGroup;
  int? _termTaxonomyId;
  String? _taxonomy;
  String? _description;
  int? _parent;
  int? _count;
  String? _filter;
  List<String>? _brandImage;
  bool? _brandLogo;

  int? get termId => _termId;
  String? get name => _name;
  String? get slug => _slug;
  int? get termGroup => _termGroup;
  int? get termTaxonomyId => _termTaxonomyId;
  String? get taxonomy => _taxonomy;
  String? get description => _description;
  int? get parent => _parent;
  int? get count => _count;
  String? get filter => _filter;
  List<String>? get brandImage => _brandImage;
  bool? get brandLogo => _brandLogo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['term_id'] = _termId;
    map['name'] = _name;
    map['slug'] = _slug;
    map['term_group'] = _termGroup;
    map['term_taxonomy_id'] = _termTaxonomyId;
    map['taxonomy'] = _taxonomy;
    map['description'] = _description;
    map['parent'] = _parent;
    map['count'] = _count;
    map['filter'] = _filter;
    map['brand_image'] = _brandImage;
    return map;
  }
}
