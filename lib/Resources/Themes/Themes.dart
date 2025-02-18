import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:flutter/material.dart';

 /// Light Theme
var lightTheme = ThemeData();
 /// Dark Theme
var darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary:AppColors.primaryColor ,
    onPrimary:AppColors.donBackgroundColor ,
     background: AppColors.backgroundColor,
     onBackground: AppColors.donBackgroundColor,
     primaryContainer: AppColors.dContainerColor,
     onPrimaryContainer: AppColors.donContainerColor

  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(fontSize: 32,color: AppColors.primaryColor,fontFamily: "Poppins",fontWeight: FontWeight.w800),
    headlineMedium: TextStyle(fontSize: 30,color: AppColors.donBackgroundColor,fontFamily: "Poppins",fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontSize: 20,color: AppColors.donBackgroundColor,fontFamily: "Poppins",fontWeight: FontWeight.bold),

  )
);