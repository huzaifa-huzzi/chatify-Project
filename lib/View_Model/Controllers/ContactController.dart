import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  RxBool isSearchEnabled = false.obs;
  RxList<Map<dynamic, dynamic>> users = <Map<dynamic, dynamic>>[].obs;
  RxList<Map<dynamic, dynamic>> filteredUsers = <Map<dynamic, dynamic>>[].obs;
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('user');

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

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
}
