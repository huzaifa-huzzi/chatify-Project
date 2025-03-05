import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/Utils/Utils.dart';
import 'package:chatify_app/View/HomePage/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



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

        SessionManager().setUser(value.user!.uid.toString());

        await ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': email,
          'username': username,
          'returnSecureToken': true,
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