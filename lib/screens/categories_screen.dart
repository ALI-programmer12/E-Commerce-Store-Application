import 'package:ecommerce_book_store_app_bq/screens/dashboard_screen.dart';
import 'package:ecommerce_book_store_app_bq/utilities/constants.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 8.0),
                child: Text(
                  'Choose whatever\nyour like',
                  style: kTitleTextStyle,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 45.0, left: 8.0),
                child: Text(
                  'Choose whatever your like',
                  style: kLabelTxtStyle.copyWith(color: Colors.grey),
                ),
              ),
              CategoryImgWidget(
                imageLink: 'assets/images/biography_book.jpg',
                imgTitle: 'Biography',
                onPress: () {
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()));
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              CategoryImgWidget(
                imageLink: 'assets/images/boy_reading.jpg',
                imgTitle: 'Kids',
              ),
              SizedBox(
                height: 20.0,
              ),
              CategoryImgWidget(
                imageLink: 'assets/images/adult_reading2.jpg',
                imgTitle: 'Adults',
              ),
              SizedBox(
                height: 20.0,
              ),
              CategoryImgWidget(
                  imageLink: 'assets/images/novel_book.jpg', imgTitle: 'Novel')
            ],
          ),
        ),
      ),
    ));
  }
}

class CategoryImgWidget extends StatelessWidget {
  CategoryImgWidget({required this.imageLink, this.imgTitle, this.onPress});
  final String? imageLink;
  final String? imgTitle;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(children: [
          Image.asset(
            imageLink!,
            fit: BoxFit.cover,
            height: 150.0,
            width: double.infinity,
          ),
          Positioned(
            top: 100.0,
            left: 17.0,
            child: Container(
              child: Text(
                imgTitle!,
                style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
