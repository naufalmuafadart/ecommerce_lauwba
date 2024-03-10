import 'package:flutter/material.dart';

import '../model/cart/ListCart.dart';
import '../repo/api.dart';

// LIST CART
class ListCartProvider extends ChangeNotifier{

  List<Data> _listCart = [];
  List<Data> get listCart => _listCart;

  int _cartID = 0;
  int get cartID => _cartID;

  bool _updateExistingCart = false;
  bool get updateCart => _updateExistingCart;

  bool _isLoading = false;
  bool _isSuccess = false;
  bool _isFailed = false;
  String _message = "";

  bool get loading => _isLoading;
  bool get success => _isSuccess;
  bool get failed => _isFailed;
  String get message => _message;

  reasonToUpdate({required bool status}){
    _updateExistingCart = status;
    notifyListeners();
  }

  // menampilkan list cart berdasarkan user id
  // data yang dapat dipanggil nanti bisa masuk ke atribut listCart
  Future getListCart({
    required int userId,
  }) async {
    //tampilkan loading
    _isLoading = true;
    notifyListeners();

    //lakukan percobaan login
    try {
      final res = await Api.listCart(idUser: userId);
      if(res.success!){
        _listCart = res.data!;
      }

      //jika sukses maka muncul pesan sukses
      _isSuccess = true;
      _message = res.message!;
    } catch (err) {
      //jika error maka muncul pesan error
      _isFailed = true;
      _message = err.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  resetAll(){
    _isLoading = false;
    _isSuccess = false;
    _isFailed = false;
    _message = "";
    _listCart = [];
    notifyListeners();
  }
}

// QUANTITY
class CartQuantity extends ChangeNotifier{
  int _qty = 1;
  int _price = 0;
  int _totalPrice = 0;
  int _stock = 0;


  int get qty => _qty;
  int get price => _price;
  int get total => _totalPrice;
  int get stock => _stock;

  // quantity=======
  // memberikan nilai awal dari stok dan price
  setQty({required int nstock, required int nprice})async{
    await Future.delayed(Duration(seconds: 1));
    _stock = nstock;
    _price = nprice;
    notifyListeners();
  }

  //menambahkan quantity
  addQty() {
    if (_qty < _stock) {
      _qty++;
      _totalPrice = _price * _qty;
      notifyListeners();
    }
  }

  //mengurangi quantity
  removeQty() {
    if (_qty >= 0) {
      _qty--;
      _totalPrice = _price * _qty;
      notifyListeners();
    }
  }
  // =======

  //reset semuanya
  //ini cuma berlaku pada saat kembali ke halaman sebelumnya dari halaman product detail
  resetAll(){
    _qty = 0;
    _totalPrice = 0;
    _stock = 0;
    _price = 0;
    notifyListeners();
  }
}

// ADD CART
class NewCartProvider extends ChangeNotifier{

  bool _isLoading = false;
  bool _isSuccess = false;
  bool _isFailed = false;
  String _message = "";

  bool get loading => _isLoading;
  bool get success => _isSuccess;
  bool get failed => _isFailed;
  String get message => _message;

  // menambahkan data ke cart
  // userid, productid, qty
  Future addToCart({
    required int userId,
    required int productId,
    required int qty,

  }) async {
    //tampilkan loading
    _isLoading = true;
    notifyListeners();

    //kelompokan data menjadi 1 koleksi array
    Map<String, dynamic> dataCart = {
      "user_id": userId.toString(),
      "product_id": productId.toString(),
      "qty": qty.toString(),
    };

    //lakukan percobaan login
    try {
      final res = await Api.addNewCart(dataCart: dataCart);
      //jika sukses maka muncul pesan sukses
      _isSuccess = true;
      _message = res.message!;
    } catch (err) {
      //jika error maka muncul pesan error
      _isFailed = true;
      _message = err.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  resetAll(){
    _isLoading = false;
    _isSuccess = false;
    _isFailed = false;
    _message = "";
    notifyListeners();
  }
}

// UPDATE CART
class UpdateCartProvider extends ChangeNotifier{

  bool _isLoading = false;
  bool _isSuccess = false;
  bool _isFailed = false;
  String _message = "";

  bool get loading => _isLoading;
  bool get success => _isSuccess;
  bool get failed => _isFailed;
  String get message => _message;

  //mengubah salah satu dari cartnya
  // data yang dibutuhkan : cartid, qty, userid
  Future updateToCart({
    required int cartID,
    required int qty,
    required int userID,
  }) async {
    //tampilkan loading
    _isLoading = true;
    notifyListeners();

    //lakukan percobaan login
    try {
      final res = await Api.updateCart(qty: qty, idCart: cartID);

      // ambil data keranjang lagi
      final dataCart = ListCartProvider();
      await dataCart.getListCart(userId: userID);

      //jika sukses maka muncul pesan sukses
      _isSuccess = true;
      _message = res.message!;
    } catch (err) {
      //jika error maka muncul pesan error
      _isFailed = true;
      _message = err.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  resetAll(){
    _isLoading = false;
    _isSuccess = false;
    _isFailed = false;
    _message = "";
    notifyListeners();
  }
}

// DELETE CART
class DeleteCartProvider extends ChangeNotifier{

  bool _isLoading = false;
  bool _isSuccess = false;
  bool _isFailed = false;
  String _message = "";

  bool get loading => _isLoading;
  bool get success => _isSuccess;
  bool get failed => _isFailed;
  String get message => _message;

  //menghapus data cartnya
  // data yang dibutuhkan : userid, cartid
  Future deleteCart({
    required int cartID,
    required int userID,
  }) async {
    //tampilkan loading
    _isLoading = true;
    notifyListeners();

    //lakukan percobaan login
    try {
      final res = await Api.deleteCart(idCart: cartID);

      // ambil data keranjang lagi
      final dataCart = ListCartProvider();
      await dataCart.getListCart(userId: userID);
      //jika sukses maka muncul pesan sukses
      _isSuccess = true;
      _message = res.message!;
    } catch (err) {
      //jika error maka muncul pesan error
      _isFailed = true;
      _message = err.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  resetAll(){
    _isLoading = false;
    _isSuccess = false;
    _isFailed = false;
    _message = "";
  }
}
