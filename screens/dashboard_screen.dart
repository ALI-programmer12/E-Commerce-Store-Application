import 'dart:convert';
import 'package:ecommerce_book_store_app_bq/components/category_name_display.dart';
import 'package:ecommerce_book_store_app_bq/components/products_on_display.dart';
import 'package:ecommerce_book_store_app_bq/screens/product_details_screen.dart';
import 'package:ecommerce_book_store_app_bq/screens/categories_screen.dart';
import 'package:ecommerce_book_store_app_bq/screens/sign_up_screen.dart';
import 'package:ecommerce_book_store_app_bq/utilities/fake_store_api_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sidebarx/sidebarx.dart';
import 'package:card_swiper/card_swiper.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

List<FakeStoreApiModels> productsList = [];

class _DashboardScreenState extends State<DashboardScreen> {
  Future<List<FakeStoreApiModels>> fetchProductsData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var i in data) {
        productsList.add(FakeStoreApiModels.fromJson(i));
      }
      return productsList;
    } else {
      return productsList;
    }
  }

  List<String> discountBannerImages = [
    'assets/images/discount_banner1.png',
    'assets/images/discount_banner2.png',
    'assets/images/discount_banner3.png'
  ];

  int? selectedBookIndex;
  BookDetails bookDetails = BookDetails();

  int currentPageIndex = 0;

  Dialog termsAndConditionsDialog = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    backgroundColor: Color(0xff131E34),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Terms and Conditions',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27.0,
                    color: Colors.cyan[200]),
              ),
            ),
            Text(
              'These Terms and Conditions ("Agreement") govern the use of the Flutter Ecommerce App ("App") provided by [Your Company Name] ("Company," "we," "us," or "our"). By accessing or using the App, you ("User," "you," or "your") agree to comply with and be bound by these Terms and Conditions. If you do not agree to these terms, please do not use the App.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '1. Acceptable Use',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '1.1. You must be at least 18 years old to use the App. If you are under 18, you may only use the App with the involvement of a parent or guardian.1.2. You agree not to use the App for any illegal or unauthorized purposes, including but not limited to violating any applicable laws or regulations.1.3. You agree not to engage in any activity that disrupts or interferes with the proper functioning of the App or its associated services.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '2. Account Registeration',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '2.1. To access certain features of the App, you may need to create an account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.2.2. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete.2.3. You agree not to create multiple accounts for the purpose of abusing promotions or other features of the App.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '3. Product Listings and Purchases',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '3.1. The App allows you to view and purchase products from various sellers.3.2. Product listings, prices, and availability are subject to change without notice.3.3. We do not guarantee the accuracy of product descriptions, images, or any other content provided by sellers. It is your responsibility to verify the details before making a purchase.3.4. All purchases made through the App are subject to the seller\'s terms and conditions.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '4. Payments',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '4.1. Payments for products purchased through the App are processed by third-party payment processors. We do not store your payment information.4.2. You agree to pay the total amount specified at the time of purchase, including any applicable taxes and fees.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '5. Privacy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '6.1. Your use of the App is subject to our Privacy Policy, which can be accessed [provide link to privacy policy].',
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    AlertDialog logOutAlert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Color(0xff131E34),
      title: Text(
        'Log Out',
        style: TextStyle(
            color: Colors.cyan[200],
            fontSize: 27.0,
            fontWeight: FontWeight.bold),
      ),
      content: Text(
        'Are you sure you want to log out',
        style: TextStyle(fontSize: 18.0),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'No',
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              SizedBox(
                width: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  });
                },
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                ),
              ),
            ],
          ),
        )
      ],
    );
    AlertDialog cartAlert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Color(0xff131E34),
      title: Text(
        'Cart is Empty',
        style: TextStyle(
            color: Colors.cyan[200],
            fontSize: 27.0,
            fontWeight: FontWeight.bold),
      ),
      content: Text(
        'Please add something in cart and then open it',
        style: TextStyle(fontSize: 18.0),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Text(
              'Ok',
              style: TextStyle(color: Colors.white, fontSize: 17.0),
            ),
          ),
        )
      ],
    );

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff131E34),
      appBar: AppBar(
        titleSpacing: 5.0,
        backgroundColor: Color(0xff131E34),
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.notes_sharp,
          size: 32.0,
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Text('Dashboard'),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                showDialog(context: context, builder: (context) => cartAlert);
              });
            },
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 35.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Icon(
              Icons.notifications_none,
              size: 35.0,
            ),
          ),
        ],
      ),
      body: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Swiper(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        discountBannerImages[index].toString(),
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Color(0xff131E34), color: Colors.white),
                  ),
                  autoplay: true,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              FutureBuilder(
                  future: fetchProductsData(),
                  builder: (context,
                      AsyncSnapshot<List<FakeStoreApiModels>> snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return SizedBox(
                          height: 300.0,
                          width: 300.0,
                          child: CircularProgressIndicator());
                    } else {
                      return Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CategoryName(
                                categoryName: 'Men\'s Clothing',
                              ),
                              SizedBox(
                                height: 250,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productsList.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, int index) {
                                    return ProductsOnDisplay(
                                        index: index,
                                        onPress: () {
                                          selectedBookIndex = index;
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookDetails(
                                                        displayBookIndex:
                                                            selectedBookIndex,
                                                        quantity: bookDetails
                                                            .quantity,
                                                      )),
                                            );
                                          });
                                        });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              CategoryName(
                                categoryName:
                                    'Men\'s Casual Premium Slim Fit T-Shirts ',
                              ),
                              SizedBox(
                                height: 250,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productsList.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, int index) {
                                    return ProductsOnDisplay(
                                        index: index,
                                        onPress: () {
                                          selectedBookIndex = index;
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookDetails(
                                                        displayBookIndex:
                                                            selectedBookIndex,
                                                        quantity: bookDetails
                                                            .quantity,
                                                      )),
                                            );
                                          });
                                        });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              CategoryName(categoryName: 'Mens Cotton Jacket'),
                              SizedBox(
                                height: 250,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productsList.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, int index) {
                                    return ProductsOnDisplay(
                                        index: index,
                                        onPress: () {
                                          selectedBookIndex = index;
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookDetails(
                                                        displayBookIndex:
                                                            selectedBookIndex,
                                                        quantity: bookDetails
                                                            .quantity,
                                                      )),
                                            );
                                          });
                                        });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              CategoryName(
                                  categoryName: 'Mens Casual Slim Fit'),
                              SizedBox(
                                height: 250,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productsList.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, int index) {
                                    return ProductsOnDisplay(
                                        index: index,
                                        onPress: () {
                                          selectedBookIndex = index;
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookDetails(
                                                        displayBookIndex:
                                                            selectedBookIndex,
                                                        quantity: bookDetails
                                                            .quantity,
                                                      )),
                                            );
                                          });
                                        });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.2)),
                  itemCount: productsList.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return ProductsOnDisplay(
                        index: index,
                        onPress: () {
                          selectedBookIndex = index;
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDetails(
                                        displayBookIndex: selectedBookIndex,
                                        quantity: bookDetails.quantity,
                                      )),
                            );
                          });
                        });
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (context) => termsAndConditionsDialog);
                  });
                },
                child: ListTile(
                  leading: Icon(
                    Icons.library_books,
                    size: 30.0,
                    color: Colors.cyan[200],
                  ),
                  title: Text(
                    'Terms and conditions',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Categories()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.category,
                    size: 30.0,
                    color: Colors.cyan[200],
                  ),
                  title: Text(
                    'Categories',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showDialog(
                        context: context, builder: (context) => logOutAlert);
                  });
                },
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 30.0,
                    color: Colors.cyan[200],
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        )
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.present_to_all_rounded),
            label: 'all items',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    ));
  }
}
