import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:flutter/material.dart';


var lightTheme = ThemeData();
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

  )
);