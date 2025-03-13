import 'dart:io';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  final ImagePicker picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Update Profile
  void updateProfile(String key, String value) {
    if (SessionManager().userId!.isNotEmpty) {
      FirebaseDatabase.instance
          .ref('user/${SessionManager().userId}')
          .update({key: value}).then((_) {
        Utils.snackBar("Success", "$key updated successfully");
      }).catchError((error) {
        Utils.snackBar("Error", "Failed to update $key");
      });
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

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('ProfilePicture/${SessionManager().userId.toString()}');


      UploadTask uploadTask = storageRef.putFile(image.value!);

      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);


      String downloadUrl = await snapshot.ref.getDownloadURL();


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
