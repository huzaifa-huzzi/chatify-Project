import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/RoundedButton.dart';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/Utils/Utils.dart';
import 'package:chatify_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:chatify_app/View/ProfileScreen/Widgets/InfoRowsWidget.dart';
import 'package:chatify_app/View/ProfileScreen/Widgets/ProfileTextFields.dart';
import 'package:chatify_app/View_Model/Controllers/ProfileController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              width: width * 0.9,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: StreamBuilder(
                stream: _ref.child(SessionManager().userId.toString()).onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
                    return Center(child: Text('No data found.'));
                  }

                  var data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Profile Picture Section
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          GestureDetector(
                            onTap: ()  {
                              controller.getGalleryImage();
                            },
                            child: Obx(() {
                              return CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                backgroundImage: controller.image.value != null
                                    ? FileImage(controller.image.value!) as ImageProvider
                                    : AssetImage(AssetImages.boyPic),
                                child: controller.image.value == null ? Image.asset(AssetImages.boyPic) : null,
                              );
                            }),

                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      /// Editable Fields
                      Obx(() {
                        return controller.isEditing.value
                            ? Column(
                          children: [
                            ProfileTextFields(controllerText: controller.name),
                            ProfileTextFields(controllerText: controller.bio),
                          ],
                        )
                            : Column(
                          children: [
                            InfoRows(
                              icon: Icons.person,
                              text: data?['username'] ?? 'N/A',
                              isEditable: true,
                              fieldKey: "username",
                            ),
                            InfoRows(
                              icon: Icons.info,
                              text: data?['bio'] != null && data?['bio'] != ""
                                  ? data!['bio']
                                  : "Hey! There I am on Chatify",
                              isEditable: true,
                              fieldKey: "bio",
                            ),

                            InfoRows(
                              icon: Icons.email,
                              text: data?['email'] ?? 'N/A',
                              isEditable: false,
                              fieldKey: "",
                            ),
                          ],
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.1),

            /// Logout Button
            Padding(
              padding: EdgeInsets.all(6),
              child: RoundedButton(
                title: 'Logout',
                loading: controller.isLoading.value,
                onTap: () {
                  controller.isLoading.value = true;
                  _auth.signOut().then((value) {
                    SessionManager().userId = '';
                    Get.to(() => LoginScreen());
                    Utils.snackBar('Logout', 'Logout Successful');
                  }).catchError((error) {
                    Utils.toastMessage(error.toString());
                  }).whenComplete(() {
                    controller.isLoading.value = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}