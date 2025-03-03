import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/RoundedButton.dart';
import 'package:chatify_app/View/HomePage/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBox(height:  height * 0.01,),
        TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: AppColors.backgroundColor,
            filled: true,
            hintText: "Email",
            prefixIcon: Icon(Icons.alternate_email_rounded),
          ),
        ),
        SizedBox(height: height * 0.02,),
        TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: AppColors.backgroundColor,
            filled: true,
            hintText: "Password",
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),
        SizedBox(height: height * 0.03,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: RoundedButton(title: 'Login', onTap: (){
            Get.to(() => HomePage());
          }),
        ),
      ],
    );
  }
}
