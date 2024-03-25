import 'package:flutter/widgets.dart';

class ButtonContent extends StatelessWidget {
  final Widget? icon;
  final String text;
  final TextStyle textStyle;

  const ButtonContent({
    super.key,
    required this.text,
    required this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) ...[
          icon!,
          const SizedBox(width: 4),
        ],
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
