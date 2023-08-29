import 'package:ecommerce_book_store_app_bq/screens/cart_screen.dart';
import 'package:ecommerce_book_store_app_bq/screens/dashboard_screen.dart';
import 'package:ecommerce_book_store_app_bq/utilities/book_models.dart';
import 'package:ecommerce_book_store_app_bq/utilities/cart_item_models.dart';
import 'package:ecommerce_book_store_app_bq/utilities/fake_store_api_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookDetails extends StatefulWidget {
  BookDetails({this.displayBookIndex, this.quantity});

  final int? displayBookIndex;
  int? quantity;

  int? updatedQuantity;
  int? getUpdatedQuantity() {
    return updatedQuantity = quantity;
  }

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  String? data;

  String _dropDownButtonValue = 'Blue';
  int? _quantity = 1;

  @override
  void dispose() {
    super.dispose();
    widget.quantity = _quantity;
  }

  void dropDownUpdatedButton(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropDownButtonValue = selectedValue;
      });
    }
  }

  List<CartItemModels> cartProductsList = [];
  List<CartItemModels> updatedCartProductsList = [];

  void addToCart(FakeStoreApiModels item) {
    if (cartProductsList.isNotEmpty) {
      for (var ele in cartProductsList) {
        if (ele.id == item.id) {
          setState(() {
            ele.quantity = ele.quantity! + 1;
          });
        } else {
          setState(() {
            cartProductsList.add(CartItemModels(
                image: item.image.toString(),
                title: item.title,
                price: item.price!.toInt(),
                quantity: ele.quantity,
                id: item.id));
          });
        }
      }
    } else {
      setState(() {
        cartProductsList.add(CartItemModels(
            image: item.image.toString(),
            title: item.title,
            price: item.price!.toInt(),
            quantity: _quantity,
            id: item.id));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff131E34),
          leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Icon(
              Icons.arrow_back,
              size: 30.0,
            ),
          ),
          flexibleSpace: Image.network(
            productsList[widget.displayBookIndex!].image!,
            fit: BoxFit.fill,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(200.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.share),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${productsList[widget.displayBookIndex!].price} USD',
                  style: TextStyle(
                    fontFamily: 'Nanum Myeongjo',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.cyan[200],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  productsList[widget.displayBookIndex!].title.toString(),
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Playfair Display'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'id: ${productsList[widget.displayBookIndex!].id}',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                      fontFamily: 'Nanum Myeongjo'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  productsList[widget.displayBookIndex!].description.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Playfair Display',
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 200.0,
          decoration: BoxDecoration(
              color: Color(0xff283148),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xff535B6D), width: 2),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 16.0),
                              width: 70.0,
                              child: Text(
                                _quantity.toString(),
                              ),
                            ),
                            Container(
                              color: Color(0xff535B6D),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_quantity != 0) {
                                      _quantity = _quantity! - 1;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff535B6D),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4.0),
                                  bottomRight: Radius.circular(4.0),
                                ),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _quantity = _quantity! + 1;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Color'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        alignment: AlignmentDirectional.center,
                        height: 53,
                        width: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xff535B6D), width: 2),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Blue',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: 'Blue',
                            ),
                            DropdownMenuItem(
                              child: Text('Red'),
                              value: 'Red',
                            ),
                            DropdownMenuItem(
                              child: Text('Green'),
                              value: 'Green',
                            ),
                            DropdownMenuItem(
                              child: Text('Yellow'),
                              value: 'Yellow',
                            ),
                          ],
                          dropdownColor: Color(0xff283148),
                          borderRadius: BorderRadius.circular(10.0),
                          iconSize: 30.0,
                          value: _dropDownButtonValue,
                          onChanged: dropDownUpdatedButton,
                          underline: SizedBox(),
                          isExpanded: true,
                          icon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: MaterialButton(
                  height: 55,
                  onPressed: () {
                    // cartProductsList.add(cartItemModels);

                    AlertDialog quantityAlert = AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      title: Text(
                        'Error',
                        style: TextStyle(
                            color: Colors.cyan[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      ),
                      content: Text(
                        'Please set the quantity of product at least 1',
                        style: TextStyle(
                            fontFamily: 'Nanum Myeongjo', fontSize: 20),
                      ),
                      backgroundColor: Color(0xff131E34),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Ok',
                              style: TextStyle(color: Colors.cyan[200]),
                            ))
                      ],
                    );
                    setState(() {
                      if (_quantity != 0) {
                        // cartProductsList.add(cartItemModels);
                        addToCart(productsList[widget.displayBookIndex!]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(
                              quantityOnCartScreen: _quantity,
                              selectedProductIndex: widget.displayBookIndex,
                              cartProductsList: cartProductsList,
                              itemPrice:
                                  productsList[widget.displayBookIndex!].price!,
                            ),
                          ),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return quantityAlert;
                            });
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  color: Colors.cyan,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              )
            ],
          ),
        )

        // body: Column(
        //   children: [
        //     Expanded(
        //       child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //         Expanded(
        //           child: ClipRRect(
        //             borderRadius: BorderRadius.circular(10.0),
        //             child: Image.network(
        //               productsList[widget.displayBookIndex!]
        //                   .images![0]
        //                   .toString(),
        //               height: 300,
        //               fit: BoxFit.fill,
        //             ),
        //           ),
        //         ),
        //         Expanded(
        //           child: Padding(
        //             padding:
        //                 const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   productsList[widget.displayBookIndex!].id.toString(),
        //                   style: TextStyle(fontSize: 16.0, color: Colors.grey),
        //                 ),
        //                 SizedBox(
        //                   height: 10.0,
        //                 ),
        //                 Text(
        //                   productsList[widget.displayBookIndex!].title!,
        //                   style: TextStyle(fontSize: 25.0),
        //                 ),
        //                 SizedBox(
        //                   height: 10.0,
        //                 ),
        //                 Text(
        //                   productsList[widget.displayBookIndex!].price.toString(),
        //                   style: TextStyle(
        //                       fontSize: 40.0,
        //                       fontFamily: 'Nanum Myeongjo',
        //                       fontWeight: FontWeight.bold),
        //                 ),
        //                 SizedBox(
        //                   height: 20.0,
        //                 ),
        //                 MaterialButton(
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(10.0)),
        //                   onPressed: () {},
        //                   child: Text(
        //                     'Buy Now',
        //                     style: TextStyle(fontSize: 20.0),
        //                   ),
        //                   color: Color(0xff0EA680),
        //                   height: 50.0,
        //                   minWidth: 130.0,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ]),
        //     ),
        //   ],
        // ),
        );
  }
}
