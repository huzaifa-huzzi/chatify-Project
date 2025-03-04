import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTextFields extends StatelessWidget {
  final RxString controllerText;

  ProfileTextFields({required this.controllerText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        onChanged: (value) => controllerText.value = value,
        controller: TextEditingController(text: controllerText.value),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}