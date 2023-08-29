import 'package:ecommerce_book_store_app_bq/components/appBar_widget.dart';
import 'package:ecommerce_book_store_app_bq/components/button1.dart';
import 'package:ecommerce_book_store_app_bq/components/textField_widget.dart';
import 'package:ecommerce_book_store_app_bq/screens/login_screen.dart';
import 'package:ecommerce_book_store_app_bq/utilities/accounts_list.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController newEmail = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  void dialogBox(String titleTxt, String contentTxt) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              backgroundColor: Color(0xff131E34),
              title: Text(
                titleTxt,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[200],
                    fontSize: 25.0),
              ),
              content: Text(
                contentTxt,
                style: TextStyle(fontSize: 20.0),
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
          preferredSize: Size.fromHeight(200.0),
          child: AppBarWidget(
            imageLink: 'assets/images/sign_up_screen_image.png',
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
              child: Text(
                'Create New\naccount',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Color(0xff0EA680)),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Registered?',
                  style:
                      TextStyle(fontFamily: 'Nanum Myeongjo', fontSize: 15.0),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    });
                  },
                  child: Text(
                    ' Login',
                    style: TextStyle(color: Color(0xff0EA680), fontSize: 17.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFieldWidget(
              hintText: 'Name',
              icon: Icon(
                Icons.person,
                color: Color(0xff0EA680),
              ),
            ),
            TextFieldWidget(
              controller: newEmail,
              hintText: 'Email',
              icon: Icon(
                Icons.mail,
                color: Color(0xff0EA680),
              ),
            ),
            TextFieldWidget(
              controller: newPassword,
              hintText: 'Password',
              icon: Icon(
                Icons.lock,
                color: Color(0xff0EA680),
              ),
            ),
            Button1(
                btnText: 'Sign up',
                onPress: () {
                  int i = 0;
                  setState(() {
                    while (i <= AccountsList.emails.length - 1 &&
                        i <= AccountsList.passwords.length - 1) {
                      if (newEmail.text == AccountsList.emails[i] &&
                          newPassword.text == AccountsList.passwords[i]) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                        dialogBox('Already Have an account',
                            'Please enter email and password again');
                        break;
                      } else if (newEmail.text == AccountsList.emails[i] ||
                          newPassword.text == AccountsList.passwords[i]) {
                        dialogBox('Try again',
                            'Email or password has been registered');
                        break;
                      } else if (newEmail.text == '' ||
                          newPassword.text == '') {
                        dialogBox(
                            'Invalid Email and Password', 'Please try again');
                        break;
                      } else {
                        i++;
                      }
                    }
                    if (i == AccountsList.emails.length &&
                        i == AccountsList.passwords.length) {
                      AccountsList.emails.add(newEmail.text);
                      AccountsList.passwords.add(newPassword.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                  });
                }),
          ]),
        ),
      ),
    );
  }
}
