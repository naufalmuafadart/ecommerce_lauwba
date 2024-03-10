class ListProduct {
  ListProduct({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ListProduct.fromJson(dynamic json) {
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
ListProduct copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => ListProduct(  success: success ?? _success,
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
      num? productId, 
      num? subcategoryId, 
      String? productName, 
      String? productDesc, 
      num? productStock, 
      num? productPrice, 
      String? productImage, 
      String? createdAt, 
      String? updatedAt, 
      Subcategory? subcategory,}){
    _productId = productId;
    _subcategoryId = subcategoryId;
    _productName = productName;
    _productDesc = productDesc;
    _productStock = productStock;
    _productPrice = productPrice;
    _productImage = productImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subcategory = subcategory;
}

  Data.fromJson(dynamic json) {
    _productId = json['product_id'];
    _subcategoryId = json['subcategory_id'];
    _productName = json['product_name'];
    _productDesc = json['product_desc'];
    _productStock = json['product_stock'];
    _productPrice = json['product_price'];
    _productImage = json['product_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _subcategory = json['subcategory'] != null ? Subcategory.fromJson(json['subcategory']) : null;
  }
  num? _productId;
  num? _subcategoryId;
  String? _productName;
  String? _productDesc;
  num? _productStock;
  num? _productPrice;
  String? _productImage;
  String? _createdAt;
  String? _updatedAt;
  Subcategory? _subcategory;
Data copyWith({  num? productId,
  num? subcategoryId,
  String? productName,
  String? productDesc,
  num? productStock,
  num? productPrice,
  String? productImage,
  String? createdAt,
  String? updatedAt,
  Subcategory? subcategory,
}) => Data(  productId: productId ?? _productId,
  subcategoryId: subcategoryId ?? _subcategoryId,
  productName: productName ?? _productName,
  productDesc: productDesc ?? _productDesc,
  productStock: productStock ?? _productStock,
  productPrice: productPrice ?? _productPrice,
  productImage: productImage ?? _productImage,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  subcategory: subcategory ?? _subcategory,
);
  num? get productId => _productId;
  num? get subcategoryId => _subcategoryId;
  String? get productName => _productName;
  String? get productDesc => _productDesc;
  num? get productStock => _productStock;
  num? get productPrice => _productPrice;
  String? get productImage => _productImage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Subcategory? get subcategory => _subcategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['subcategory_id'] = _subcategoryId;
    map['product_name'] = _productName;
    map['product_desc'] = _productDesc;
    map['product_stock'] = _productStock;
    map['product_price'] = _productPrice;
    map['product_image'] = _productImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.toJson();
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