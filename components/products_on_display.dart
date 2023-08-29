import 'package:ecommerce_book_store_app_bq/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class ProductsOnDisplay extends StatelessWidget {
  ProductsOnDisplay({required this.index, required this.onPress});
  final int index;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        height: 150.0,
        width: 160.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  productsList[index].image.toString(),
                  height: 150.0,
                  width: 130.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '\$${productsList[index].price}',
                style: TextStyle(
                    fontFamily: 'Nanum Myeongjo',
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.cyan[200]),
              ),
              SizedBox(
                width: 150.0,
                child: Text(
                  productsList[index].title.toString(),
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Playfair Display'),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
