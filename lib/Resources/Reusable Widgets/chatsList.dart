import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/View/chatPage/ChatPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: (){
        Get.to(ChatPage());
      },
      child: Expanded(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: height * 0.02),
          child: ListView(
            children: [
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
                            Text('Taha', style: Theme.of(context).textTheme.bodyLarge),
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
                            Text('Taha', style: Theme.of(context).textTheme.bodyLarge),
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
        ),
      ),
    );
  }
}
