import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Strings/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
                SizedBox(height: height * 0.02,),

              ],
            ),
          )
      ),
    );
  }
}
