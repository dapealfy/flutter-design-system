import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FunDsIcon extends StatelessWidget {
  final String funDsIconography;
  final double size;
  final Color? color;

  const FunDsIcon({
    Key? key,
    required this.funDsIconography,
    required this.size,
    this.color,
  }) : super(key: key);

  FunDsIcon copyWith({double? size, Color? color}) {
    return FunDsIcon(
      key: key,
      funDsIconography: funDsIconography,
      size: size ?? this.size,
      color: color ?? this.color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      funDsIconography,
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
