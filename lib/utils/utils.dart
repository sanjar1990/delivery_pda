import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void showSuccessToast(BuildContext context, String message) {
  showToast(
    message,
    context: context,
    position: StyledToastPosition.top,
    backgroundColor: Colors.green,
    reverseAnimation: StyledToastAnimation.scale,
    animation: StyledToastAnimation.scale,
    textStyle: TextStyle(color: Colors.white, fontSize: 16),
    duration: Duration(seconds: 2),
  );
}

void showErrorToast(BuildContext context, String message) {
  showToast(
    message,
    context: context,
    position: StyledToastPosition.top,reverseAnimation: StyledToastAnimation.scale,
    animation: StyledToastAnimation.fadeScale,
    backgroundColor: Colors.red,
    textStyle: TextStyle(color: Colors.white, fontSize: 16),
    duration: Duration(seconds: 2),
  );
}
