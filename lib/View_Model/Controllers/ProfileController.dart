import 'dart:io';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chatify_app/Utils/Utils.dart';

class ProfileController extends GetxController {
  var isEditing = false.obs;
  var name = ''.obs;
  var bio = ''.obs;
  Rxn<File> image = Rxn<File>();
  var isLoading = false.obs;

  final DatabaseReference _ref = FirebaseDatabase.instance.ref('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ImagePicker picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Update Profile
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

  /// fetching media from the gallery
  Future<void> getGalleryImage() async {
    try {
      final pickedFile = await picker.pickImage(
          source: ImageSource.gallery, imageQuality: 100);

      if (pickedFile != null) {
        image.value = File(pickedFile.path);
      } else {
        Get.snackbar('No Image', 'No image selected');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  /// Image uploading
  Future<void> uploadImage() async {
    if (image.value == null) {
      Get.snackbar('Error', 'Please select an image first.');
      return;
    }

    isLoading.value = true;

    try {
      // Step 1: Upload the image to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('ProfilePicture/${SessionManager().userId.toString()}');

      // Upload the image to Firebase Storage
      UploadTask uploadTask = storageRef.putFile(image.value!);

      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

      // Step 2: Get the download URL of the uploaded image
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Step 3: Store the download URL in Firestore
      await _firestore.collection('users').doc(SessionManager().userId.toString()).set({
        'profileImage': downloadUrl,
        'timestamp': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      if (kDebugMode) {
        print('Image uploaded successfully to Firestore.');
      }

      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      if (kDebugMode) {
        print('Error uploading image: $error');
      }
      Get.snackbar('Upload Failed', 'Error uploading image: $error');
    }
  }


}
