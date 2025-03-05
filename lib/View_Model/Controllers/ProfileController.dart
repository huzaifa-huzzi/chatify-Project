import 'package:chatify_app/Utils/Utils.dart';
import 'package:chatify_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isEditing = false.obs;
  var name = ''.obs;
  var bio = ''.obs;


  void toggleEditMode() {
    isEditing.value = !isEditing.value;
  }

  void saveChanges(String newName, String newBio) {
    name.value = newName;
    bio.value = newBio;
    isEditing.value = false;
  }

}