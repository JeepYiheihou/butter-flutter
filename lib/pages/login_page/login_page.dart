import 'dart:convert';

import 'package:butter/common/global.dart';
import 'package:butter/models/user.dart';
import 'package:butter/pages/components/button_style.dart';
import 'package:butter/pages/components/toast.dart';
import 'package:butter/pages/main_page/main_page.dart';
import 'package:butter/utils/constants.dart';
import 'package:butter/utils/network.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String userName = "";
  String password = "";

  void updateUserName(String value) {
    setState(() {
      this.userName = value;
    });
  }

  void updatePassword(String value) {
    setState(() {
      this.password = value;
    });
  }

  void login() {
    if (userName == "") {
      ButterToast.showToast(
        context,
        "Hey what's your name?",
      );
      return;
    }

    if (password == "") {
      ButterToast.showToast(
        context,
        "Hey I need your password (´・ω・｀)",
      );
      return;
    }

    String url = ButterHttpUtils.generateLoginUrl();
    Map userNamePasswordMap = {
      "name": userName,
      "password": password,
    };

    ButterHttpUtils.request(
      url,
      method: "POST",
      data: jsonEncode(userNamePasswordMap),
    ).then((res) {
      // If login succeeded, then update user data from res.
      final data = res.data;
      Global.user = User.fromMap(data["user"]);
      Global.token = data["token"];

      // Then navigate to main page.
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage())
      );
    }).catchError((err) {
      ButterToast.showToast(
        context,
        "Ooops cannot log in. Check your user name and password?"
      );
      print(err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserNameTextField(updateUserName),
                SizedBox(height: 7),
                PasswordTextField(updatePassword),
                SizedBox(height: 7),
                LoginButton(login),
              ],
            ),
          )
        )
    );
  }
}

class UserNameTextField extends StatelessWidget {

  final updateUserName;
  UserNameTextField(this.updateUserName);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.people),
          labelText: "User name",
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 10
              )
          )
      ),
      onChanged: (value) {
        updateUserName(value);
      },
    );
  }
}

class PasswordTextField extends StatelessWidget {

  final updatePassword;
  PasswordTextField(this.updatePassword);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: "Password",
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 10
          )
        )
      ),
      onChanged: (value) {
        updatePassword(value);
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  final login;
  LoginButton(this.login);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child: Text("Login"),
        style: ButterButtonStyle.mainThemeButtonStyle(),
        onPressed: () {
          login();
        },
      ),
    );
  }
}
