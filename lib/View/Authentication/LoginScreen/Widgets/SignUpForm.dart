import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/RoundedButton.dart';
import 'package:chatify_app/View_Model/Controllers/SignUpController.dart';
import 'package:chatify_app/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final signUpController = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: signUpController.usernameController,
            focusNode: _usernameFocus,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              fillColor: AppColors.backgroundColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              hintText: "Username",
              prefixIcon: const Icon(Icons.person),
            ),
            validator: (value) =>
            value!.isEmpty ? "Username cannot be empty" : null,
            onFieldSubmitted: (_) {
              Utils.fieldFocusChange(context, _usernameFocus, _emailFocus);
            },
          ),
          SizedBox(height: height * 0.02),
          TextFormField(
            controller: signUpController.emailController,
            focusNode: _emailFocus,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: AppColors.backgroundColor,
              filled: true,
              hintText: "Email",
              prefixIcon: const Icon(Icons.alternate_email_rounded),
            ),
            validator: Utils().validateEmail,
            onFieldSubmitted: (_) {
              Utils.fieldFocusChange(context, _emailFocus, _passwordFocus);
            },
          ),
          SizedBox(height: height * 0.02),
          TextFormField(
            controller: signUpController.passwordController,
            focusNode: _passwordFocus,
            obscureText: true,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: AppColors.backgroundColor,
              filled: true,
              hintText: "Password",
              prefixIcon: const Icon(Icons.password_outlined),
            ),
            validator: Utils().validatePassword,
          ),
          SizedBox(height: height * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: Obx(() => RoundedButton(
              title: 'SignUp',
              loading: signUpController.loading.value,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  signUpController.signUpFtn(
                    signUpController.emailController.text.trim(),
                    signUpController.usernameController.text.trim(),
                    signUpController.passwordController.text.trim(),
                    context,
                  );
                }else{
                  Utils.toastMessage('Please fill the form correctly!');
                }
              },
            )),
          ),
        ],
      ),
    );
  }
}
