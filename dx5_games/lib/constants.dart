
import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xFF17344d);

const kPrimaryLightGrey = Color(0xFFD4D4D4);

const kTextColorBlack = Color(0xFF000000);

const kTextColorGrey = Color(0xFF9E9E9E);

const kDeleteColor = Color(0xFF880808);
const kSuccessGreen = Color(0xFF4CAF50);

verticalSpace({required double height}){
  return SizedBox(height: height,);
}

horizontalSpace({required double width}){
  return SizedBox(width: width,);
}

//REUSABLE TEXT STYLE BLUEPRINT
TextStyle kDescriptionTextStyle(
  double fontSize,
) {
  return TextStyle(
      color: kTextColorBlack.withOpacity(0.7),
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis);
}

TextStyle kBoldBlackTextStyle(
  double fontSize,
) {
  return TextStyle(
      color: kTextColorBlack, fontSize: fontSize, fontWeight: FontWeight.bold);
}

TextStyle kBoldGreyTextStyle(
  double fontSize,
) {
  return TextStyle(
      color: kTextColorGrey, fontSize: fontSize, fontWeight: FontWeight.bold);
}

networkSnackBar(context, message, isSuccess, int duration) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SizedBox(width: 8),
            Icon(
              isSuccess ? Icons.wifi : Icons.signal_wifi_off,
              color: kPrimaryLightGrey,
            )
          ],
        ),
        duration: Duration(seconds: duration),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isSuccess ? kSuccessGreen : kDeleteColor,
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 10,
          right: 10,
        ),
      ),
    );
