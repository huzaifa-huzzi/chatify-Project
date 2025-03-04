import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final double width;

  const ContactButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.backgroundColor,
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          SizedBox(width: width * 0.01),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
