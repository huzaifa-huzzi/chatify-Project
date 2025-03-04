import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isEditing = false.obs;
  var name = "Nitish Kumar".obs;
  var bio = "I am Groot".obs;
  var email = "Nitishr833@gmail.com".obs;

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