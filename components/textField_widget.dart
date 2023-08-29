import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({this.hintText, this.icon, this.controller});
  final String? hintText;
  final Icon? icon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: icon,
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(28.0))),
      ),
    );
  }
}
