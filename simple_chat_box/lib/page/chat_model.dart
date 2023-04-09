// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  String amt;
  String exttime;
  ChatMessage({
    required this.messageContent,
    required this.messageType,
    required this.amt,
    required this.exttime,
  });
}
