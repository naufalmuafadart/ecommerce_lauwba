class ListCarousel {
  ListCarousel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ListCarousel.fromJson(dynamic json) {
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
ListCarousel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => ListCarousel(  success: success ?? _success,
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
      num? carouselId, 
      String? carouselImage, 
      String? createdAt, 
      String? updatedAt,}){
    _carouselId = carouselId;
    _carouselImage = carouselImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _carouselId = json['carousel_id'];
    _carouselImage = json['carousel_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _carouselId;
  String? _carouselImage;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? carouselId,
  String? carouselImage,
  String? createdAt,
  String? updatedAt,
}) => Data(  carouselId: carouselId ?? _carouselId,
  carouselImage: carouselImage ?? _carouselImage,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get carouselId => _carouselId;
  String? get carouselImage => _carouselImage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carousel_id'] = _carouselId;
    map['carousel_image'] = _carouselImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}