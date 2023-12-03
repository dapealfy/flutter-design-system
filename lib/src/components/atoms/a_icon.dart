import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AIcon extends StatelessWidget {
  final String funDsIconography;
  final double size;

  const AIcon({Key? key, required this.funDsIconography, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      funDsIconography,
      width: size,
      height: size,
    );
  }
}
