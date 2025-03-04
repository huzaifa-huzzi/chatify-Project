import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/PrimaryButton.dart';
import 'package:chatify_app/View/ProfileScreen/Widgets/InfoRowsWidget.dart';
import 'package:chatify_app/View/ProfileScreen/Widgets/ProfileTextFields.dart';
import 'package:chatify_app/View_Model/Controllers/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .sizeOf(context)
        .width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          width: width * 0.9,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Obx(() =>
              Column(
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

                  // Editable Fields
                  controller.isEditing.value
                      ? Column(
                    children: [
                      ProfileTextFields(controllerText: controller.name),
                      ProfileTextFields(controllerText: controller.bio),
                      ProfileTextFields(controllerText: controller.email),
                    ],
                  )
                      : Column(
                    children: [
                      InfoRows(icon: Icons.person,
                          text: controller.name.value,
                          isEditable: false),
                      InfoRows(icon: Icons.info,
                          text: controller.bio.value,
                          isEditable: false),
                      InfoRows(icon: Icons.email,
                          text: controller.email.value,
                          isEditable: false),
                    ],
                  ),

                  SizedBox(height: 20),

                  /// Save / Edit Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryBtn(
                        title: controller.isEditing.value ? 'Save' : 'Edit',
                        onTap: () {
                          if (controller.isEditing.value) {
                            controller.saveChanges(
                              controller.name.value,
                              controller.bio.value,
                              controller.email.value,
                            );
                          } else {
                            controller.toggleEditMode();
                          }
                        },
                        icon: Icon(
                            controller.isEditing.value ? Icons.save : Icons
                                .edit),
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

