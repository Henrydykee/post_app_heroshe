import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../platform/color.dart';

class HerosheTextField extends StatelessWidget {
  final String? hinttitle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final String? prefixText;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final Color? cursorColor;
  final Color? borderColor;
  final bool readOnly;
  final int? maxLines;
  final double? fontSize;
  final TextAlign? align;
  final String? value;
  final EdgeInsetsGeometry? padding;
  final bool obscureText;
  final Function? onTap;
  final Function(String)? validator;

  HerosheTextField(
      {this.onTap,
        this.maxLength,
        this.obscureText = false,
        this.hinttitle,
        this.controller,
        this.keyboardType,
        this.prefix,
        this.suffix,
        this.prefixText,
        this.align,
        this.maxLines,
        this.padding,
        this.suffixIcon,
        this.inputFormatters,
        this.currentFocusNode,
        this.nextFocusNode,
        this.cursorColor,
        this.readOnly = false,
        this.fontSize,
        this.value,
        this.borderColor,
        this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: TextFormField(
          onTap: onTap as void Function()?,
          obscureText: obscureText,
          readOnly: readOnly,
          autofocus: true,
          controller: controller,
          maxLines: maxLines ?? 1,
          validator: validator as String? Function(String?)?,
          textAlign: align ?? TextAlign.left,
          keyboardType: keyboardType ?? TextInputType.text,
          cursorColor: cursorColor ?? HerosheColor.gray,
          focusNode: currentFocusNode,
          inputFormatters: inputFormatters,
          style: TextStyle(color: cursorColor, fontSize: 16),
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(nextFocusNode ?? FocusNode());
          },
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(nextFocusNode ?? FocusNode());
          },
          decoration: InputDecoration(
            contentPadding: padding ??
                EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
            hintText: hinttitle,
            counter: Text(""),
            fillColor: Color(0xFFF3F5F7),
            filled: true,
            //labelText: hinttitle,
            suffix: suffix,
            prefixText: prefixText,
            prefix: prefix,
            prefixStyle: TextStyle(color: Colors.black),
            labelStyle: TextStyle(fontSize: 16),
            border: OutlineInputBorder(
                borderSide:
                BorderSide(color: borderColor ?? HerosheColor.orange),
                borderRadius: BorderRadius.circular(3.0)),
            errorBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: borderColor ?? HerosheColor.orange),
                borderRadius: BorderRadius.circular(3.0)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: borderColor ?? HerosheColor.orange),
                borderRadius: BorderRadius.circular(3.0)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: HerosheColor.silver),
                borderRadius: BorderRadius.circular(3.0)),
          ),
        ));
  }
}

class PromocodeTextField extends StatelessWidget {
  final TextEditingController? contoller;
  final Function(String)? validator;

  const PromocodeTextField({
    this.validator,
    this.contoller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator as String? Function(String?)?,
      controller: contoller,
      cursorColor: HerosheColor.gray,
      decoration: InputDecoration(
        fillColor: Color(0xFFF3F5F7),
        filled: true,
        hintText: "Enter promo code",
        contentPadding: EdgeInsets.only(left: 10),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: HerosheColor.orange),
            borderRadius: BorderRadius.circular(3.0)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HerosheColor.orange),
            borderRadius: BorderRadius.circular(3.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HerosheColor.orange),
            borderRadius: BorderRadius.circular(3.0)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HerosheColor.silver),
            borderRadius: BorderRadius.circular(3.0)),
      ),
    );
  }
}