import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:chatify_app/Utils/Utils.dart';

class ProfileController extends GetxController {
  var isEditing = false.obs;
  var name = ''.obs;
  var bio = ''.obs;

  final DatabaseReference _ref = FirebaseDatabase.instance.ref('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateProfile(String key, String value) {
    if (key == "username") {
      _ref.child(_auth.currentUser!.uid).update({key: value}).then((_) {
        Utils.snackBar("Success", "Username updated successfully");
      }).catchError((error) {
        Utils.toastMessage("Error updating username: $error");
      });
    } else if (key == "bio") {
      bio.value = value;
      Utils.snackBar("Success", "Bio updated successfully");
    }
  }
}
