import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/chatsList.dart';
import 'package:chatify_app/Resources/Reusable%20Widgets/myTabBar.dart';
import 'package:chatify_app/Resources/Strings/Strings.dart';
import 'package:chatify_app/View/Contact%20Screen/ContactScreen.dart';
import 'package:chatify_app/View/ProfileScreen/ProfileScreen.dart';
import 'package:chatify_app/View_Model/Controllers/ContactController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  final ContactController controller = Get.put( ContactController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AssetImages.appIconSvg,
            width: 40,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              controller.getChatRoomList();
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => ProfileScreen());
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: myTabBar(tabController, context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(() => ContactScreen());
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
         child: Icon(Icons.add,color:AppColors.donBackgroundColor ,),
      ),
      body:TabBarView(
        controller: tabController,
          children: [
            ChatsList(),
            ListView(
              children: [
                ListTile(
                  title: Text('Name Nitish'),
                )
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('Name Nitish'),
                )
              ],
            )
          ]
      )

    );
  }
}
