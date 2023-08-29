import 'package:flutter/material.dart';

class CategoryName extends StatelessWidget {
  CategoryName({required this.categoryName});
  String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        categoryName,
        style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Nanum Myeongjo',
            fontWeight: FontWeight.w600,
            color: Colors.cyan[200]),
      ),
    );
  }
}
