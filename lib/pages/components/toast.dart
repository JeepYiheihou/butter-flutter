import 'package:butter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButterToast {
  static void showToast(BuildContext context, String msg) {
    final fToast = FToast();
    final radiusSize = 10.0;
    fToast.init(context);
    Widget toast = Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusSize),
          topRight: Radius.circular(radiusSize)
        ),
        color: TOAST_BACKGROUND_COLOR,
      ),
      child: Text(
        msg,
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );

    fToast.showToast(
      child: toast,
      toastDuration: Duration(seconds: 2),
      gravity: ToastGravity.SNACKBAR,
    );
  }
}