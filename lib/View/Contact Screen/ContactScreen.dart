import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/View/Contact%20Screen/Widget/NewContactTile.dart';
import 'package:chatify_app/View/chatPage/ChatPage.dart';
import 'package:chatify_app/View_Model/Controllers/ContactController.dart';
import 'package:chatify_app/View_Model/Controllers/chatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}


class _ContactScreenState extends State<ContactScreen> {
  final ContactController contactController = Get.put(ContactController());
  final TextEditingController searchController = TextEditingController();
  final  chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Contact'),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              contactController.toggleSearch();
              if (!contactController.isSearchEnabled.value) {
                searchController.clear();
                contactController.resetFilter();
              }
            },
            icon: Obx(() => Icon(
              contactController.isSearchEnabled.value ? Icons.close : Icons.search,
            )),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Obx(() => contactController.isSearchEnabled.value
                ? Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: searchController,
                onChanged: contactController.filterUsers,
                decoration: InputDecoration(
                  hintText: 'Search Contact',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )
                : SizedBox()),

            // New Contact & Group Buttons
            NewContactTile(btnName: 'New Contact', icon: Icons.person_add, onTap: () {}),
            SizedBox(height: height * 0.01),
            NewContactTile(btnName: 'New Group', icon: Icons.group_add, onTap: () {}),
            SizedBox(height: height * 0.04),

            Text('Contacts on Chatify', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: height * 0.02),

            /// Contact List
            Expanded(
              child: Obx(() {
                if (contactController.filteredUsers.isEmpty) {
                  return Center(child: Text('No contacts available.'));
                }

                return ListView.builder(
                  itemCount: contactController.filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = contactController.filteredUsers[index];
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
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}