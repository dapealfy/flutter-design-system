import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AIcon extends StatelessWidget {
  final String funDsIconography;
  final double size;
  final Color? color;

  const AIcon({
    Key? key,
    required this.funDsIconography,
    required this.size,
    this.color,
  }) : super(key: key);

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
