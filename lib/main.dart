import 'package:chatify_app/Resources/Themes/Themes.dart';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/View/SplashScreen/MainSplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chatify',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: MainSplashScreen(),
    );
  }
}
