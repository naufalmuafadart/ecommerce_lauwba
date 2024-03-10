import 'package:ecommerce/repo/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth/Login.dart';

const EMAIL = 'email';
const USERID = 'user_id';
const FULLNAME = 'fullname';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  int? _userId;
  String? _fullname;
  String? _email;

  int? get id => _userId;
  String? get fullname => _fullname;
  String? get email => _email;

  bool _isLoading = false;

  SharedPreferences? _pref;

  resetValue() {
    _userId = 0;
    _fullname = "";
    _email = "";
  }

  //cek apakah user sudah login.....
  Future checkLoggedIn() async {
    _pref = await SharedPreferences.getInstance();

    bool userID = _pref!.containsKey(USERID);
    bool fullname = _pref!.containsKey(FULLNAME);
    bool email = _pref!.containsKey(EMAIL);

    if (userID && email && fullname) {
      _isLoggedIn = true;
      //masukin lagi data user dari db local ke providernya
      await _getPref();

      notifyListeners();
      return;
    } else {
      _isLoggedIn = false;
      resetValue();

      notifyListeners();
      return;
    }
  }

  // store data user ke presistant storage/ sql lite
  Future savePref({
    required int userID,
    required String fullname,
    required String email,
  }) async {
    _pref = await SharedPreferences.getInstance();
    _pref!.setInt(USERID, userID);
    _pref!.setString(FULLNAME, fullname);
    _pref!.setString(EMAIL, email);
    await checkLoggedIn();
    notifyListeners();
    return;
  }

  //menghapus semua data user yang ada di shared prederence
  destroyPref() async {
    _isLoading = true;
    notifyListeners();
    _pref = await SharedPreferences.getInstance();
    await _pref?.clear();
    //cuma jeda aja, biar keliatan banget sama loadingnya...
    await Future.delayed(const Duration(seconds: 2));
    checkLoggedIn();
    _isLoading = false;
    notifyListeners();
  }

  //mengambil data dari shared preference
  //jangan cuma eksekusi ini, harus melalui checkLoggedIn!
  Future _getPref() async {
    _pref = await SharedPreferences.getInstance();
    if (_isLoggedIn) {
      _userId = _pref!.getInt(USERID)!;
      _fullname = _pref!.getString(FULLNAME)!;
      _email = _pref!.getString(EMAIL)!;
      notifyListeners();
    }
    return;
  }
}

class LoginProvider extends ChangeNotifier {
  Data? _dataUser;

  Data? get user => _dataUser;

  bool _isLoading = false;
  bool _isSuccess = false;
  bool _isFailed = false;
  String _message = "";

  bool get loading => _isLoading;

  bool get success => _isSuccess;

  bool get failed => _isFailed;

  String get message => _message;

  reset(){
    _isLoading = false;
    _isSuccess = false;
    _isFailed = false;
    _message = "";
    notifyListeners();
  }

  submit({required String email, required String password}) async {
    _isLoading = true;
    _isSuccess = false;
    _isFailed = false;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    try {
      final data = await Api.submitLogin(email, password);
      if (data.success == false) {
        throw data.message!;
      }

      _dataUser = data.data;

      // Masukkan data user ke shared preferences
      AuthProvider auth = AuthProvider();
      auth.savePref(
        userID: data.data!.userId!.toInt(),
        fullname: data.data!.fullname!,
        email: data.data!.email!,
      );

      _isLoading = false;
      _isSuccess = true;
      _message = data.message!;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      _message = err.toString();
      _isLoading = false;
      _isFailed = true;
      notifyListeners();
    }

    notifyListeners();
  }
}
