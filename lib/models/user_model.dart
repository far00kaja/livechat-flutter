class UserModel {
  // int id;
  String username;
  // String email;
  // String password;

  UserModel({
    // this.id,
    this.username,
    // this.email,
    // this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    username = json['username'];
    // email = json['email'];
    // password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username
      // 'email': email,
      // 'password': password,
    };
  }
}
