import 'package:butter/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController userNameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserNameTextField(userNameController),
              MaterialButton(
                child: Text("Login"),
                color: Colors.orange,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage())
                  );
                },
              ),
            ],
          ),
        )
    );
  }
}

class UserNameTextField extends StatelessWidget {

  final TextEditingController userNameController;
  UserNameTextField(this.userNameController);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          icon: Icon(Icons.people),
          labelText: "User name",
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1
              )
          )
      ),
      controller: userNameController,
    );
  }
}
