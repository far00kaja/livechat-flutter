import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatBubble extends StatelessWidget {
  // const ChatBubble({ Key? key }) : super(key: key);

  String text;
  bool isSender;

  ChatBubble({this.isSender = false, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isSender ? 12 : 0),
                  topRight: Radius.circular(isSender ? 0 : 12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                color: isSender ? backgroundColor5 : backgroundColor4,
              ),
              child: Text(
                text,
                style: primaryTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
