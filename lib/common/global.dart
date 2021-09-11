import 'package:butter/models/user.dart';

class Global {
  static User? user;
  static String token = "";

  static Future init() async {
    print("Global variable initiated!");
  }
}