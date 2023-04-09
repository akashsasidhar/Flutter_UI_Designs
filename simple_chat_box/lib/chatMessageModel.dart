import 'package:flutter/cupertino.dart';

class ChatMessage {
  String messageContent;
  String messageType;

  var amt;

  var exttime;
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      required this.amt,
      required this.exttime});
}
