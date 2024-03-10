import 'dart:convert';

import 'package:ecommerce/model/auth/Login.dart';
import 'package:ecommerce/model/carousel/ListCarousel.dart';
import 'package:ecommerce/model/category/ListCategory.dart';
import 'package:ecommerce/model/product/DetailProduct.dart';
import 'package:ecommerce/model/product/ListProduct.dart';
import 'package:http/http.dart' as http;

import '../model/cart/AddNewCart.dart';
import '../model/cart/ListCart.dart';
import '../model/cart/RemoveCart.dart';
import '../model/cart/UpdateCart.dart';

const baseUrl = "http://192.168.18.191:80/api/";

class Api {
  static Future<ListProduct> getListProduct() async {
    var url = baseUrl + "product";

    // memanggil api dengan base_url yang sudah tertera di variabel url
    final response = await http.get(Uri.parse(url));

    // cek dulu apakah status code pada api adalah 200
    if (response.statusCode == 200) {
      // jika ya, melakukan convert json ke array dart
      // setelah convert, selanjutnya mengembalikan nilai hasil convert
      // print(ListBeritaResponse.fromJson(jsonDecode(response.body)));
      return ListProduct.fromJson(jsonDecode(response.body));
    } else {
      // jika tidak, pesan error akan ditampilkan dalam console
      throw "Failed to get list product";
    }
  }

  static Future<ListCategory> getListCategory() async {
    var url = baseUrl + "category";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return ListCategory.fromJson(jsonDecode(response.body));
    } else {
      throw "Failed to get list carousel";
    }
  }

  static Future<DetailProduct> getDetailProduct(int id) async {
    var url = baseUrl + "product/$id";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return DetailProduct.fromJson(jsonDecode(response.body));
    } else {
      throw "Failed to get list carousel";
    }
  }

  static Future<ListCarousel> getListCarousel() async {
    var url = baseUrl + "carousel";

    final response = await http.get(Uri.parse(url), headers: {
      "Connection": "Keep-Alive",
    });

    if (response.statusCode == 200) {
      return ListCarousel.fromJson(jsonDecode(response.body));
    } else {
      throw "Failed to get list carousel";
    }
  }

  static Future<Login> submitLogin(String email, String password) async {
    Map<String, String> data = {
      'email': email,
      'password': password,
    };
    var url = baseUrl + "login";

    final response = await http.post(Uri.parse(url), body: data);

    if (response.statusCode == 200) {
      final datares = jsonDecode(response.body);
      print('datares :');
      print(datares);
      if (datares['success'] == false) {
        throw datares['message'];
      }
      return Login.fromJson(jsonDecode(response.body));
    } else {
      throw "Failed to login";
    }
  }

  static Future<ListCart> listCart({required int idUser}) async {
    var url = baseUrl + "cart/$idUser";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return ListCart.fromJson(jsonDecode(response.body));
    }

    throw "fetching data cart failed";
  }

  static Future<AddNewCart> addNewCart({required Map<String, dynamic> dataCart}) async {
    var url = baseUrl + "cart-add";
    final response = await http.post(Uri.parse(url), body: dataCart);
    if (response.statusCode == 200) {
      return AddNewCart.fromJson(jsonDecode(response.body));
    }

    throw "add data cart failed";
  }

  static Future<UpdateCart> updateCart({required int qty, required int idCart}) async {
    var url = baseUrl + "cart-update/$idCart";

    final response = await http.put(Uri.parse(url), body: {"quantity": qty.toString()});

    if (response.statusCode == 200) {
      return UpdateCart.fromJson(jsonDecode(response.body));
    }

    throw "update data cart failed";
  }

  static Future<RemoveCart> deleteCart({required int idCart}) async {
    var url = baseUrl + "cart-delete/$idCart";
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      return RemoveCart.fromJson(jsonDecode(response.body));
    }

    throw "delete data cart failed";
  }
}
