class ListCart {
  ListCart({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ListCart.fromJson(dynamic json) {
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
ListCart copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => ListCart(  success: success ?? _success,
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
      num? cartId, 
      num? userId, 
      num? productId, 
      num? quantity, 
      String? createdAt, 
      String? updatedAt, 
      Product? product,}){
    _cartId = cartId;
    _userId = userId;
    _productId = productId;
    _quantity = quantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
}

  Data.fromJson(dynamic json) {
    _cartId = json['cart_id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _quantity = json['quantity'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  num? _cartId;
  num? _userId;
  num? _productId;
  num? _quantity;
  String? _createdAt;
  String? _updatedAt;
  Product? _product;
Data copyWith({  num? cartId,
  num? userId,
  num? productId,
  num? quantity,
  String? createdAt,
  String? updatedAt,
  Product? product,
}) => Data(  cartId: cartId ?? _cartId,
  userId: userId ?? _userId,
  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  product: product ?? _product,
);
  num? get cartId => _cartId;
  num? get userId => _userId;
  num? get productId => _productId;
  num? get quantity => _quantity;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_id'] = _cartId;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['quantity'] = _quantity;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }

}

class Product {
  Product({
      num? productId, 
      num? subcategoryId, 
      String? productName, 
      String? productDesc, 
      num? productStock, 
      num? productPrice, 
      String? productImage, 
      String? createdAt, 
      String? updatedAt,}){
    _productId = productId;
    _subcategoryId = subcategoryId;
    _productName = productName;
    _productDesc = productDesc;
    _productStock = productStock;
    _productPrice = productPrice;
    _productImage = productImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Product.fromJson(dynamic json) {
    _productId = json['product_id'];
    _subcategoryId = json['subcategory_id'];
    _productName = json['product_name'];
    _productDesc = json['product_desc'];
    _productStock = json['product_stock'];
    _productPrice = json['product_price'];
    _productImage = json['product_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
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
Product copyWith({  num? productId,
  num? subcategoryId,
  String? productName,
  String? productDesc,
  num? productStock,
  num? productPrice,
  String? productImage,
  String? createdAt,
  String? updatedAt,
}) => Product(  productId: productId ?? _productId,
  subcategoryId: subcategoryId ?? _subcategoryId,
  productName: productName ?? _productName,
  productDesc: productDesc ?? _productDesc,
  productStock: productStock ?? _productStock,
  productPrice: productPrice ?? _productPrice,
  productImage: productImage ?? _productImage,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
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
    return map;
  }

}