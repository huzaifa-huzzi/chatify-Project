import 'package:chatify_app/Model/ChatRoomModel.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/View/chatPage/ChatPage.dart';
import 'package:chatify_app/View_Model/Controllers/ContactController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final ContactController controller = Get.put(ContactController());

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        child: ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.filteredUsers[index];
            final String name = user['username']?.toString() ?? 'Unknown';
            final String imageUrl = user['profilePic']?.toString() ?? AssetImages.boyPic;
            final String currentUserId = SessionManager().userId.toString();

            return InkWell(
              onTap: () {
                Get.to(() => ChatPage(
                  userId: user['uid'],
                  userName: name,
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.network(
                        imageUrl,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(AssetImages.boyPic, width: 70, height: 70);
                        },
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
