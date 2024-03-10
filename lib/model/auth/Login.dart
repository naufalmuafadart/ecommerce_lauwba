class Login {
  Login({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  Login.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
Login copyWith({  bool? success,
  String? message,
  Data? data,
}) => Login(  success: success ?? _success,
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
      num? userId, 
      String? fullname, 
      String? email, 
      num? isAdmin, 
      String? createdAt, 
      String? updatedAt,}){
    _userId = userId;
    _fullname = fullname;
    _email = email;
    _isAdmin = isAdmin;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _fullname = json['fullname'];
    _email = json['email'];
    _isAdmin = json['is_admin'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _userId;
  String? _fullname;
  String? _email;
  num? _isAdmin;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? userId,
  String? fullname,
  String? email,
  num? isAdmin,
  String? createdAt,
  String? updatedAt,
}) => Data(  userId: userId ?? _userId,
  fullname: fullname ?? _fullname,
  email: email ?? _email,
  isAdmin: isAdmin ?? _isAdmin,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get userId => _userId;
  String? get fullname => _fullname;
  String? get email => _email;
  num? get isAdmin => _isAdmin;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['fullname'] = _fullname;
    map['email'] = _email;
    map['is_admin'] = _isAdmin;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}