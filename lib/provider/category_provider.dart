import 'package:ecommerce/repo/api.dart';
import 'package:flutter/material.dart';

import '../model/category/ListCategory.dart';

class CategoryProvider extends ChangeNotifier {
  List<Data>? _dataCategory;

  List<Data>? get categories => _dataCategory;

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

    // proses pertama, tampilkan loadingnya terlebih dahulu
    _isLoading = true;
    notifyListeners();

    // uji coba perintah request, apakah berhasil atau gagal yang mana error/exception
    // akan dialihkan ke bagian catch()
    try {
      // eksekusi getListProduct kemudian menunggu sampai dapat response
      final data = await Api.getListCategory();

      // ketika sudah mendapatkan response, maka data dari webservice masukan ke dalam variabel
      _dataCategory = data.data;
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
