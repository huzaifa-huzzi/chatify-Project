import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/Utils/Utils.dart';
import 'package:chatify_app/View/HomePage/HomeScreen.dart';
import 'package:chatify_app/View/chatPage/ChatPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _ref = FirebaseDatabase.instance.ref().child('user');

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  final loading = false.obs;

  void login(String email, String password,String username,BuildContext context) async {
    loading.value = true;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        SessionManager().setUser(userCredential.user!.uid.toString());
        await _ref.child(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
          'username' : username,
        });
        loading.value = false;
        Get.to(() => const HomePage());
        Utils.snackBar('Login', 'Login Successful');
      } else {
        loading.value = false;
        Utils.snackBar('Error', 'Login failed. Please try again.');
      }
    } catch (e) {
      loading.value = false;
      Utils.toastMessage( 'Login failed: $e');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}