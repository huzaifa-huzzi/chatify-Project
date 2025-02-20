import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/RoundedButton.dart';
import 'package:chatify_app/View/HomePage/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            fillColor: AppColors.backgroundColor,
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            hintText: "Person",
            prefixIcon: Icon(Icons.person),
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
        SizedBox(height: height * 0.04,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: RoundedButton(title: 'SignUp', onTap: (){
            Get.to(() => HomePage());
          }),
        ),
      ],
    );
  }
}
