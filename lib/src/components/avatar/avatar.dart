import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FunDsAvatar extends StatelessWidget {
  /// The text to display as the avatar.
  final String? initialText;

  /// Typically [Svg] widget.
  /// If the [FunDsAvatar] is to have an image, used [backgroundImage] instead.
  final Widget? child;

  /// use[FunDsColors]. The color with which to fill the circle.
  final Color? backgroundColor;

  /// use[FunDsColors]. The default text color for text in the round.
  final Color? foregroundColor;

  final BoxBorder? border;

  /// The background image of the circle.
  final ImageProvider? backgroundImage;
  final double size;
  final FunDsAvatarShape shape;

  /// Create FunDsAvatar of all types i.e. round,rectangle with different sizes.
  const FunDsAvatar({
    Key? key,
    this.initialText,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.backgroundImage,
    this.size = FunDsAvatarSize.medium,
    this.shape = FunDsAvatarShape.round,
    this.border,
  }) : super(key: key);

  FunDsAvatar copyWith({
    Widget? child,
    Color? backgroundColor,
    Color? foregroundColor,
    BoxBorder? border,
    ImageProvider? backgroundImage,
    double? size,
    FunDsAvatarShape? shape,
  }) {
    return FunDsAvatar(
      key: key,
      child: child ?? this.child,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      border: border ?? this.border,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      size: size ?? this.size,
      shape: shape ?? this.shape,
    );
  }

  String _getInitials(String text) {
    if (text.length >= 2) {
      return text.substring(0, 2).toUpperCase();
    } else {
      return '';
    }
  }

  double get _borderRadius {
    if (size == FunDsAvatarSize.xxs || size == FunDsAvatarSize.xs) {
      return 4;
    } else if (size == FunDsAvatarSize.small ||
        size == FunDsAvatarSize.medium) {
      return 8;
    } else if (size == FunDsAvatarSize.large ||
        size == FunDsAvatarSize.xl ||
        size == FunDsAvatarSize.xxl) {
      return 12;
    } else {
      return 8;
    }
  }

  double get _iconSize {
    if (size == FunDsAvatarSize.xxs) {
      return 8;
    } else if (size == FunDsAvatarSize.xs) {
      return 10;
    } else if (size == FunDsAvatarSize.small) {
      return 14;
    } else if (size == FunDsAvatarSize.medium) {
      return 17;
    } else if (size == FunDsAvatarSize.large) {
      return 22;
    } else if (size == FunDsAvatarSize.xl) {
      return 24;
    } else if (size == FunDsAvatarSize.xxl) {
      return 30;
    } else {
      return 17;
    }
  }

  TextStyle get _textStyle {
    if (size == FunDsAvatarSize.xxs) {
      return FunDsTypography.body10B.copyWith(
        color: foregroundColor,
      );
    } else if (size == FunDsAvatarSize.xs) {
      return FunDsTypography.body12B.copyWith(
        color: foregroundColor,
      );
    } else if (size == FunDsAvatarSize.small) {
      return FunDsTypography.heading14.copyWith(
        color: foregroundColor,
      );
    } else if (size == FunDsAvatarSize.medium) {
      return FunDsTypography.heading16.copyWith(
        color: foregroundColor,
      );
    } else if (size == FunDsAvatarSize.large) {
      return FunDsTypography.body18B.copyWith(
        color: foregroundColor,
      );
    } else if (size == FunDsAvatarSize.xl) {
      return FunDsTypography.heading20.copyWith(
        color: foregroundColor,
      );
    } else if (size == FunDsAvatarSize.xxl) {
      return FunDsTypography.heading24.copyWith(
        color: foregroundColor,
      );
    } else {
      return FunDsTypography.heading16.copyWith(
        color: foregroundColor,
      );
    }
  }

  BoxShape get _avatarShape {
    if (shape == FunDsAvatarShape.round) {
      return BoxShape.circle;
    } else if (shape == FunDsAvatarShape.rectangle) {
      return BoxShape.rectangle;
    } else {
      return BoxShape.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color? backgroundColor = this.backgroundColor;
    return Container(
      constraints: BoxConstraints(
        minHeight: size,
        minWidth: size,
        maxWidth: size,
        maxHeight: size,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        image: backgroundImage != null
            ? DecorationImage(
                image: backgroundImage!,
                fit: BoxFit.cover,
              )
            : null,
        shape: _avatarShape,
        border: border,
        borderRadius: shape == FunDsAvatarShape.rectangle
            ? BorderRadius.circular(_borderRadius)
            : null,
      ),
      child: child == null && initialText != null

          /// Text Avatar
          ? Center(
              child: Text(
                _getInitials(initialText ?? ''),
                style: _textStyle,
              ),
            )
          : (child == null)
              ? null

              /// Icon Avatar
              : Center(
                  child: SizedBox(
                    width: _iconSize,
                    height: _iconSize,
                    child: child!,
                  ),
                ),
    );
  }
}
