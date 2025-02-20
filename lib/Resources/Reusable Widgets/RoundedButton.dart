import 'package:flutter/material.dart';


class RoundedButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const RoundedButton({super.key,required this.title,required this.onTap});

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap:widget.onTap ,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_outline_rounded),
            SizedBox(width: width * 0.01,),
            Text(widget.title,style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
      ),
    );
  }
}
