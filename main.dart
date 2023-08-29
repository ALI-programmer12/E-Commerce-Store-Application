import 'package:ecommerce_book_store_app_bq/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BookStore());
}

class BookStore extends StatelessWidget {
  BookStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xff131E34)),
      home: SplashScreen(),
    );
  }
}
