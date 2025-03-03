import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Strings/Strings.dart';
import 'package:chatify_app/View/Authentication/LoginScreen/Widgets/LoginForm.dart';
import 'package:chatify_app/View/Authentication/LoginScreen/Widgets/SignUpForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  RxBool isLogin = true.obs;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.1),
          child: Column(
            children: [
              /// Logo and AppName
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetImages.appIconSvg,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Text(
                AppString.appName,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: height * 0.04),
              /// TextFormFields and Tabs
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: Obx(
                      () => AnimatedSize(
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      height: isLogin.value ? height * 0.5 : height * 0.55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: Column(
                        children: [
                          /// Login & SignUp Tabs
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => isLogin.value = true,
                                child: Column(
                                  children: [
                                    Text(
                                      'Login',
                                      style: isLogin.value
                                          ? Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                      )
                                          : Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      width: isLogin.value ? width * 0.25 : 0,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => isLogin.value = false,
                                child: Column(
                                  children: [
                                    Text(
                                      'Signup',
                                      style: !isLogin.value
                                          ? Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                      )
                                          : Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      width: !isLogin.value ? width * 0.25 : 0,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.04),
                          isLogin.value ? const LoginForm() : const SignUpForm(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}