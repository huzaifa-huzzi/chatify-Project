import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/RoundedButton.dart';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/Utils/Utils.dart';
import 'package:chatify_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:chatify_app/View/UserProfileScreen/Widget/UpdateProfileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false ;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(onPressed: (){
            Get.to(() => UserUpdateProfile());
          }, icon: Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            /// All the Personal Info
            Container(
              height: height * 0.4 ,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.primaryContainer
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: height * 0.01),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AssetImages.boyPic)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Huzaifa Khan',style: Theme.of(context).textTheme.bodyLarge,)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('huzaifa@gmail.com',style: Theme.of(context).textTheme.bodyLarge,)
                              ],
                            ),
                            SizedBox(height:  height * 0.03,),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.backgroundColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone,weight: 20,color: Color(0xff039c00)),
                                      SizedBox(width: width * 0.01,),
                                      Text('call',style: TextStyle(color: Color(0xff039c00)),)
                                    ],
                                  ),
                                ),
                                SizedBox(width: width * 0.06,),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.backgroundColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.video_call,weight: 20,color: Colors.red),
                                      SizedBox(width: width * 0.01,),
                                      Text('Video',style: TextStyle(color: Colors.red),)
                                    ],
                                  ),
                                ),
                                SizedBox(width: width * 0.1,),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.backgroundColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone,weight: 20,color: AppColors.dContainerColor),
                                      SizedBox(width: width * 0.01,),
                                      Text('chat',style: TextStyle(color: AppColors.dContainerColor))
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
            SizedBox( height: height * 0.35,),
            /// Logout Button
            Padding(
              padding: const EdgeInsets.all(10),
              child: RoundedButton(title: 'Logout',loading: loading,onTap: (){
                _auth.signOut().then((value){
                  loading = true ;
                  SessionManager().userId = '';
                  Get.to(() => LoginScreen());
                }).then((value){
                  Utils.snackBar('Logout', 'Logout Successful');
                  loading = false;
                }).onError((error,stackTrace){
                  Utils.toastMessage('Issue Coming while logging out');
                  loading = false;
                });
              }),
            )
          ],
        ),
      ),
    );
  }
}