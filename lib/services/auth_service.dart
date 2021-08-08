import 'dart:convert';

import 'package:shamo/models/user_model.dart';

class AuthService {
  Future<UserModel> join({
    String username,
  }) async {
    var body = jsonEncode({
      'username': username,
    });
    // var data =jsonDecode(respons)
    var data = jsonDecode(body);
    UserModel user = UserModel.fromJson(data);
    return user;
  }
}
