import 'package:flutter/material.dart';
import 'package:post_app_heroshe/core/presentation/widgets/text_holder.dart';

import '../../data/enums/type_enums.dart';
import '../../platform/color.dart';

class HerosheButton extends StatelessWidget {
  final String title;
  final Function? onTap;
  final Color? color;
  final bool? isDisabled;
  final Status? status;
  final Color? textColor;
  final Color? borderColor;
  final bool hasShadow;
  final double? fontSize;
  final Color? indicatorColor;

  const HerosheButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.fontSize,
    this.textColor,
    this.indicatorColor,
    this.borderColor,
    this.isDisabled = false,
    this.status,
    this.color,
    this.hasShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: isDisabled!
              ? HerosheColor.orange
              : (color ?? HerosheColor.orange),
          border: Border.all(
              color: borderColor ?? HerosheColor.gray.withOpacity(0.1))),
      child:TextButton(
        style: ButtonStyle(),
        // highlightColor: HerosheColor.white,
        onPressed: () {
          if (!isDisabled!) {
            onTap!();
          }
        },
        child: status != null && status == Status.LOADING
            ? Container(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                  indicatorColor ?? Colors.white),
              strokeWidth: 2.0,
            ))
            : Text(
          title,
          style: TextStyle(
              color: textColor ?? HerosheColor.black,
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class HerosheSecondaryButton extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final Color? color;
  final Status? status;
  final Color? textColor;

  const HerosheSecondaryButton(
      {Key? key,
        this.title,
        this.onTap,
        this.status,
        this.color,
        this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: HerosheColor.white,
      onTap: onTap as void Function()?,
      child: Container(
        decoration: BoxDecoration(
            color: color ?? HerosheColor.orange,
            borderRadius: BorderRadius.circular(2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 15),
          child: status != null && status == Status.LOADING
              ? Container(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2.0,
              ))
              : HerosheText(
            title: title,
            color: textColor ?? HerosheColor.black,
            size: 14,
          ),
        ),
      ),
    );
  }
}