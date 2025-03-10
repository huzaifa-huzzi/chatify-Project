import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/View/Contact%20Screen/Widget/NewContactTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

   RxBool isSearchEnable = false.obs;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
     appBar: AppBar(
        title: Text('Select Contact'),
       backgroundColor: AppColors.primaryColor,
        actions: [
         Obx(() =>  IconButton(onPressed: (){
           isSearchEnable.value = !isSearchEnable.value;
         }, icon: isSearchEnable.value ? Icon(Icons.close) : Icon(Icons.search) ),)
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
                 SizedBox(height: height * 0.04,),
                 Container(
                   margin: EdgeInsets.only(bottom: 10),
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     color: Theme.of(context).colorScheme.primary,
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Image.asset(AssetImages.boyPic, width: 70),
                           SizedBox(width: width * 0.02),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Taha', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
                               SizedBox(height: 5),
                               Text('Chalo Baat krta ha', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),),
                             ],
                           ),
                         ],
                       ),
                       Text('8:33 PM', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),),
                     ],
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(bottom: 10),
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     color: Theme.of(context).colorScheme.primary,
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Image.asset(AssetImages.boyPic, width: 70),
                           SizedBox(width: width * 0.02),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Taha', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
                               SizedBox(height: 5),
                               Text('Chalo Baat krta ha', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),),
                             ],
                           ),
                         ],
                       ),
                       Text('8:33 PM', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),),
                     ],
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(bottom: 10),
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     color: Theme.of(context).colorScheme.primary,
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Image.asset(AssetImages.boyPic, width: 70),
                           SizedBox(width: width * 0.02),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Taha', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
                               SizedBox(height: 5),
                               Text('Chalo Baat krta ha', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),),
                             ],
                           ),
                         ],
                       ),
                       Text('8:33 PM', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),),
                     ],
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(bottom: 10),
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     color: Theme.of(context).colorScheme.primary,
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Image.asset(AssetImages.boyPic, width: 70),
                           SizedBox(width: width * 0.02),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Taha', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
                               SizedBox(height: 5),
                               Text('Chalo Baat krta ha', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),),
                             ],
                           ),
                         ],
                       ),
                       Text('8:33 PM', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),),
                     ],
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(bottom: 10),
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     color: Theme.of(context).colorScheme.primary,
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Image.asset(AssetImages.boyPic, width: 70),
                           SizedBox(width: width * 0.02),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Taha', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
                               SizedBox(height: 5),
                               Text('Chalo Baat krta ha', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),),
                             ],
                           ),
                         ],
                       ),
                       Text('8:33 PM', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),),
                     ],
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(bottom: 10),
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     color: Theme.of(context).colorScheme.primary,
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Image.asset(AssetImages.boyPic, width: 70),
                           SizedBox(width: width * 0.02),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Taha', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
                               SizedBox(height: 5),
                               Text('Chalo Baat krta ha', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),),
                             ],
                           ),
                         ],
                       ),
                       Text('8:33 PM', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),),
                     ],
                   ),
                 ),
               ],
             ),
           ],
         ),
      ),
    );
  }
}
