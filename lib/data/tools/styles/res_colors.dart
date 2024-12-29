import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResColors {
  static const Color backgroundColor = Colors.white;
  static const textBorder = Color.fromRGBO(0, 0, 0, 0.25);
  static const transparent = Colors.transparent;
  static const mainBackground = Color(0xffF5F5FD);
  static const primaryBlackText = Color(0xff010513);
  static const unSelectedText = Color(0xff939EC5);
  static const primaryColor = Color(0xffff6f03);
  static const primaryColorOpacity = Color(0xcdff6f03);
  static const primaryColorLight = Color(0xffc9a386);
  static const greyText = Color(0xff7B7E87);
  static const playingWave = Color(0xff4683FA);
  static const fixedWave = Color(0xffBAC2E2);
  static const Color borderColor = Color(0x70AEC2D1);
  static const Color secondaryText = Color(0xffABAFB6);


  static const Color colorLoginPageText = Color.fromRGBO(24, 24, 24, 1);
  static const Color colorLoginPageTextHint = Color.fromRGBO(203, 203, 203, 1);
  static const Color colorLoginPageForgetPassword =
  Color.fromRGBO(236, 197, 96, 1);

  // button colors
  static const Color colorButton = Color.fromRGBO(11, 139, 110, 1);
  static const Color colorButtonLightGrey = Color.fromRGBO(217, 217, 217, 1);

  static const Color colorButtonBlue = Color.fromRGBO(27, 211, 221, 1);
  static const Color chooseLoginType = Color.fromRGBO(64, 174, 149, 1);

  // app bar color
  static const Color colorAppBarText = Color.fromRGBO(1, 38, 80, 1);

  // Text colors
  static const Color colorBlack = Color.fromRGBO(0, 0, 0, 1);
  static const Color colorGrey = Color.fromRGBO(97, 97, 97, 1);

  // Timer Color
  static const Color colorTimer = Color.fromRGBO(19, 188, 127, 1);

  static const Color hintTextColor = Color(0xFF949494);

  static const Color black = Color(0xFF000000);

  static const Color white = Color(0xFFFFFFFF);

  static const Color redInText = Color(0xFFFF0000);
  static const Color blackWithOpacity = Color(0xffCBCBCB);

  static const Color grey = Colors.grey;
  static const Color greyLight = Color.fromRGBO(208, 213, 218, 1);
  static const Color greyAppDescription = Color.fromRGBO(101, 112, 119, 1);

  static const Color greenHigh = Colors.green;
  static const Color blue = Color.fromRGBO(71, 129, 209, 1);
  static const Color blueDark = Color.fromRGBO(59, 114, 167, 1);
  static const Color phoneBlue = Color.fromRGBO(0, 122, 255, 1);
  static const Color welcomeTextColor = Color.fromRGBO(99, 99, 100, 1);
  static const Color greyVeryLight = Color.fromRGBO(248, 249, 249, 1);
  static const Color phoneButton = Color.fromRGBO(179, 179, 179, 1);
  static const Color searchColor = Color.fromRGBO(118, 118, 128, 0.12);
  static const Color chatDateColor = Color.fromRGBO(245, 245, 245, 0.25);
  static const Color whiteLight = Color.fromRGBO(255, 255, 255, 0.7);
  static const Color transparentGrey = Color.fromRGBO(0, 0, 0, 0.5);




  static Color statusColors (String st) {
    switch (st) {
      case 'ACCEPTED' : return Colors.green;
      case 'REVISION' : return Colors.red;
      case 'REWORK_COMPLETED' : return Colors.yellow.shade600;
      case 'STEP_LEVEL_FINISHED' : return Colors.green;
    }
    return Colors.white;
  }

  static List<Color> colorBlur = [
    const Color.fromRGBO(13, 91, 180, 1),
    const Color.fromRGBO(5, 53, 109, 1),
  ];

  static Gradient chatGradient = LinearGradient(
    colors: chatBackground,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    tileMode: TileMode.mirror,
  );

  static List<Color> chatBackground = [
    const Color.fromRGBO(2, 99, 76, 1),
    const Color.fromRGBO(150, 185, 114, 1),
    const Color.fromRGBO(150, 185, 114, 0.8),
    const Color.fromRGBO(150, 185, 114, 0.7),
  ];

  static List<BoxShadow> shadowOne = [
    BoxShadow(
        color: ResColors.appColor.withOpacity(0.2),
        blurRadius: 8,
        offset: const Offset(0, 10),
        spreadRadius: 2)
  ];

  static List<BoxShadow> shadowTwo = [
    BoxShadow(
        color: ResColors.appColorDark.withOpacity(0.5),
        blurRadius: 20.r,
        spreadRadius: 4)
  ];

  static Color greyOp05 = const Color.fromRGBO(167, 167, 167, 0.7);

  static Color appColor = const Color.fromRGBO(11, 139, 110, 1);
  static Color appColorSomeLight = const Color.fromRGBO(11, 139, 110, 0.7);
  static Color appColorDark = const Color.fromRGBO(2, 99, 76, 1);
  static Color appColorLight = const Color.fromRGBO(11, 139, 110, 0.3);


  static Color stepRed = const Color.fromRGBO(242, 71, 36, 1);
  static Color stepYellow = const Color.fromRGBO(237, 196, 9, 1);
  static Color stepBlue = const Color.fromRGBO(9, 145, 237, 1);
  static Color stepGreen = const Color.fromRGBO(53, 173, 23, 1);

  static Color levelColor(String s) {
    switch (s) {
      case 'FINISHED' : return Colors.green;
      case 'IN_PROCESS' : return const Color.fromRGBO(237, 196, 9, 1);
    }
    return Colors.grey;
  }

  static Color getStepLevelColor(String s) {
    switch (s) {
      case 'ACCEPTED' : return stepGreen;
      case 'REWORK_COMPLETED' : return stepGreen;
      case 'STEP_LEVEL_FINISHED' : return stepGreen;
      case 'REJECTED' : return stepRed;
      case 'REVISION' : return stepYellow;
      case 'PAYMENT' : return stepBlue;
      case 'PAYMENT_SUCCESS' : return stepGreen;
      case 'PAYMENT_FAILED' : return stepRed;
    }

    return stepYellow;
  }



}
