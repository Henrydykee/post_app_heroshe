import 'package:flutter/material.dart';

import '../../platform/color.dart';

class HerosheText extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final Function? onTap;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final String? fontFamily;
  final double? height;
  final TextDecoration? decoration;

  HerosheText(
      {required this.title,
        this.color,
        this.size,
        this.fontWeight,
        this.align,
        this.decoration,
        this.fontFamily,
        this.height,
        this.maxLines,
        this.textOverflow,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Text(
        title!,
        maxLines: maxLines,
        overflow: textOverflow,
        textAlign: align,
        style: TextStyle(
          color: color ?? HerosheColor.black,
          fontSize: size ?? 15,
          fontFamily: fontFamily,
          fontFamilyFallback: ["Roboto"],
          height: height,
          decoration: decoration,
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
      ),
    );
  }
}

Widget herosheAmountWidget(
    {required String title, Color? color, double? size}) {
  return HerosheText(
    title: title,
    fontFamily: "Roboto",
    color: color,
    size: size,
    fontWeight: FontWeight.w500,
  );}