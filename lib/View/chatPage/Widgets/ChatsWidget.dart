import 'package:chatify_app/Resources/Images/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatsWidget extends StatelessWidget {
  final String message;
  final bool isComing;
  final String time;
  final String status;
  final String? imageUrl;

  const ChatsWidget({
    super.key,
    required this.message,
    required this.isComing,
    required this.time,
    required this.status,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment:
      isComing ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(
            minWidth: 0,
            maxWidth: width / 1.3,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Text(message),
        ),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment:
          isComing ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            isComing
                ? Text(time)
                : Row(
              children: [
                Text(time),
                SvgPicture.asset(
                  AssetImages.checkStatus,
                  width: 30,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
