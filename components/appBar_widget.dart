import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({this.imageLink});
  String? imageLink;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Color(0xff131E34),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageLink!,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
