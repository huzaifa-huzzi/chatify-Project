import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
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
                                 SizedBox(width: width * 0.1,),
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
             )
          ],
        ),
      ),
    );
  }
}
