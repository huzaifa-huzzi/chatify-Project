import 'package:chatify_app/Model/ChatModel.dart';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';




class ChatController extends GetxController {

  final auth = FirebaseAuth.instance ;
  final db = FirebaseFirestore.instance;
  RxBool loading = false.obs;
  var uuid = Uuid();
  
  
  String getRoomId(String targetUserId){
    {
      String currentUserId = auth.currentUser!.uid;
      if(currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)){
         return currentUserId + targetUserId ;
      }else{
         return targetUserId + currentUserId;
      }
    }

  }

  /// Send messages
  Future<void> sendMessages(String targetUserId, String message) async {
    loading.value = true;
    String chatId = uuid.v6();
    String roomId = getRoomId(targetUserId);
    String currentUserId = auth.currentUser!.uid;

    try {

      DatabaseReference userRef = FirebaseDatabase.instance.ref('user/$currentUserId');
      DataSnapshot snapshot = await userRef.get();

      if (snapshot.exists) {
        Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;
        String senderName = userData?["name"] ?? "Unknown";

        var newChat = ChatModel(
          id: chatId,
          senderId: currentUserId,
          receiverId: targetUserId,
          message: message,
          senderName: senderName,
          timestamp: DateTime.now(),
        );

        await db.collection("chats")
            .doc(roomId)
            .collection("messages")
            .doc(chatId)
            .set(newChat.toJson());
      } else {
        print("Sender's name not found!");
      }
    } catch (e) {
      print("Error fetching sender's name: $e");
    }

    loading.value = false;
  }
  /// Get message





}