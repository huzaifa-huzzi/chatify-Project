import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/Utils/Utils.dart';
import 'package:chatify_app/View/HomePage/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _ref = FirebaseDatabase.instance.ref().child('user');

  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  final loading = false.obs;

  void loginFtn(String email,String username,String password,BuildContext context) async{
     loading.value = true;
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value){
        Get.to(() => HomePage());
        SessionManager().setUser(value.user!.uid.toString());
        Utils.snackBar('Login','Login Successful');
        loading.value = false;
        _ref.child(value.user!.uid.toString()).set({
          'username':username,
          'password':password,
          'uid':value.user!.uid.toString(),
          'email':value.user!.email.toString(),
          'returnSecureToken':true,

        }).then((value){
          loading.value = false;
        }).onError((error, stackTrace){
          Utils.toastMessage(error.toString());
          loading.value = false;
        });
      }).onError((error, stackTrace){
        Utils.toastMessage(error.toString());
        loading.value = false;
      });

    }catch(e){
      Utils.toastMessage(e.toString());
      loading.value = false;
    }


  }


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}