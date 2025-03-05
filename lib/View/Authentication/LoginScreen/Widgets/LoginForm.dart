import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/RoundedButton.dart';
import 'package:chatify_app/View_Model/Controllers/LoginController.dart';
import 'package:chatify_app/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _userFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: height * 0.01),
          TextFormField(
            controller: loginController.emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocus,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              fillColor: AppColors.backgroundColor,
              filled: true,
              hintText: "Email",
              prefixIcon: Icon(Icons.alternate_email_rounded),
            ),
            validator: Utils().validateEmail,
            onFieldSubmitted: (_) {
              Utils.fieldFocusChange(context, _emailFocus, _passwordFocus);
            },
          ),
          SizedBox(height: height * 0.02),
          TextFormField(
            controller: loginController.passwordController,
            obscureText: true,
            focusNode: _passwordFocus,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              fillColor: AppColors.backgroundColor,
              filled: true,
              hintText: "Password",
              prefixIcon: Icon(Icons.password_outlined),
            ),
            validator: Utils().validatePassword,
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: Obx(() => RoundedButton(
              title: 'Login',
              loading: loginController.loading.value,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  loginController.login(
                    loginController.emailController.text.trim(),
                    loginController.passwordController.text.trim(),
                    context
                  );
                } else {
                  Utils.toastMessage("Please fill the form correctly!");
                }
              },
            )),
          ),
        ],
      ),
    );
  }
}
