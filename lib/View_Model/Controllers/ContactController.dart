import 'package:chatify_app/Model/ChatRoomModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';


class ContactController extends GetxController {
  RxBool isSearchEnabled = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  RxList<Map<dynamic, dynamic>> users = <Map<dynamic, dynamic>>[].obs;
  RxList<Map<dynamic, dynamic>> filteredUsers = <Map<dynamic, dynamic>>[].obs;
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('user');
  final db = FirebaseFirestore.instance;
  RxList<ChatRoomModel> chatRoomList =  <ChatRoomModel>[].obs;


  @override
  void onInit()async {
    super.onInit();
    fetchUsers();
    await getChatRoomList();
  }

  /// For the Search of the users

  void toggleSearch() {
    isSearchEnabled.value = !isSearchEnabled.value;
  }
  void fetchUsers() {
    _ref.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> data = event.snapshot.value as Map<dynamic, dynamic>;
        users.assignAll(data.values.map((user) => Map<dynamic, dynamic>.from(user)).toList());
        filteredUsers.assignAll(users);
      }
    });
  }
  void filterUsers(String query) {
    if (query.isEmpty) {
      filteredUsers.assignAll(users);
    } else {
      filteredUsers.assignAll(
        users.where((user) => user['username'].toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
  void resetFilter() {
    filteredUsers.assignAll(users);
  }


  /// getting chatRoomList
  Future<void> getChatRoomList() async {
    List<ChatRoomModel> tempChatRoomList = [];
 await db.collection('chats').get().then((value){
   tempChatRoomList = value.docs.map((e) => ChatRoomModel.fromJson(e.data())).toList();
 });
 chatRoomList.value = tempChatRoomList.where((e) => e.id!.contains(auth.currentUser!.uid)).toList();

  }



}
