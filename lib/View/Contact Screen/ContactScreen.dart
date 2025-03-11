import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/chatsList.dart';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/View/Contact%20Screen/Widget/NewContactTile.dart';
import 'package:chatify_app/View/chatPage/Widgets/ChatsWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

   RxBool isSearchEnable = false.obs;
   final DatabaseReference _ref = FirebaseDatabase.instance.ref('user');

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
     appBar: AppBar(
        title: Text('Select Contact'),
       backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(onPressed: (){
            isSearchEnable.value = !isSearchEnable.value;
          }, icon: isSearchEnable.value ? Icon(Icons.close) : Icon(Icons.search) ),
        ],
     ),
      body: Padding(
          padding: EdgeInsets.all(10),
         child: ListView(
           children: [
             SizedBox(height:  height * 0.02,),
            Obx(() =>
            isSearchEnable.value ?  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(
                children: [

                  Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) => {
                          print(value),
                        },
                        decoration: InputDecoration(
                          hintText: 'Search Contact',
                          prefixIcon: Icon(Icons.search),
                        ),
                      )
                  )
                ],
              ),
            ) : SizedBox(),
            ),
             SizedBox(height:  height * 0.02,),
             Column(
               children: [
                 SizedBox(height: height * 0.01,),
                 NewContactTile(btnName: 'New Contact', icon:Icons.person_add, onTap: (){}),
                 SizedBox(height: height * 0.01,),
                 NewContactTile(btnName: 'New Group', icon:Icons.group_add, onTap: (){}),
                 SizedBox(height: height * 0.04,),
                 Row(
                   children: [
                     Text('Contacts on chatify'),
                   ],
                 ),
                 StreamBuilder(
                     stream:_ref.child(SessionManager().userId.toString()).onValue ,
                     builder: (context, AsyncSnapshot<DatabaseEvent> snapshot){

                       if (snapshot.connectionState == ConnectionState.waiting) {
                         return Center(child: CircularProgressIndicator());
                       }
                       if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
                         return Center(child: Text('No data found.'));
                       }

                       var data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;

                       return    SizedBox(
                         height: 200,  // Set an appropriate height
                         child: ChatsList( imageurl: "", time: data?['createdAt'], name: data?['username'] ?? 'N/A',),
                       );

                     }
                 )



               ],
             ),
           ],
         ),
      ),
    );
  }
}
