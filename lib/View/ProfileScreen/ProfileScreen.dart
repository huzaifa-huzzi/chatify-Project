import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/RoundedButton.dart';
import 'package:chatify_app/View/ProfileScreen/Widgets/InfoRowsWidget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Center(
        child: Container(
          width: width * 0.9,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile Picture
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(AssetImages.boyPic),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.edit, color: Colors.white, size: 20),
                  )
                ],
              ),
              SizedBox(height: 20),

              // Name
              InfoRows(icon: Icons.person, text: "Nitish Kumar", isEditable: true),

              // About
              InfoRows(icon: Icons.info, text: "I am Groot", isEditable: true),

              // Email
              InfoRows(icon: Icons.email, text: "Nitishr833@gmail.com", isEditable: false),

              // Phone Number
              InfoRows(icon: Icons.phone, text: "+91 7033161175", isEditable: false),

              SizedBox(height: 20),

              // Save Button
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [

               ],
             )
            ],
          ),
        ),
      ),
    );
  }

}