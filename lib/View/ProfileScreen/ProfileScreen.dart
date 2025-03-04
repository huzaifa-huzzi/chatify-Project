import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/RoundedButton.dart';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/Utils/Utils.dart';
import 'package:chatify_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:chatify_app/View/ProfileScreen/Widget/ContactButton.dart';
import 'package:chatify_app/View/ProfileScreen/Widget/UpdateProfileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  final _ref = FirebaseDatabase.instance.ref('user');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => UpdateProfile());
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            /// Personal Info Section
            Container(
              height: height * 0.4,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: StreamBuilder(
                stream: _ref.child(SessionManager().userId.toString()).onValue,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
                    return Center(child: Text("No Data Available"));
                  }

                  Map<dynamic, dynamic> data =
                  snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                  String name = data['username'] ?? 'Unknown User';
                  String email = data['email'] ?? 'No Email';

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Image.asset(AssetImages.boyPic)],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(name, style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(email, style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      SizedBox(height: height * 0.03),
                      Row(
                        children: [
                          ContactButton(
                            icon: Icons.phone,
                            label: "Call",
                            color: Color(0xff039c00),
                            width: width,
                          ),
                          SizedBox(width: width * 0.06),
                          ContactButton(
                            icon: Icons.video_call,
                            label: "Video",
                            color: Colors.red,
                            width: width,
                          ),
                          SizedBox(width: width * 0.1),
                          ContactButton(
                            icon: Icons.chat,
                            label: "Chat",
                            color: AppColors.dContainerColor,
                            width: width,
                          ),
                        ],
                      ),

                    ],
                  );
                },
              ),
            ),

            SizedBox(height: height * 0.35),

            /// Logout Button
            Padding(
              padding: const EdgeInsets.all(10),
              child: RoundedButton(
                  title: 'Logout',
                  loading: loading,
                  onTap: () {
                    setState(() => loading = true);
                    _auth.signOut().then((value) {
                      SessionManager().userId = '';
                      Get.to(() => LoginScreen());
                      Utils.snackBar('Logout', 'Logout Successful');
                    }).catchError((error) {
                      Utils.toastMessage('Issue logging out');
                    }).whenComplete(() => setState(() => loading = false));
                  }),
            ),
          ],
        ),
      ),
    );
  }

}
