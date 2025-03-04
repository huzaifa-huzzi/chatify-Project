import 'package:flutter/material.dart';

class InfoRows extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isEditable;

  const InfoRows({
    super.key,
    required this.icon,
    required this.text,
    required this.isEditable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          if (isEditable)
            Icon(Icons.edit, color: Colors.blue, size: 18),
        ],
      ),
    );
  }
}
