import 'dart:developer';

import 'package:butter/pages/main_page/main_page.dart';
import 'package:butter/utils/constants.dart';
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
    log("Trying to login with user name $userName and password $password");
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage())
    );
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
                  width: 1
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
            width: 1
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
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          textStyle: TextStyle(
            fontSize: 20,
            fontFamily: MAIN_FONT_FAMILY,
          )
        ),
        onPressed: () {
          login();
        },
      ),
    );
  }
}
