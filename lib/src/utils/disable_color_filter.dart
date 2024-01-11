import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;

class DisabledColorFilter extends StatelessWidget {
  const DisabledColorFilter({
    Key? key,
    required this.apply,
    required this.child,
  }) : super(key: key);

  final bool apply;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!apply) return child;

    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        funds.FunDsColors.colorNeutral500,
        BlendMode.srcIn,
      ),
      child: child,
    );
  }
}
