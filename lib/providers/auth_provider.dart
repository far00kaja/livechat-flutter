import 'package:flutter/material.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> join({
    String username,
  }) async {
    try {
      UserModel user = await AuthService().join(
        username: username,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<bool> login({
  //   String email,
  //   String password,
  // }) async {
  //   try {
  //     UserModel user = await AuthService().login(
  //       email: email,
  //       password: password,
  //     );

  //     _user = user;
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
