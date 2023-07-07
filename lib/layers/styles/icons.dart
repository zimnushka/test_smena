import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(AppIcons icon, {Key? key, this.color, this.size})
      : _icon = icon,
        super(key: key);
  final Color? color;
  final AppIcons _icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/${_icon.name}.svg',
      width: size ?? 20,
      height: size ?? 20,
      // ignore: deprecated_member_use
      color: color ?? Theme.of(context).iconTheme.color,
    );
  }
}

enum AppIcons { basket, eat }
