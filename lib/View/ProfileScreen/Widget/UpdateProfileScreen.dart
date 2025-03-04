import 'package:chatify_app/Resources/Reusable%20Widgets/RoundedButton.dart';
import 'package:flutter/material.dart';


class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
       /// Personal Info
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
             /// Main Yellow Container
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          /// Image Widget
                          Container(
                            width: width * 0.4,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Icon(Icons.image,size: 40,),
                            ),
                          ),
                          /// Personal Info Text
                          Row(
                            children: [
                              Text(
                                'Personal Info',
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                           /// Name TextField
                          SizedBox(height: height * 0.03,),
                          Row(
                            children: [
                              Text('Name',style: Theme.of(context).textTheme.bodyMedium,)
                            ],
                          ),
                          SizedBox(height: height * 0.01,),
                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration:InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Huzaifa khan"
                            )
                          ),
                          /// Email TextField
                          SizedBox(height: height * 0.03,),
                          Row(
                            children: [
                              Text('Email Id',style: Theme.of(context).textTheme.bodyMedium,)
                            ],
                          ),
                          SizedBox(height: height * 0.01,),
                          TextField(
                              textInputAction: TextInputAction.next,
                              decoration:InputDecoration(
                                prefixIcon: Icon(Icons.alternate_email_rounded),
                                hintText: "Example@gmail.com"
                              )
                          ),
                          /// Save Button
                          SizedBox(height: height * 0.03,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedButton(title: 'Save', onTap: (){})
                            ],
                          )


                        ],
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
