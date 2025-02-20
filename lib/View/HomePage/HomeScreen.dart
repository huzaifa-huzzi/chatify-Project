import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:chatify_app/Resources/Strings/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController tabController = TabController(length: 3, vsync:this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppString.appName,style: Theme.of(context).textTheme.headlineSmall,),
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
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          controller: tabController,

            tabs: [
             Text('Chats'),
             Text('Groups'),
             Text('Calls'),
            ]
        ),
      ),
    );
  }
}
