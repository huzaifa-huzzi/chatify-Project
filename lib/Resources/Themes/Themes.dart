import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:flutter/material.dart';

/// Light Theme
var lightTheme = ThemeData();

/// Dark Theme
var darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primaryColor,
    onPrimary: AppColors.donBackgroundColor,
    background: AppColors.backgroundColor,
    onBackground: AppColors.donBackgroundColor,
    primaryContainer: AppColors.dContainerColor,
    onPrimaryContainer: AppColors.donContainerColor,
    surface: AppColors.backgroundColor, // Alternative for general background
    onSurface: AppColors.donBackgroundColor, // Text/icons on surfaces
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor, // Main page background
  cardColor: AppColors.dContainerColor, // Background for cards

  textTheme: TextTheme(
    /// headlines
    headlineLarge: TextStyle(
      fontSize: 32,
      color: AppColors.primaryColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: TextStyle(
      fontSize: 30,
      color: AppColors.donBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      color: AppColors.donBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
    ),
    /// labels Texts
    labelLarge: TextStyle(
      fontSize: 15,
      color: AppColors.donContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
  ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: AppColors.donContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: AppColors.donContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
    ),
    /// Body Texts
    bodyLarge: TextStyle(
      fontSize: 18,
      color: AppColors.donBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      color: AppColors.donBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    ),
  )
);
