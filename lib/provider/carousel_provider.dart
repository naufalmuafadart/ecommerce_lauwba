import 'package:ecommerce/repo/api.dart';
import 'package:flutter/material.dart';

import '../model/carousel/ListCarousel.dart';

class CarouselProvider extends ChangeNotifier {
  List<Data>? _dataCarousel;

  List<Data>? get carousel => _dataCarousel;

  bool _isLoading = false;
  bool _isSuccess = false;
  bool _isFailed = false;
  String _message = "";

  bool get loading => _isLoading;
  bool get success => _isSuccess;
  bool get failed => _isFailed;
  String get message => _message;

  fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    _isLoading = true;
    notifyListeners();
    try {
      final data = await Api.getListCarousel();

      _dataCarousel = data.data;
      _isLoading = false;
      _isSuccess = true;
      _message = data.message!;
    } catch(err) {
      _message = err.toString();
      _isLoading = false;
      _isFailed = true;
    }
    notifyListeners();
  }
}
