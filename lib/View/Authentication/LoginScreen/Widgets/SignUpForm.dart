import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/RoundedButton.dart';
import 'package:chatify_app/View_Model/Controllers/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        TextField(
          controller: signUpController.usernameController,
          focusNode: signUpController.usernameFocus.value,
          decoration: InputDecoration(
            fillColor: AppColors.backgroundColor,
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            hintText: "Username",
            prefixIcon: const Icon(Icons.person),
          ),
        ),
        SizedBox(height: height * 0.02),
        TextField(
          controller: signUpController.emailController,
          focusNode: signUpController.emailFocus.value,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: AppColors.backgroundColor,
            filled: true,
            hintText: "Email",
            prefixIcon: const Icon(Icons.alternate_email_rounded),
          ),
        ),
        SizedBox(height: height * 0.02),
        TextField(
          controller: signUpController.passwordController,
          focusNode: signUpController.passwordFocus.value,
          obscureText: true,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: AppColors.backgroundColor,
            filled: true,
            hintText: "Password",
            prefixIcon: const Icon(Icons.password_outlined),
          ),
        ),
        SizedBox(height: height * 0.04),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Obx(() => RoundedButton(
            title: signUpController.loading.value ? 'Signing Up...' : 'Sign Up',
            onTap: signUpController.loading.value
                ? () {} //
                : () {
              signUpController.signUpFtn(
                signUpController.emailController.text.trim(),
                signUpController.usernameController.text.trim(),
                signUpController.passwordController.text.trim(),
                context,
              );
            },
          )),
        ),
      ],
    );
  }
}
