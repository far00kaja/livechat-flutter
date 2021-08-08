class MessageModel {
  String userFrom;
  String userTo;
  String message;
  // bool isFromUser;
  DateTime createdAt;
  DateTime updatedAt;

  MessageModel({
    this.message,
    this.userFrom,
    this.userTo,
    this.createdAt,
    this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userFrom = json['userFrom'];
    userTo = json['userTo'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }
}
