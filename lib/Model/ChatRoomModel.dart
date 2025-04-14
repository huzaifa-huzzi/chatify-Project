
class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? receiver;
  List<MessageModel>? messages;
  int? unReadMessNo;
  String? lastMessage;
  DateTime? lastMessageTimeStamp;
  DateTime? timeStamp;

  ChatRoomModel({
    this.id,
    this.sender,
    this.receiver,
    this.messages,
    this.unReadMessNo,
    this.lastMessage,
    this.lastMessageTimeStamp,
    this.timeStamp,
  });

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModel(
      id: json['id'],
      sender: json['sender'] != null ? UserModel.fromJson(json['sender']) : null,
      receiver: json['receiver'] != null ? UserModel.fromJson(json['receiver']) : null,
      messages: json['messages'] != null
          ? (json['messages'] as List).map((e) => MessageModel.fromJson(e)).toList()
          : [],
      unReadMessNo: json['unReadMessNo'],
      lastMessage: json['lastMessage'],
      lastMessageTimeStamp: json['lastMessageTimeStamp'] != null
          ? DateTime.parse(json['lastMessageTimeStamp'])
          : null,
      timeStamp: json['timeStamp'] != null ? DateTime.parse(json['timeStamp']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender?.toJson(),
      'receiver': receiver?.toJson(),
      'messages': messages?.map((e) => e.toJson()).toList(),
      'unReadMessNo': unReadMessNo,
      'lastMessage': lastMessage,
      'lastMessageTimeStamp': lastMessageTimeStamp?.toIso8601String(),
      'timeStamp': timeStamp?.toIso8601String(),
    };
  }
}


class UserModel {

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class MessageModel {

  MessageModel();

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
