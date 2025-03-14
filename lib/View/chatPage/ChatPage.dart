import 'package:chatify_app/Model/ChatModel.dart';
import 'package:chatify_app/Model/ChatRoomModel.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Services/SessionManager.dart';
import 'package:chatify_app/View/UserProfileScreen/UserProfileScreen.dart';
import 'package:chatify_app/View/chatPage/Widgets/ChatsWidget.dart';
import 'package:chatify_app/View_Model/Controllers/ProfileController.dart';
import 'package:chatify_app/View_Model/Controllers/chatController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  final String userId;
  final String userName;

  const ChatPage({Key? key, required this.userId, required this.userName}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final ChatController chatController = Get.put(ChatController());
    final ProfileController profileController =Get.put(ProfileController());
    TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.to(() => UserProfileScreen());
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(AssetImages.boyPic),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: InkWell(
          onTap: (){
            Get.to(() => UserProfileScreen());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.userName, style: Theme.of(context).textTheme.bodyLarge),
              Text('Online', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white)),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          children: [
            SvgPicture.asset(AssetImages.mic, width: 30),
            SizedBox(width: width * 0.01),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  filled: false,
                  hintText: "Type mess...",
                ),
              ),
            ),
            SizedBox(width: width * 0.01),
            SvgPicture.asset(AssetImages.imageOpener, width: 30),
            SizedBox(width: width * 0.01),
            InkWell(
                onTap: (){

                  if(messageController.text.isNotEmpty){
                    chatController.sendMessages(SessionManager().userId.toString(), messageController.text,UserModel());
                    messageController.clear();
                  }
                },
                child: SvgPicture.asset(AssetImages.send, width: 30)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 70,top: 10,left: 10,right: 10),
        child: StreamBuilder<List<ChatModel>>(
            stream: chatController.getMessages(SessionManager().userId.toString()),
            builder: (context,snapshot){
               if(snapshot.connectionState == ConnectionState.waiting){
                 return Center(child: CircularProgressIndicator(),);
               }
               if(snapshot.hasError){
                 return Center(child: Text("Error: ${snapshot.error}"),);
              }
               if(snapshot.hasData){
                 return ListView.builder(
                 reverse: true,
                 itemCount: snapshot.data!.length,
                 itemBuilder: (context,index){

                   return ChatsWidget(
              imageUrl: '',
              message: snapshot.data![index].message!,
              isComing: snapshot.data![index].receiverId == profileController.name.value ,
              time:"9AM",
              status: 'Read',
              );
              }
                 );
              }
               return Container();
            }
        )
      ),
    );
  }
}
