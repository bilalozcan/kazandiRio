import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const CustomText(this.data, {Key? key, this.fontSize, this.fontWeight, this.color, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign ?? null,
      style: TextStyle(
        color: color ?? Colors.black,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
