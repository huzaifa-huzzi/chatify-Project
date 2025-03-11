import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/Utils/Utils.dart';
import 'package:chatify_app/View/HomePage/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';



class SignUpController extends GetxController {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref().child('user');

  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  final emailFocus = FocusNode().obs;
  final usernameFocus = FocusNode().obs;
  final passwordFocus = FocusNode().obs;

  RxBool loading = false.obs;

  void signUpFtn(String email, String username, String password, BuildContext context) async {
    loading.value = true;
    try {
      if (password.length < 6) {
        Utils.toastMessage("Password must be at least 6 characters long");
        loading.value = false;
        return;
      }

      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) async {
        String userId = value.user!.uid.toString();
        String createdAt = DateFormat('h:mm a').format(DateTime.now());

        SessionManager().setUser(userId);

        // Store user details
        await ref.child(userId).set({
          'uid': userId,
          'email': email,
          'username': username,
          'returnSecureToken': true,
          'createdAt': createdAt, // Save timestamp
        });

        // Store user in chats node
        await FirebaseDatabase.instance.ref('chats/$userId').set({
          'uid': userId,
          'username': username,
          'lastLogin': createdAt,
          'imageurl': "", // Default empty image
        });

        Utils.snackBar('Signup', 'Signup successful');
        Get.off(() => const HomePage());
      }).catchError((error) {
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      Utils.toastMessage("An unexpected error occurred: ${e.toString()}");
    } finally {
      loading.value = false;
    }
  }



  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailFocus.value.dispose();
    usernameFocus.value.dispose();
    passwordFocus.value.dispose();
    super.onClose();
  }
}