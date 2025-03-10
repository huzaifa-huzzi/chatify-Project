import 'package:flutter/material.dart';


class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Select Contact'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        ],
     ),
      body: Padding(
          padding: EdgeInsets.all(10),
         child: Column(
           children: [
               
           ],
         ),
      ),
    );
  }
}
