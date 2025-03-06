import 'package:flutter/material.dart';
import 'package:chatify_app/Resources/Colors/Colors.dart';
import 'package:get/get.dart';
import 'package:chatify_app/View_Model/Controllers/ProfileController.dart';

class InfoRows extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isEditable;
  final String fieldKey;

  const InfoRows({
    super.key,
    required this.icon,
    required this.text,
    required this.isEditable,
    required this.fieldKey,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

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
            IconButton(
              onPressed: () {
                _showEditDialog(context, controller);
              },
              icon: Icon(Icons.edit, size: 20, color: AppColors.backgroundColor),
            ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, ProfileController controller) {
    TextEditingController textController = TextEditingController(text: text);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit ${fieldKey.capitalizeFirst}"),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(hintText: "Enter new $fieldKey"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (textController.text.trim().isNotEmpty) {
                  controller.updateProfile(fieldKey, textController.text.trim());
                }
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
