import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:kazandirio/core/extension/context_extension.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  final Widget? child;
  final Color? textColor;
  final FontWeight? textWeight;
  final Color? backgroundColor;
  final Color? borderColor;
  final Function()? onPressed;

  const CustomButton(
      {Key? key,
      this.text,
      this.child,
      this.textColor,
      this.backgroundColor,
      this.borderColor,
      required this.onPressed,
      this.height,
      this.width, this.textWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.dynamicWidth(1),
      height: height ,
      padding: EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
          onPressed: onPressed ?? () {},
          child: text != null
              ? CustomText(text!, color: textColor ?? context.themeData.primaryColor, fontWeight: textWeight ?? FontWeight.normal)
              : child,
          style: ElevatedButton.styleFrom(
              primary: backgroundColor ?? context.themeData.colorScheme.primaryVariant,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ))),
    );
  }
}
