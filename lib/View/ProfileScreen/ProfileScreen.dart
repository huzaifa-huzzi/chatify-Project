import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/PrimaryButton.dart';
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
  bool loading = false;

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
                  if (data == null) {
                    return Center(child: Text('Data not available.'));
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Profile Picture
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
                            InfoRows(icon: Icons.person, text: data['username'] ?? 'N/A', isEditable: false),
                            InfoRows(icon: Icons.person, text: 'Bio', isEditable: false),
                            InfoRows(icon: Icons.email, text: data['email'] ?? 'N/A', isEditable: false),
                          ],
                        );
                      }),

                      SizedBox(height: 20),

                      /// Save / Edit Button
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryBtn(
                              title: controller.isEditing.value ? 'Save' : 'Edit',
                              onTap: () {
                                if (controller.isEditing.value) {
                                  controller.saveChanges(controller.name.value, controller.bio.value);
                                } else {
                                  controller.toggleEditMode();
                                }
                              },
                              icon: Icon(controller.isEditing.value ? Icons.save : Icons.edit),
                            )
                          ],
                        );
                      })
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.1),
            Padding(
              padding: EdgeInsets.all(6),
              child:  RoundedButton(
                title: 'Logout',
                loading: loading,
                onTap: () {
                  _auth.signOut().then((value){
                    loading = true;
                    SessionManager().userId ='';
                    Get.to(() => LoginScreen());
                  }).then((value){
                    Utils.snackBar('Logout','Logout Successful');
                    loading = false;
                  }).onError((error, stackTrace){
                    Utils.toastMessage(error.toString());
                    loading = false;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}