import 'package:flutter/material.dart';

PreferredSize myTabBar(TabController tabController, BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: TabBar(
      controller: tabController,
      indicatorWeight: 3,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
      tabs: const [
        Tab(text: 'Chats'),
        Tab(text: 'Status'),
        Tab(text: 'Calls'),
      ],
    ),
  );
}
