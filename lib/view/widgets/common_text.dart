import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText({super.key, required this.text, this.color, this.fontWeight, this.size, this.style});
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: style ?? TextStyle(color: color, fontSize: size, fontWeight: fontWeight) ,);
  }
}