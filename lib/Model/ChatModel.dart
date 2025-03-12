class ChatModel {
  String id;
  String message;
  String senderName;
  String senderId;
  String receiverId;
  String timestamp;
  String readStatus;
  String imageUrl;
  String videoUrl;
  String audioUrl;
  String documentUrl;
  List<String> reactions;
  String replies;

  ChatModel({
    required this.id,
    required this.message,
    required this.senderName,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
    required this.readStatus,
    required this.imageUrl,
    required this.videoUrl,
    required this.audioUrl,
    required this.documentUrl,
    required this.reactions,
    required this.replies,
  });

  // Factory constructor to create an instance from a map (e.g., from Firestore or Firebase)
  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] ?? '',
      message: map['message'] ?? '',
      senderName: map['senderName'] ?? '',
      senderId: map['senderId'] ?? '',
      receiverId: map['receiverId'] ?? '',
      timestamp: map['timestamp'] ?? '',
      readStatus: map['readStatus'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      audioUrl: map['audioUrl'] ?? '',
      documentUrl: map['documentUrl'] ?? '',
      reactions: List<String>.from(map['reactions'] ?? []),
      replies: map['replies'] ?? '',
    );
  }

  // Method to convert the model instance back to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'senderName': senderName,
      'senderId': senderId,
      'receiverId': receiverId,
      'timestamp': timestamp,
      'readStatus': readStatus,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'audioUrl': audioUrl,
      'documentUrl': documentUrl,
      'reactions': reactions,
      'replies': replies,
    };
  }
}
