import 'package:chatify_app/View/HomePage/HomeScreen.dart';
import 'package:chatify_app/View/SplashScreen/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Services {


  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    Future.delayed(Duration.zero, () {
      if(user != null){
        Get.to(() =>const  HomePage(),duration:const  Duration(seconds: 3));
      }else{
        Get.to(() => const  SplashScreen());
      }
    });
  }





}