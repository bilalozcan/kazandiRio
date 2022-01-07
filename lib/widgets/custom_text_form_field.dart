import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? icon;
  const CustomTextFormField(this.controller,{Key? key, this.hintText, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        cursorColor: context.themeData.colorScheme.primaryVariant,
        style: TextStyle(color: context.themeData.colorScheme.primaryVariant),
        decoration: InputDecoration(
          hintText: hintText ?? '',
            hintStyle: TextStyle(color: context.themeData.colorScheme.primaryVariant),
            prefixIcon: Icon(icon, color: context.themeData.colorScheme.primaryVariant),
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                BorderSide(color: context.themeData.colorScheme.primaryVariant)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                BorderSide(color: context.themeData.colorScheme.primaryVariant)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                BorderSide(color: context.themeData.colorScheme.primaryVariant))
        ),
      ),
    );
  }
}
