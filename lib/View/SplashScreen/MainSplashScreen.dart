import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Services/SplashScreensServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({super.key});

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {

  Services splashScreen = Services();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetImages.appIconSvg,
              height: height * 0.2,
              width: width * 0.4,
            ),
            SizedBox(height: height * 0.03),
            Text(
              "Chatify",
              style: TextStyle(
                fontSize: width * 0.1,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Poppins"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
