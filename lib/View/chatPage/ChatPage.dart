import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/View/chatPage/Widgets/ChatsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage> {

  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(AssetImages.boyPic),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Taha',style: Theme.of(context).textTheme.bodyLarge,),
            Text('Online',style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ChatsWidget(
              message: 'HEllo How are you ?',
              isComing: true,
              time: '10:10 Am',
              status: 'Read',
            ),
            ChatsWidget(
              message: 'HEllo How are you ?',
              isComing: false,
              time: '10:10 Am',
              status: 'Read',
            )
          ],
        )
      ),
    );
  }
}
