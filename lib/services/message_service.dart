import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/models/message_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessageByUser({String agentroom}) {
    try {
      return firestore
          .collection('messages')
          .where('roomchat', isEqualTo: agentroom)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data());
        }).toList();
        result.sort((MessageModel a, MessageModel b) =>
            a.createdAt.compareTo(b.createdAt));
        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage(
      {String userFrom, String userTo, String message}) async {
    try {
      firestore.collection('messages').add({
        'userFrom': userFrom,
        'userTo': userTo,
        'message': message,
        'roomchat': 'agentroom',
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print('Pesan berhasil dikirim'),
      );
    } catch (e) {
      throw Exception('pesan gagal dikriim');
    }
  }
}
