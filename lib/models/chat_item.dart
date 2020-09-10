import 'dart:core';

class ChatItem {
  String name;
  String imageUrl;
  int unRead;
  DateTime dateTime;
  String lastMsg;
  //temprorr
  bool isMe;

  ChatItem({
    this.isMe,
    this.dateTime,
    this.imageUrl,
    this.name,
    this.lastMsg,
    this.unRead
});


}