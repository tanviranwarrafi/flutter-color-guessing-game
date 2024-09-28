import 'package:fluttertoast/fluttertoast.dart';
import 'package:tutorial/themes/colors.dart';

abstract class ToastPopup {
  static void onSuccess({required String message, required bool isTop}) {
    var length = Toast.LENGTH_LONG;
    var gravity = isTop ? ToastGravity.TOP : ToastGravity.BOTTOM;
    Fluttertoast.showToast(msg: message, textColor: white, gravity: gravity, toastLength: length, backgroundColor: success);
  }

  static void onWarning({required String message, required bool isTop}) {
    var length = Toast.LENGTH_LONG;
    var gravity = isTop ? ToastGravity.TOP : ToastGravity.BOTTOM;
    Fluttertoast.showToast(msg: message, textColor: white, gravity: gravity, toastLength: length, backgroundColor: warning);
  }
}
