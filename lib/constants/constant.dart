import 'package:fluttertoast/fluttertoast.dart';

bool isConnected;

/*
 * gravity: TOP || BOTTOM || CENTER || TOP_LEFT || TOP_RIGHT || BOTTOM_LEFT || BOTTOM_RIGHT || CENTER_LEFT || CENTER_RIGHT || SNACKBAR
 
 * toastLength: LENGTH_SHORT || LENGTH_LONG
 */
void showToast(String message, String length, String gravity, backgroundColor,
    textColor, fontSize) {
  Fluttertoast.showToast(
      msg: message,
      toastLength:
          length == 'LENGTH_SHORT' ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: gravity == 'TOP'
          ? ToastGravity.TOP
          : gravity == 'BOTTOM'
              ? ToastGravity.BOTTOM
              : gravity == 'CENTER'
                  ? ToastGravity.CENTER
                  : gravity == 'TOP_LEFT'
                      ? ToastGravity.TOP_LEFT
                      : gravity == 'TOP_RIGHT'
                          ? ToastGravity.TOP_RIGHT
                          : gravity == 'BOTTOM_LEFT'
                              ? ToastGravity.BOTTOM_LEFT
                              : gravity == 'BOTTOM_RIGHT'
                                  ? ToastGravity.BOTTOM_RIGHT
                                  : gravity == 'CENTER_LEFT'
                                      ? ToastGravity.CENTER_LEFT
                                      : gravity == 'CENTER_RIGHT'
                                          ? ToastGravity.CENTER_RIGHT
                                          : ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize);
}
