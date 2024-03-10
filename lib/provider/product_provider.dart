import 'package:ecommerce/repo/api.dart';
import 'package:flutter/material.dart';

import '../model/product/ListProduct.dart' as list;
import '../model/product/DetailProduct.dart' as detail;

class ProductProvider extends ChangeNotifier {
  List<list.Data>? _dataProduct;

  List<list.Data>? get products => _dataProduct;


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
      final data = await Api.getListProduct();

      // ketika sudah mendapatkan response, maka data dari webservice masukan ke dalam variabel
      _dataProduct = data.data;
      _isLoading = false;
      _isSuccess = true;
      _message = 'Fetch data list product success!';
    } catch(err) {
      _message = err.toString();
      _isLoading = false;
      _isFailed = true;
    }
    notifyListeners();
  }
}

class DetailProductProvider extends ChangeNotifier {
  detail.Data? _dataProduct;

  detail.Data? get products => _dataProduct;


  bool _isLoading = false;
  bool _isSuccess = false;
  bool _isFailed = false;
  String _message = "";


  bool get loading => _isLoading;
  bool get success => _isSuccess;
  bool get failed => _isFailed;
  String get message => _message;

  fetchData({required int id}) async {
    await Future.delayed(Duration(seconds: 1));

    // proses pertama, tampilkan loadingnya terlebih dahulu
    _isLoading = true;
    notifyListeners();

    // uji coba perintah request, apakah berhasil atau gagal yang mana error/exception
    // akan dialihkan ke bagian catch()
    try {
      // eksekusi getListProduct kemudian menunggu sampai dapat response
      final data = await Api.getDetailProduct(id);

      // ketika sudah mendapatkan response, maka data dari webservice masukan ke dalam variabel
      _dataProduct = data.data;
      _isLoading = false;
      _isSuccess = true;
      _message = 'Fetch data list product success!';
    } catch(err) {
      _message = err.toString();
      _isLoading = false;
      _isFailed = true;
    }
    notifyListeners();
  }
}
