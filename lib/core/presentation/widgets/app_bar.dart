import 'package:flutter/material.dart';
import 'package:post_app_heroshe/core/presentation/widgets/text_holder.dart';

import '../../platform/color.dart';

class HerosheAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool showBackIcon;
  final Color? iconColor;
  final Function? ontap;
  final Widget? actionWidget;

  const HerosheAppBar(
      {this.title,
        this.ontap,
        this.iconColor,
        this.actionWidget,
        this.backgroundColor,
        this.titleColor,
        this.showBackIcon = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: backgroundColor ?? HerosheColor.bondi_blue,
      leading: Visibility(
        visible: showBackIcon,
        child: InkWell(
          highlightColor: Colors.transparent,
          onTap: ontap as void Function()? ?? () => Navigator.of(context).pop(),
          child: Icon(
            Icons.chevron_left,
            size: 40,
            color: iconColor ?? HerosheColor.white,
          ),
        ),
      ),
      title: HerosheText(
        title: title ?? "",
        color: titleColor ?? HerosheColor.white,
        size: 18,
      ),
      actions: [actionWidget ?? SizedBox()],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => new Size(25, 50);
}