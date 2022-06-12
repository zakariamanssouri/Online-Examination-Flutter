import 'dart:convert';
import 'dart:math';

import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_examination/Repositories/TestsRepository.dart';

import 'package:online_examination/Screens/SignUp/singup.dart';
import 'package:online_examination/Screens/TestsScreen/MainScreen.dart';
import 'package:online_examination/Services/LoginService.dart';
import 'package:online_examination/Services/TestService.dart';
import 'package:online_examination/components/ErroTextWidget.dart';
import 'package:online_examination/components/MainScreen/RowAllTestsWithButton.dart';
import 'package:online_examination/components/MainScreen/SearchField.dart';
import 'package:online_examination/components/MainScreen/TestCard.dart';
import 'package:online_examination/components/RoundedButton.dart';
import 'package:online_examination/components/already_have_an_account_check.dart';
import 'package:online_examination/components/rounded_input_field.dart';
import 'package:online_examination/components/rounded_password_field.dart';
import 'package:online_examination/components/text_field_container.dart';
import 'package:online_examination/constraints.dart';
import 'package:online_examination/models/Test.dart';
import 'package:online_examination/models/User.dart';
import 'package:provider/provider.dart';

import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = User();
  }

  bool loginSuccess = false;
  String errorMessage = "";

  User user = User();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedInputField(
            onChanged: (value) {
              setState(() {
                user.username = value;
              });
            },
            hintText: "Username",
            icon: Icons.person,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedFieldPassword(
            onchanged: (value) {
              user.password = value;
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          ErroTextWidget(errorMessage: errorMessage),

          //Login button
          RoundedButton(
              text: "LOGIN",
              press: () {
                // ignore: avoid_print
                LoginService loginService = new LoginService();

                loginService.login(user).then((value) {
                  print(value);
                  //get all tests

                  //get all tests

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainScreen(
                      user: user,
                    );
                  }));
                }).catchError((e) {
                  setState(() {
                    errorMessage = "Invalid Login or Password";
                    loginSuccess = false;
                  });
                });
              }),
          //Login button

          AlreadyHaveAnAccountCheck(
            login: true,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignUp();
              }));
            },
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
        ],
      ),
    );
  }
}

