import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Strings/Strings.dart';
import 'package:chatify_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top: height * 0.1),
            child: Column(
              children: [
                 /// Logo and App Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetImages.appIconSvg,colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),)
                  ],
                ),
                SizedBox(height: height * 0.02,),
                Text(AppString.appName,style: Theme.of(context).textTheme.headlineLarge,),
                /// Boy and Girl Pic
                SizedBox(height: height * 0.1,),
                Padding(
                  padding:  EdgeInsets.only(left: width * 0.2),
                  child: Row(
                    children: [
                      Image.asset(AssetImages.boyPic),
                      SvgPicture.asset(AssetImages.connect),
                      Image.asset(AssetImages.girlPic),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.01,),
                Text(SplashScreenTexts.nowYouAre,style: Theme.of(context).textTheme.headlineMedium,),
                Text(SplashScreenTexts.connected,style: Theme.of(context).textTheme.headlineLarge,),
                SizedBox(height: height * 0.02,),
                Text(SplashScreenTexts.description,style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
                /// Sliding Button
                SizedBox(height: height * 0.1,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: SlideAction(
                    onSubmit: (){
                      Get.to(() => LoginScreen(),transition: Transition.leftToRight,);
                    },
                    sliderButtonIcon: SvgPicture.asset(AssetImages.plug,width: 25,),
                    sliderRotate: false,
                    text: SplashScreenTexts.buttonTexts,
                    submittedIcon: SvgPicture.asset(AssetImages.connect,width: 25,),
                    innerColor: Theme.of(context).colorScheme.primary,
                    outerColor: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
