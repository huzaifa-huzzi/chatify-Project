class ChatModel {
  String? id;
  String? message;
  String? senderId;
  String? senderName;
  String? receiverId;
  DateTime? timestamp;

  ChatModel({
    this.id,
    this.message,
    this.senderId,
    this.receiverId,
    this.timestamp,
    this.senderName
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "message": message,
      "senderId": senderId,
      "senderName": senderName,
      "receiverId": receiverId,
      "timestamp": timestamp?.toIso8601String(),
    };
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json["id"],
      message: json["message"],
      senderId: json["senderId"],
      senderName: json["senderName"],
      receiverId: json["receiverId"],
      timestamp: json["timestamp"] != null ? DateTime.parse(json["timestamp"]) : null,
    );
  }
}
