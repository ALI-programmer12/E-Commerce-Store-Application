import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  Button1({required this.btnText, required this.onPress});

  final String? btnText;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        height: 50.0,
        child: Text(
          btnText!,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
        ),
        onPressed: onPress,
        color: Color(0xff0EA680),
      ),
    );
  }
}
