import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:flutter/material.dart';


class NewContactTile extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback onTap;
  const NewContactTile({super.key, required this.btnName, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Container(
              height:70,
              width: 70,
              child: Icon(icon),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.primaryColor
              ),
            ),
            SizedBox(width:  width * 0.06,),
            Text(btnName,style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
      ),
    );
  }
}
