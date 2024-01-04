import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Avatar extends StatelessWidget {
  /// The text to display as the avatar.
  final String? avatarText;

  /// The image from asset to display as the avatar.
  final String? imagePath;

  /// The image from network to display as the avatar.
  final String? imageUrl;

  /// use[FunDsColors]. The color with which to fill the round.
  final Color? backgroundColor;

  /// use[FunDsColors]. The default text color for text in the round.
  final Color? foregroundColor;
  final BoxBorder? border;

  /// The size of the avatar.
  final AvatarSize size;

  /// The shape of the avatar.
  final AvatarShape shape;

  /// Create FunDsAvatar of all types i.e. round,rectangle with different sizes.
  const Avatar({
    Key? key,
    this.avatarText,
    this.backgroundColor,
    this.foregroundColor,
    this.imagePath,
    this.imageUrl,
    this.size = AvatarSize.medium,
    this.shape = AvatarShape.round,
    this.border,
  })  : assert(
          (avatarText != null && imagePath == null && imageUrl == null) ||
              (avatarText == null && imagePath != null && imageUrl == null) ||
              (avatarText == null && imagePath == null && imageUrl != null),
          'You can only pass one of the avatarText, imagePath, imageUrl',
        ),
        super(key: key);

  /// Create Avatar with text.
  const Avatar.text({
    Key? key,
    required String avatarText,
    Color? backgroundColor,
    Color? foregroundColor,
    AvatarSize size = AvatarSize.medium,
    AvatarShape shape = AvatarShape.round,
    BoxBorder? border,
  }) : this(
          key: key,
          avatarText: avatarText,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          size: size,
          shape: shape,
          border: border,
        );

  /// Create Avatar with image from network.
  const Avatar.network({
    Key? key,
    required String imageUrl,
    Color? backgroundColor,
    Color? foregroundColor,
    AvatarSize size = AvatarSize.medium,
    AvatarShape shape = AvatarShape.round,
    BoxBorder? border,
  }) : this(
          key: key,
          imageUrl: imageUrl,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          size: size,
          shape: shape,
          border: border,
        );

  /// Create Avatar with image from asset.
  const Avatar.asset({
    Key? key,
    required String imagePath,
    Color? backgroundColor,
    Color? foregroundColor,
    AvatarSize size = AvatarSize.medium,
    AvatarShape shape = AvatarShape.round,
    BoxBorder? border,
  }) : this(
          key: key,
          imagePath: imagePath,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          size: size,
          shape: shape,
          border: border,
        );

  Avatar copyWith({
    String? avatarText,
    Color? backgroundColor,
    Color? foregroundColor,
    String? imagePath,
    String? imageUrl,
    AvatarSize? size,
    AvatarShape? shape,
    BoxBorder? border,
  }) {
    return Avatar(
      avatarText: avatarText ?? this.avatarText,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      imagePath: imagePath ?? this.imagePath,
      imageUrl: imageUrl ?? this.imageUrl,
      size: size ?? this.size,
      shape: shape ?? this.shape,
      border: border ?? this.border,
    );
  }

  String _getInitialsUserName(String text) {
    // Get initials from the user's name
    List<String> nameParts = text.split(' ');

    // Get the first two characters of each part (or the first character if only one part)
    String avatarText = '';
    if (nameParts.isNotEmpty) {
      for (int i = 0; i < nameParts.length && i < 2; i++) {
        avatarText += nameParts[i][0];
      }
    }
    return avatarText;
  }

  double get _borderRadius {
    switch (size) {
      case AvatarSize.xxs:
      case AvatarSize.xs:
        return 4;
      case AvatarSize.small:
      case AvatarSize.medium:
        return 8;
      case AvatarSize.large:
      case AvatarSize.xl:
      case AvatarSize.xxl:
        return 12;
      default:
        return 8;
    }
  }

  TextStyle get textStyle {
    switch (size) {
      case AvatarSize.xxs:
        return FunDsTypography.body10B.copyWith(color: foregroundColor);
      case AvatarSize.xs:
        return FunDsTypography.body12B.copyWith(color: foregroundColor);
      case AvatarSize.small:
        return FunDsTypography.heading14.copyWith(color: foregroundColor);
      case AvatarSize.medium:
        return FunDsTypography.heading16.copyWith(color: foregroundColor);
      case AvatarSize.large:
        return FunDsTypography.body18B.copyWith(color: foregroundColor);
      case AvatarSize.xl:
        return FunDsTypography.heading20.copyWith(color: foregroundColor);
      case AvatarSize.xxl:
        return FunDsTypography.heading24.copyWith(color: foregroundColor);
      default:
        return FunDsTypography.heading16.copyWith(color: foregroundColor);
    }
  }

  BoxShape get _avatarBoxShape {
    if (shape == AvatarShape.round) {
      return BoxShape.circle;
    } else if (shape == AvatarShape.rectangle) {
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
        minHeight: size.value,
        minWidth: size.value,
        maxWidth: size.value,
        maxHeight: size.value,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        image: imagePath != null
            ? DecorationImage(
                image: AssetImage(imagePath!),
                fit: BoxFit.cover,
              )
            : null,
        shape: _avatarBoxShape,
        border: border,
        borderRadius: shape == AvatarShape.rectangle
            ? BorderRadius.circular(_borderRadius)
            : null,
      ),
      child: avatarText != null

          /// Text Avatar
          ? Center(
              child: Text(
                _getInitialsUserName(avatarText ?? ''),
                style: textStyle,
              ),
            )
          : (imageUrl != null)
              ? CachedNetworkImage(
                  imageUrl: imageUrl!,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      image: imageUrl != null
                          ? DecorationImage(
                              image: CachedNetworkImageProvider(imageUrl!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      shape: _avatarBoxShape,
                      border: border,
                      borderRadius: shape == AvatarShape.rectangle
                          ? BorderRadius.circular(_borderRadius)
                          : null,
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                      color: FunDsColors.colorNeutral200,
                      shape: _avatarBoxShape,
                      border: border,
                      borderRadius: shape == AvatarShape.rectangle
                          ? BorderRadius.circular(_borderRadius)
                          : null,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        FunDsIconography.icAvatar,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
    );
  }
}
