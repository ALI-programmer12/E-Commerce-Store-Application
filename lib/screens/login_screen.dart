import 'package:ecommerce_book_store_app_bq/components/appBar_widget.dart';
import 'package:ecommerce_book_store_app_bq/components/button1.dart';
import 'package:ecommerce_book_store_app_bq/components/textField_widget.dart';
import 'package:ecommerce_book_store_app_bq/screens/dashboard_screen.dart';
import 'package:ecommerce_book_store_app_bq/utilities/accounts_list.dart';
import 'package:ecommerce_book_store_app_bq/utilities/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void dialog(String titleTxt, String contentTxt) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Color(0xff131E34),
              title: Text(
                titleTxt,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.cyan[200]),
              ),
              content: Text(
                contentTxt,
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Ok');
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250.0),
          child: AppBarWidget(
            imageLink: 'assets/images/login_screen_image.png',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: Color(0xff0EA680)),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Sign in to continue',
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Nanum Myeongjo',
                    color: Color(0xff0EA680)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFieldWidget(
                controller: email,
                hintText: 'Email',
                icon: Icon(
                  Icons.mail,
                  color: Color(0xff0EA680),
                ),
              ),
              TextFieldWidget(
                controller: password,
                hintText: 'Password',
                icon: Icon(
                  Icons.lock,
                  color: Color(0xff0EA680),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Button1(
                  btnText: 'Login',
                  onPress: () {
                    int i = 0;
                    setState(() {
                      while (i <= AccountsList.passwords.length - 1 &&
                          i <= AccountsList.emails.length - 1) {
                        if (email.text == AccountsList.emails[i] &&
                            password.text == AccountsList.passwords[i]) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardScreen()));
                          break;
                        } else if (email.text != AccountsList.emails[i] &&
                            password.text != AccountsList.passwords[i]) {
                          i++;
                        }
                      }
                      if (i == AccountsList.emails.length &&
                          i == AccountsList.passwords.length) {
                        dialog('Invalid Email or Password', 'Please Try Again');
                      }
                    });
                  }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text('Sign up',
                      textAlign: TextAlign.center, style: kLabelTxtStyle),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
