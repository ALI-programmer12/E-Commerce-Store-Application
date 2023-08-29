import 'package:ecommerce_book_store_app_bq/utilities/cart_item_models.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen(
      {this.quantityOnCartScreen,
      this.selectedProductIndex,
      this.cartProductsList,
      this.itemPrice});
  int? quantityOnCartScreen;
  int? selectedProductIndex;
  num? itemPrice;
  List<CartItemModels>? cartProductsList;

  // List<CartItemModels> cartProductsList = [];

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AlertDialog checkOutDialog = AlertDialog(
      backgroundColor: Color(0xff131E34),
      title: Text('Order Placed'),
      content: CircleAvatar(
        radius: 40.0,
        child: Icon(
          Icons.check,
          color: Colors.green,
          size: 40.0,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Text(
              'Ok',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 6.0, bottom: 15.0),
                    child: Text(
                      'Cart',
                      style: TextStyle(
                          color: Colors.cyan[200],
                          fontSize: 35.0,
                          fontFamily: 'Nanum Myeongjo',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 180.0, top: 16.0),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.cyan[200],
                      size: 40.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        size: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.cartProductsList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Card(
                            elevation: 0,
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    widget.cartProductsList![index].image
                                        .toString(),
                                    height: 120,
                                    width: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 190,
                                      child: Text(
                                        widget.cartProductsList![index].title
                                            .toString(),
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$${widget.cartProductsList![index].price}',
                                              style: TextStyle(
                                                  color: Colors.cyan[200],
                                                  fontSize: 20.0),
                                            ),
                                            RichText(
                                              text: const TextSpan(
                                                text: '\$8.99',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 18.0,
                                              left: 6.0,
                                              right: 8.0),
                                          child: Text(
                                            'x',
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 12.0),
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.cyan.shade200,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.0)),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 30.0,
                                                child: FloatingActionButton(
                                                  heroTag: null,
                                                  elevation: 0,
                                                  shape:
                                                      const RoundedRectangleBorder(),
                                                  onPressed: () {
                                                    setState(() {
                                                      widget
                                                          .cartProductsList![
                                                              index]
                                                          .quantity = widget
                                                              .cartProductsList![
                                                                  index]
                                                              .quantity! -
                                                          1;
                                                      widget.itemPrice = (widget
                                                              .itemPrice! /
                                                          widget
                                                              .cartProductsList![
                                                                  index]
                                                              .quantity!
                                                              .toDouble());
                                                      if (widget
                                                              .cartProductsList![
                                                                  index]
                                                              .quantity ==
                                                          0) {
                                                        widget.cartProductsList!
                                                            .removeAt(index);
                                                        widget.itemPrice = 0;
                                                      }
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 20.0,
                                                  ),
                                                  backgroundColor:
                                                      Colors.cyan[200],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25.0,
                                                child: Text(
                                                  widget
                                                      .cartProductsList![index]
                                                      .quantity
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 14.0),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30.0,
                                                child: FloatingActionButton(
                                                  heroTag: null,
                                                  elevation: 0,
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      4.0))),
                                                  onPressed: () {
                                                    setState(() {
                                                      widget
                                                          .cartProductsList![
                                                              index]
                                                          .quantity = widget
                                                              .cartProductsList![
                                                                  index]
                                                              .quantity! +
                                                          1;
                                                      widget.itemPrice = (widget
                                                              .itemPrice! *
                                                          widget
                                                              .cartProductsList![
                                                                  index]
                                                              .quantity!
                                                              .toDouble());
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 20.0,
                                                  ),
                                                  backgroundColor:
                                                      Colors.cyan[200],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 18.0,
                                              left: 6.0,
                                              right: 6.0),
                                          child: Text(
                                            '=',
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 14.0),
                                          child: Text(
                                            '\$${widget.itemPrice}',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.cyan[200],
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          height: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Total',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                '\$${widget.itemPrice}',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.cyan[200],
                    fontFamily: 'Nanum Myeongjo',
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 60.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  onPressed: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (context) => checkOutDialog);
                    });
                  },
                  child: const Text(
                    'Check Out',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.cyan,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
