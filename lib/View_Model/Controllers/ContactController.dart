import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var userList = <Map<String, dynamic>>[].obs; // List to store user data

  @override
  void onInit() {
    super.onInit();
    fetchUsers(); // Fetch users on controller initialization
  }

  void fetchUsers() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users");

    ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      if (data != null && data is Map) {
        userList.clear();
        data.forEach((key, value) {
          if (value is Map) {
            userList.add({
              "id": key,
              "name": value["name"] ?? "Unknown",
              "status": value["status"] ?? "Hey there! I am using Chatify",
              "image": value["profilePic"] ?? "",
            });
          }
        });
      }
    });
  }
}
