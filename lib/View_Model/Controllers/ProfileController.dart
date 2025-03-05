import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isEditing = false.obs;
  var name = ''.obs;
  var bio = ''.obs;
  var email = ''.obs;

  void toggleEditMode() {
    isEditing.value = !isEditing.value;
  }

  void saveChanges(String newName, String newBio, String newEmail) {
    name.value = newName;
    bio.value = newBio;
    email.value = newEmail;
    isEditing.value = false;
  }
}