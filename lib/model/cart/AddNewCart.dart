class AddNewCart {
  AddNewCart({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  AddNewCart.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
AddNewCart copyWith({  bool? success,
  String? message,
  Data? data,
}) => AddNewCart(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      String? userId, 
      String? productId, 
      String? quantity, 
      String? updatedAt, 
      String? createdAt, 
      num? cartId,}){
    _userId = userId;
    _productId = productId;
    _quantity = quantity;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _cartId = cartId;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _productId = json['product_id'];
    _quantity = json['quantity'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _cartId = json['cart_id'];
  }
  String? _userId;
  String? _productId;
  String? _quantity;
  String? _updatedAt;
  String? _createdAt;
  num? _cartId;
Data copyWith({  String? userId,
  String? productId,
  String? quantity,
  String? updatedAt,
  String? createdAt,
  num? cartId,
}) => Data(  userId: userId ?? _userId,
  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  cartId: cartId ?? _cartId,
);
  String? get userId => _userId;
  String? get productId => _productId;
  String? get quantity => _quantity;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get cartId => _cartId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['quantity'] = _quantity;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['cart_id'] = _cartId;
    return map;
  }

}