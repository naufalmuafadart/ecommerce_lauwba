class ListCategory {
  ListCategory({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ListCategory.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Data>? _data;
ListCategory copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => ListCategory(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      num? categoryId, 
      String? categoryName, 
      String? categoryDesc, 
      String? categoryImage, 
      String? createdAt, 
      String? updatedAt, 
      List<Subcategory>? subcategory,}){
    _categoryId = categoryId;
    _categoryName = categoryName;
    _categoryDesc = categoryDesc;
    _categoryImage = categoryImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subcategory = subcategory;
}

  Data.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _categoryName = json['category_name'];
    _categoryDesc = json['category_desc'];
    _categoryImage = json['category_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['subcategory'] != null) {
      _subcategory = [];
      json['subcategory'].forEach((v) {
        _subcategory?.add(Subcategory.fromJson(v));
      });
    }
  }
  num? _categoryId;
  String? _categoryName;
  String? _categoryDesc;
  String? _categoryImage;
  String? _createdAt;
  String? _updatedAt;
  List<Subcategory>? _subcategory;
Data copyWith({  num? categoryId,
  String? categoryName,
  String? categoryDesc,
  String? categoryImage,
  String? createdAt,
  String? updatedAt,
  List<Subcategory>? subcategory,
}) => Data(  categoryId: categoryId ?? _categoryId,
  categoryName: categoryName ?? _categoryName,
  categoryDesc: categoryDesc ?? _categoryDesc,
  categoryImage: categoryImage ?? _categoryImage,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  subcategory: subcategory ?? _subcategory,
);
  num? get categoryId => _categoryId;
  String? get categoryName => _categoryName;
  String? get categoryDesc => _categoryDesc;
  String? get categoryImage => _categoryImage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Subcategory>? get subcategory => _subcategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['category_name'] = _categoryName;
    map['category_desc'] = _categoryDesc;
    map['category_image'] = _categoryImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Subcategory {
  Subcategory({
      num? subcategoryId, 
      num? categoryId, 
      String? subcategoryName, 
      String? subcategoryDesc, 
      String? subcategoryImage, 
      String? createdAt, 
      String? updatedAt,}){
    _subcategoryId = subcategoryId;
    _categoryId = categoryId;
    _subcategoryName = subcategoryName;
    _subcategoryDesc = subcategoryDesc;
    _subcategoryImage = subcategoryImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Subcategory.fromJson(dynamic json) {
    _subcategoryId = json['subcategory_id'];
    _categoryId = json['category_id'];
    _subcategoryName = json['subcategory_name'];
    _subcategoryDesc = json['subcategory_desc'];
    _subcategoryImage = json['subcategory_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _subcategoryId;
  num? _categoryId;
  String? _subcategoryName;
  String? _subcategoryDesc;
  String? _subcategoryImage;
  String? _createdAt;
  String? _updatedAt;
Subcategory copyWith({  num? subcategoryId,
  num? categoryId,
  String? subcategoryName,
  String? subcategoryDesc,
  String? subcategoryImage,
  String? createdAt,
  String? updatedAt,
}) => Subcategory(  subcategoryId: subcategoryId ?? _subcategoryId,
  categoryId: categoryId ?? _categoryId,
  subcategoryName: subcategoryName ?? _subcategoryName,
  subcategoryDesc: subcategoryDesc ?? _subcategoryDesc,
  subcategoryImage: subcategoryImage ?? _subcategoryImage,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get subcategoryId => _subcategoryId;
  num? get categoryId => _categoryId;
  String? get subcategoryName => _subcategoryName;
  String? get subcategoryDesc => _subcategoryDesc;
  String? get subcategoryImage => _subcategoryImage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subcategory_id'] = _subcategoryId;
    map['category_id'] = _categoryId;
    map['subcategory_name'] = _subcategoryName;
    map['subcategory_desc'] = _subcategoryDesc;
    map['subcategory_image'] = _subcategoryImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}